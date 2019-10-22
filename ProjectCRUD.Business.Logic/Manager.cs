using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProjectCRUD.Business.Logic.Domain;
using ProjectCRUD.Business.Logic;
namespace ProjectCRUD.Business.Logic
{
    public class Manager
    {
        dbCollegeEntities _db;
        public Manager()
        {
            _db = new dbCollegeEntities();
        }
        //Create function to save new record into database.
        public int SaveStudentRecords(tblStudentRecord model)
        {
            int id = 0;
            try
            {
                int Count = _db.tblStudentRecords.Where(a => a.Name == model.Name && a.RollNo == model.RollNo).Count();
                if (Count == 0)
                {
                    _db.tblStudentRecords.Add(model);
                    _db.SaveChanges();
                    id = model.ID;
                }
                else
                {
                    id = -1;
                }
            }
            catch (Exception a1)
            {

            }
            return id;

        }
        //Create List to get student record.
        public List<tblStudentRecord> GetStudentRecords()
        {
            List<tblStudentRecord> lst = new List<tblStudentRecord>();
            try
            {
                lst = _db.tblStudentRecords.OrderByDescending(a => a.ID).ToList();
            }
            catch (Exception a1)
            {

            }
            return lst;
        }

        //Create function to delete record from database.
        public bool DeleteStudentRecordById(int id)
        {
            bool status = false;
            try
            {
                tblStudentRecord tblStudentRecord = _db.tblStudentRecords.Where(a => a.ID == id).FirstOrDefault();
                if (tblStudentRecord != null)
                {
                    _db.tblStudentRecords.Remove(tblStudentRecord);
                    _db.SaveChanges();
                    status = true;
                }
            }
            catch (Exception a1)
            { }
            return status;
        }

        public tblStudentRecord GetStudentRecordByID(int id)
        {
            tblStudentRecord tblStudentRecord = _db.tblStudentRecords.Where(a => a.ID == id).FirstOrDefault();
            return tblStudentRecord;
        }

        public string UpdateStudentRecord(tblStudentRecord model)
        {
            string result = string.Empty;
            try
            {
                int count = _db.tblStudentRecords.Where(a => a.ID != model.ID && a.RollNo == model.RollNo).Count();
                if (count > 0)
                {
                    result = "-1";
                    return result;
                }

                tblStudentRecord data = _db.tblStudentRecords.Where(a => a.ID == model.ID).FirstOrDefault();
                if (data != null)
                {
                    data.Address = model.Address;
                    data.City = model.City;
                    data.Email = model.Email;
                    data.LastUpdatedDate = model.LastUpdatedDate;
                    data.Name = model.Name;
                    data.Phone = model.Phone;
                    data.RollNo = model.RollNo;
                    data.State = model.State;
                    data.ClassId = model.ClassId;
                    _db.SaveChanges();
                    result = "1";
                }
            }
            catch (Exception a1)
            {

            }
            return result;
        }

        //Create function to get class table data from database.
        public List<tblClass> GetTblClasses()
        {
            List<tblClass> lst = new List<tblClass>();
            try
            {
                lst = _db.tblClasses.ToList();
            }
            catch (Exception a1)
            {

            }
            return lst;
        }

        //create function to get teacher table data from database.
        public List<tblTeacher> GetTeacherByID(int classId)
        {
            List<tblTeacher> tblTeacher = new List<tblTeacher>();
            try
            {
                tblTeacher = _db.tblTeachers.Where(a => a.ClassId == classId).ToList();
            }
            catch (Exception a1)

            {
            }
            return tblTeacher;
        }
    }
}
