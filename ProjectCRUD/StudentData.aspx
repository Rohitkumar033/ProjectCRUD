<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentData.aspx.cs" Inherits="ProjectCRUD.StudentData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        .formSaveData {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container formSaveData">


            <asp:Panel ID="pnl_showGrid" runat="server" Visible="true">
                <div class="row">
                    <div class="col-sm-6 col-lg-6">
                        <h2>STUDENT RECORDS</h2>
                    </div>
                    <div class="col-sm-6 col-lg-6">

                        <asp:Button runat="server" ID="btn_addNewRecord" Text="Add New Record" OnClick="btn_addNewRecord_Click" CssClass="btn btn-info" Style="float: right; margin-top: 25px;" />

                    </div>
                </div>

                <asp:GridView ID="grd_ShowView" runat="server" OnRowCommand="grd_ShowView_RowCommand" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" PageSize="5">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerSettings FirstPageText="" LastPageText="" NextPageText="" PreviousPageText="" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="RollNo" HeaderText="RollNo" />
                        <asp:TemplateField HeaderText="Class">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbl_class" Text='<%# Eval("tblClass.ClassName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="State" HeaderText="State" />

                        <asp:BoundField DataField="IsActive" HeaderText="IsActive" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_edit" CssClass="btn btn-info" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="edt" Text="edit" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_delete" CssClass="btn btn-danger" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="dlt" OnClientClick="return confirm('Are You Sure?');" Text="delete" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <span style="color: red">No Records Found!</span>
                    </EmptyDataTemplate>
                </asp:GridView>
            </asp:Panel>

            <asp:Panel ID="pnl_saveData" runat="server" Visible="false">

                <h2 style="margin: 0 auto; display: table">Student Detail Form</h2>
                <div class="form-group">
                    <label>Name :</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_name"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txt_name" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a" ErrorMessage="Please enter your name!" />
                </div>
                <div class="form-group">
                    <label>Roll No. :</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_rollNo"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_rollNo" ValidationGroup="a" ErrorMessage="Please Enter Only Numbers" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>

                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txt_rollNo" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a" ErrorMessage="Please enter your rollno!" Style="margin-left: -177px" />
                </div>
                <div class="form-group">
                    <label>Email :</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_email"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txt_email" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a" ErrorMessage="Please enter your email!" />
                    <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" Style="margin-left: -148px" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txt_email" ValidationGroup="a" ForeColor="Red" SetFocusOnError="true" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>

                </div>
                <div class="form-group">
                    <label>Phone Number :</label>
                    <asp:TextBox runat="server" MaxLength="15" CssClass="form-control" ID="txt_phone"></asp:TextBox>

                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txt_phone" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a" ErrorMessage="Please enter your phone!" />
                </div>
                <div class="form-group">
                    <label>City :</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_city"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txt_city" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a" ErrorMessage="Please enter your city!" />
                </div>
                <div class="form-group">
                    <label>State :</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txt_state"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txt_state" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a" ErrorMessage="Please enter your state!" />
                </div>
                <div class="form-group">
                    <label>Class :</label>
                    <asp:DropDownList runat="server" ID="ddl_class" OnSelectedIndexChanged="ddl_class_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" InitialValue="0" ControlToValidate="ddl_class" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a" ErrorMessage="Please choose class!" />
                </div>
                <div class="form-group" runat="server" id="div_teacher" style="display: none">
                    <label>Teacher :</label>
                    <asp:DropDownList runat="server" ID="ddl_teacher" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Address :</label>
                    <asp:TextBox TextMode="MultiLine" Rows="5" runat="server" CssClass="form-control" ID="txt_address"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txt_address" ForeColor="Red" SetFocusOnError="true" ValidationGroup="a" ErrorMessage="Please enter your address!" />
                </div>
                <asp:Button runat="server" CssClass="btn btn-success" Style="margin-bottom: 20px" ID="btn_save" OnClick="btn_save_Click" CommandName="add" Text="Save" ValidationGroup="a" />

                <asp:Button runat="server" CssClass="btn btn-info" Style="margin-bottom: 20px" ID="btn_back" OnClick="btn_back_Click" Text="View Records" />
                <br />
                <asp:Label runat="server" ID="lbl_result" Style="font-size: 18px;"></asp:Label>




            </asp:Panel>
        </div>

    </form>
</body>
</html>
