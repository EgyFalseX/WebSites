using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UC_UserInformationUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ET_Lib.TryLogin("hmd3a", "hmd3aa");
        if (!IsPostBack)
        {
            LoadData();
            LoadUserInfo();
        }
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        LblState.Visible = false;
        if (TxtPassword.Text != TxtCPassword.Text)
        {
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            LblState.Text = "من فضلك اكلمة السر و أعادة كلمة المرور يجب ان يكونو متطابقين ";
            return;
        }

        string EmpId, EmpTypeId, EmpName, NiId, Bdate, Gender, tel, mobil, adress, email, job, govwork, edara, spos, icdl, WorkDatabase, TrainEschool, UserName, password ;
        if(LblEmpID.Text == string.Empty)
        {

            LblState.Visible = true; 
            LblState.Text = "من فضلك قم بالتسجيل";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        else
        {
            EmpId = LblEmpID.Text;
        }
        if (DDLEmpType.SelectedValue == string.Empty)
        {
            EmpTypeId = "NULL";
        }
        else
        {
            EmpTypeId = DDLEmpType.SelectedValue;
        }
        if (TxtEmpName.Text == string.Empty)
        {
            EmpName = "NULL";
        }
        else
        {
            EmpName = String.Format("'{0}'", TxtEmpName.Text);
        }
        if (TxtSSN.Text == string.Empty)
        {
            NiId = "NULL"; 
        }
        else
        {
            NiId = String.Format("'{0}'", TxtSSN.Text);
        }
        if (TxtBDate.Text == string.Empty)
        {
            Bdate = "NULL";
        }
        else
        {
            Bdate = String.Format("#{0}#", TxtBDate.Text);
        }
        if (DDLGender.SelectedValue == string.Empty)
        {
            Gender = "NULL";
        }
        else
        {
            Gender = DDLGender.SelectedValue;
        }
        if (TxtPhone.Text == string.Empty)
        {
            tel = "NULL";
        }
        else
        {
            tel = String.Format("'{0}'", TxtPhone.Text);
        }
        if (TxtMobile.Text == string.Empty)
        {
            mobil = "NULL";
        }
        else
        {
            mobil = String.Format("'{0}'", TxtMobile.Text);
        }
        if (TxtAddress.Text == string.Empty)
        {
            adress = "NULL";
        }
        else
        {
            adress = String.Format("'{0}'", TxtAddress.Text);
        }
        if (TxtEmail.Text == string.Empty)
        {
            email = "NULL";
        }
        else
        {
            email = String.Format("'{0}'", TxtEmail.Text);
        }
        if (DDLJob.SelectedValue == string.Empty)
        {
            job = "NULL";
        }
        else
        {
            job = DDLJob.SelectedValue;
        }
        if (DDLCity.SelectedValue == string.Empty)
        {
            govwork = "NULL";
        }
        else
        {
            govwork = DDLCity.SelectedValue;
        }
        if (DDLDepartment.SelectedValue == string.Empty)
        {
            edara = "NULL";
        }
        else
        {
            edara = DDLDepartment.SelectedValue;
        }
        if (DDLPlace.SelectedValue == string.Empty)
        {
            spos = "NULL";
        }
        else
        {
            spos = DDLPlace.SelectedValue;
        }
        if (DDLICDL.SelectedValue == string.Empty)
        {
            icdl = "NULL";
        }
        else
        {
            icdl = DDLICDL.SelectedValue;
        }
        if (TxtWorkDB.Text == string.Empty)
        {
            WorkDatabase = "NULL";
        }
        else
        {
            WorkDatabase = String.Format("'{0}'", TxtWorkDB.Text);
        }
        if (DDLESchoolTrain.SelectedValue == string.Empty)
        {
            TrainEschool = "NULL";
        }
        else
        {
            TrainEschool = DDLESchoolTrain.SelectedValue;
        }
        if (TxtUserName.Text == string.Empty)
        {
            LblState.Visible= true;
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Text = "من فضلك ادخل اسم المستخدم";
            return;
        }
        else
        {
            UserName = String.Format("'{0}'", TxtUserName.Text);
        }
        if (TxtPassword.Text == string.Empty)
        {
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Text = "من فضلك ادخل كلمة الســـر";
            return;
        }
        else
        {
            password = String.Format("'{0}'", TxtPassword.Text);
        }
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand(String.Format("UPDATE Emp_Data SET EmpTypeId = {0}, EmpName = {1}, NiId = {2}, Bdate = {3}, Gender = {4}, tel = {5}, mobil = {6}, adress = {7}, email = {8}, job = {9}, govwork = {10}, edara = {11}, spos = {12},  icdl = {13}, WorkDatabase = {14}, TrainEschool = {15}, UserName = {16}, [password] = {17} WHERE (EmpId = {18})", EmpTypeId, EmpName, NiId, Bdate, Gender, tel, mobil, adress, email, job, govwork, edara, spos, icdl, WorkDatabase, TrainEschool, UserName, password, ET_Lib.Empid), Con);
        try
        {
            Con.Open();
            Cmd.ExecuteNonQuery();
            LblState.Visible = true;
            LblState.ForeColor = System.Drawing.Color.Green;
            LblState.Text = "تم حفظ التغييـــر";
        }
        catch (Exception ex)
        {
            LblState.Text= ex.Message;
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
        }
        Con.Close();
    }
    private void LoadData()
    {
        DataTable EmpTypes = new DataTable("");
        DataTable Genders = new DataTable("");
        DataTable Jobs = new DataTable("");
        DataTable City = new DataTable("");
        
        using (OleDbDataAdapter Dr = new OleDbDataAdapter("", ET_Lib.E_trainingConnection))
        {
            try
            {
                // Load EmpTypes
                Dr.SelectCommand.CommandText = "SELECT EmpTypeId, EmpTypeName FROM CdEmpTYPe";
                Dr.Fill(EmpTypes);
                ET_Lib.EmptyRow(EmpTypes);
                DDLEmpType.DataSource = EmpTypes;
                DDLEmpType.DataTextField = "EmpTypeName";
                DDLEmpType.DataValueField = "EmpTypeId";
                DDLEmpType.DataBind();
                // Load Gender
                Dr.SelectCommand.CommandText = "SELECT Gender, GenderName FROM CdGender";
                Dr.Fill(Genders);
                ET_Lib.EmptyRow(Genders);
                DDLGender.DataSource = Genders;
                DDLGender.DataTextField = "GenderName";
                DDLGender.DataValueField = "Gender";
                DDLGender.DataBind();
                // Load Job
                Dr.SelectCommand.CommandText = "SELECT job, JobName FROM Cdjob";
                Dr.Fill(Jobs);
                ET_Lib.EmptyRow(Jobs);
                DDLJob.DataSource = Jobs;
                DDLJob.DataTextField = "JobName";
                DDLJob.DataValueField = "job";
                DDLJob.DataBind();
                // Load City
                Dr.SelectCommand.CommandText = "SELECT GOV_CD, GOV FROM gov";
                Dr.Fill(City);
                ET_Lib.EmptyRow(City);
                DDLCity.DataSource = City;
                DDLCity.DataTextField = "GOV";
                DDLCity.DataValueField = "GOV_CD";
                DDLCity.DataBind();
                
                
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
    private void LoadUserInfo()
    {
        if (ET_Lib.Empid == null)
        {
            return;
        }
        OleDbConnection Con = ET_Lib.E_trainingConnection;
        OleDbCommand Cmd = new OleDbCommand("SELECT EmpId, EmpTypeId, EmpName, NiId, Bdate, Gender, tel, mobil, adress, email, job, govwork, edara, spos, icdl, WorkDatabase, TrainEschool, UserName, [password] FROM Emp_Data Where EmpId = " + ET_Lib.Empid, Con);
        OleDbDataReader DR;
        try
        {
            Con.Open();
            DR = Cmd.ExecuteReader();
            if (DR.HasRows)
            {
                DR.Read();
                LblEmpID.Text = DR.GetValue(0).ToString();
                for (int i = 0; i < DDLEmpType.Items.Count; i++)
                {
                    if (DDLEmpType.Items[i].Value.ToString() == DR.GetValue(1).ToString())
                    {
                        DDLEmpType.SelectedIndex = i;
                        break;
                    }
                }
                TxtEmpName.Text = DR.GetValue(2).ToString();
                TxtSSN.Text = DR.GetValue(3).ToString();
                TxtBDate.Text = DR.GetValue(4).ToString();
                for (int i = 0; i < DDLGender.Items.Count; i++)
                {
                    if (DDLGender.Items[i].Value.ToString() == DR.GetValue(5).ToString())
                    {
                        DDLGender.SelectedIndex = i;
                        break;
                    }
                }
                TxtPhone.Text = DR.GetValue(6).ToString();
                TxtMobile.Text = DR.GetValue(7).ToString();
                TxtAddress.Text = DR.GetValue(8).ToString();
                TxtEmail.Text = DR.GetValue(9).ToString();
                for (int i = 0; i < DDLJob.Items.Count; i++)
                {
                    if (DDLJob.Items[i].Value.ToString() == DR.GetValue(10).ToString())
                    {
                        DDLJob.SelectedIndex = i;
                        break;
                    }
                }
                for (int i = 0; i < DDLCity.Items.Count; i++)
                {
                    if (DDLCity.Items[i].Value.ToString() == DR.GetValue(11).ToString())
                    {
                        DDLCity.SelectedIndex = i;
                        DDLCity_SelectedIndexChanged(DDLCity, new EventArgs());
                        break;
                    }
                }
                for (int i = 0; i < DDLDepartment.Items.Count; i++)
                {
                    if (DDLDepartment.Items[i].Value.ToString() == DR.GetValue(12).ToString())
                    {
                        DDLDepartment.SelectedIndex = i;
                        DDLDepartment_SelectedIndexChanged(DDLDepartment, new EventArgs());
                        break;
                    }
                }
                for (int i = 0; i < DDLPlace.Items.Count; i++)
                {
                    if (DDLPlace.Items[i].Value.ToString() == DR.GetValue(13).ToString())
                    {
                        DDLPlace.SelectedIndex = i;
                        break;
                    }
                }
                for (int i = 0; i < DDLICDL.Items.Count; i++)
                {
                    if (DDLICDL.Items[i].Value.ToString() == DR.GetValue(14).ToString())
                    {
                        DDLICDL.SelectedIndex = i;
                        break;
                    }
                }
                TxtWorkDB.Text = DR.GetValue(15).ToString();
                for (int i = 0; i < DDLESchoolTrain.Items.Count; i++)
                {
                    if (DDLESchoolTrain.Items[i].Value.ToString() == DR.GetValue(16).ToString())
                    {
                        DDLESchoolTrain.SelectedIndex = i;
                        break;
                    }
                }
                TxtUserName.Text = DR.GetValue(17).ToString();
                TxtPassword.Text = DR.GetValue(18).ToString();
                TxtCPassword.Text = DR.GetValue(18).ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        Con.Close();
    }
    protected void DDLCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLCity.SelectedIndex == -1)
        {
            return;
        }
        using (OleDbDataAdapter Dr = new OleDbDataAdapter("", ET_Lib.E_trainingConnection))
        {
            try
            {
                // Load Department
                DataTable Department = new DataTable("");
                Dr.SelectCommand.CommandText = "SELECT EPOS, EDARET FROM EDARET Where GOV_CD = " + DDLCity.SelectedValue.ToString();
                Dr.Fill(Department);
                ET_Lib.EmptyRow(Department);
                DDLDepartment.DataSource = Department;
                DDLDepartment.DataTextField = "EDARET";
                DDLDepartment.DataValueField = "EPOS";
                DDLDepartment.DataBind();
            }
            catch (Exception ex)
            {
                LblState.Text = ex.Message;
                LblState.Visible = true;
            }
            if (DDLDepartment.Items.Count > 0)
            {
                DDLDepartment.SelectedIndex = 0;
            }
            if (DDLPlace.Items.Count > 0)
            {
                DDLPlace.SelectedIndex = 0;
            }
        }
    }
    protected void DDLDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLDepartment.SelectedIndex == -1)
        {
            return;
        }
        using (OleDbDataAdapter Dr = new OleDbDataAdapter("", ET_Lib.E_trainingConnection))
        {
            try
            {
                // Load SPOS
                DataTable SPOS = new DataTable("");
                Dr.SelectCommand.CommandText = "SELECT SPOS, SCHOOL FROM SCHOOL WHERE NOEDARET = 10" + DDLDepartment.SelectedValue.ToString();
                Dr.Fill(SPOS);
                ET_Lib.EmptyRow(SPOS);
                DDLPlace.DataSource = SPOS;
                DDLPlace.DataTextField = "SCHOOL";
                DDLPlace.DataValueField = "SPOS";
                DDLPlace.DataBind();
            }
            catch (Exception ex)
            {
                LblState.Text = ex.Message;
                LblState.Visible = true;
            }
        }
    }
 
}