using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectCRUD.Business.Logic;
using ProjectCRUD.Business.Logic.Domain;

namespace ProjectCRUD
{
    public partial class StudentData : System.Web.UI.Page
    {
        //Craete object of Manager class.
        //In Manager class we can create Functions of Save,Update,Delete & Read the Student Record.
        Manager mm;

        public StudentData()
        {
            mm = new Manager();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bind_showStudentRecords();
                bind_classes();
            }
        }

        //Create Method to Bind the data of Class from DataBase.
        public void bind_classes()
        {
            ddl_class.DataSource = mm.GetTblClasses();
            ddl_class.DataTextField = "ClassName";
            ddl_class.DataValueField = "Id";
            ddl_class.DataBind();
            ddl_class.Items.Insert(0, new ListItem("--Please Select Class--", "0"));
        }

        //Create Method to Bind the data of StudentRecord from Databse.
        public void bind_showStudentRecords()
        {
            List<tblStudentRecord> lst_records = mm.GetStudentRecords();
            if(lst_records != null && lst_records.Count > 0)
            {
                grd_ShowView.DataSource = lst_records;
                grd_ShowView.DataBind();
            }
            else

            {
                grd_ShowView.DataSource = null;
                grd_ShowView.DataBind();

            }
        }

        //Create the ClickEvent of Save Button to Save the New Data.
        protected void btn_save_Click(object sender, EventArgs e)
        {
            lbl_result.Text = string.Empty;

            tblStudentRecord tblStudentRecord = new tblStudentRecord();
            tblStudentRecord.Name = txt_name.Text.Trim();
            tblStudentRecord.RollNo = txt_rollNo.Text.Trim();
            tblStudentRecord.Address = txt_address.Text.Trim();
            tblStudentRecord.City = txt_city.Text.Trim();
            tblStudentRecord.Email = txt_email.Text.Trim();
            tblStudentRecord.IsActive = true;
            tblStudentRecord.Phone = txt_phone.Text.Trim();
            tblStudentRecord.State = txt_state.Text.Trim();
            tblStudentRecord.LastUpdatedDate = DateTime.UtcNow;
            tblStudentRecord.ClassId = Convert.ToInt32(ddl_class.SelectedValue);
            if(btn_save.CommandName == "add")
            {
                tblStudentRecord.CreatedDate = DateTime.UtcNow;
                int id = mm.SaveStudentRecords(tblStudentRecord);
                if (id > 0)
                {
                    Clear();
                    pnl_saveData.Visible = false;
                    pnl_showGrid.Visible = true;
                    Page.Response.Redirect(Page.Request.Url.ToString(), true);
                   // bind_showStudentRecords();
                }
                else if (id == -1)
                {
                    lbl_result.Text = "Student Detail Already Exist";
                    lbl_result.ForeColor = System.Drawing.Color.Red;
                    lbl_result.Focus();
                }
                else
                {
                    lbl_result.Text = "Error in adding student detail";
                    lbl_result.ForeColor = System.Drawing.Color.Red;
                    lbl_result.Focus();
                }
            }
            // Create the ClickEvent of Update Button to Update the Existing Records.
            else if(btn_save.CommandName == "update")
            {
                tblStudentRecord.ID = Convert.ToInt32(btn_save.CommandArgument);
                string result  = mm.UpdateStudentRecord(tblStudentRecord);
                if(result == "1")
                {
                    Clear();
                    pnl_saveData.Visible = false;
                    pnl_showGrid.Visible = true;
                    bind_showStudentRecords();
                }
                else if(result == "-1")
                {
                    lbl_result.Text = "This Roll No is already exist";
                    lbl_result.ForeColor = System.Drawing.Color.Red;
                    lbl_result.Focus();
                }
            }
        }

        //Create Method of Clear textboxes ater data is saved when click with save button.
        public void Clear()
        {
            btn_save.CommandName = "add";
            btn_save.Text = "Save";
            txt_address.Text = string.Empty;
            txt_city.Text = string.Empty;
            txt_email.Text = string.Empty;
            txt_name.Text = string.Empty;
            txt_phone.Text = string.Empty;
            txt_rollNo.Text = string.Empty;
            txt_state.Text = string.Empty;
            ddl_class.SelectedValue = "0";
            div_teacher.Style.Add("display", "none");
        }

        protected void btn_addNewRecord_Click(object sender, EventArgs e)
        {
            pnl_saveData.Visible = true;
            pnl_showGrid.Visible = false;
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            pnl_showGrid.Visible = true;
            pnl_saveData.Visible = false;
            Clear();
        }

        //Gridview Eventfire to show full record of student.
        protected void grd_ShowView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = 0;
            Int32.TryParse(e.CommandArgument.ToString(), out id);
            if (e.CommandName == "edt")
            {
                btn_save.CommandArgument = id.ToString();
                btn_save.CommandName = "update";
                btn_save.Text = "Update";
                tblStudentRecord data = mm.GetStudentRecordByID(id);
                if(data != null)
                {
                    pnl_saveData.Visible = true;
                    pnl_showGrid.Visible = false;

                    txt_address.Text = data.Address;
                    txt_city.Text = data.City;
                    txt_email.Text = data.Email;
                    txt_name.Text = data.Name;
                    txt_phone.Text = data.Phone;
                    txt_rollNo.Text = data.RollNo;
                    txt_state.Text = data.State;
                    if (data.ClassId > 0)
                    {
                        ddl_class.SelectedValue = data.ClassId.ToString();
                        div_teacher.Style.Add("display", "block");
                        ddl_teacher.DataSource = mm.GetTeacherByID(data.ClassId.Value);
                        ddl_teacher.DataTextField = "TeacherName";
                        ddl_teacher.DataValueField = "Id";
                        ddl_teacher.DataBind();
                        ddl_teacher.Enabled = false;
                    }
                   
                }
            }
            //Create method to delete the record.
            else if (e.CommandName == "dlt")
            {
                bool status = mm.DeleteStudentRecordById(id);
                if(status == true)
                {
                    bind_showStudentRecords();
                }

            }
        }

       
        //EventFired of DropDownList to bind DropdownList Data.
        protected void ddl_class_SelectedIndexChanged(object sender, EventArgs e)
        {
            div_teacher.Style.Add("display", "block");
            int id = Convert.ToInt32(ddl_class.SelectedValue);
            if(id > 0)
            {
                ddl_teacher.DataSource = mm.GetTeacherByID(id);
                ddl_teacher.DataTextField = "TeacherName";
                ddl_teacher.DataValueField = "Id";
                ddl_teacher.DataBind();
                ddl_teacher.Enabled = false;
            }
        }
    }
}