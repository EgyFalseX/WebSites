using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;

public partial class NewUserControl_SelectToHonor : System.Web.UI.UserControl
{
    OleDbDataAdapter AccessDA;
    DataTable GeneralTable = new DataTable("General");
    string asase_code = "";
    int ViewPageStudent = 1;
    int ViewPageTeacher = 1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllMarahel();
            GetAllTeachers();
            GetAllHonorTypes();
        }
        GetAsasCode();
        GetStudentViewPage();
        GetTeacherViewPage();
        //asase_code = "2010";
    }

    public void GetAsasCode()
    {
        OleDbConnection AccessCon = MySchool.CodesConnection;
        OleDbCommand AccessCMD = new OleDbCommand("SELECT TOP 1 asase_code FROM asase ORDER BY asase_code DESC", AccessCon);
        try
        {
            AccessCon.Open();
            asase_code = AccessCMD.ExecuteScalar().ToString();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
        AccessCon.Close();
    }

    public void GetAllMarahel()
    {
        GeneralTable = new DataTable("General");
        try
        {
            AccessDA = new OleDbDataAdapter("SELECT marhala_code, marhala_name FROM marahel", MySchool.TheCodesConnection);
            AccessDA.Fill(GeneralTable);
            DDLMarhala.DataSource = GeneralTable;
            DDLMarhala.DataTextField = "marhala_name";
            DDLMarhala.DataValueField = "marhala_code";
            DDLMarhala.DataBind();
            if (DDLMarhala.Items.Count > 0)
            {
                DDLMarhala.Enabled = true;
            }
            DDLSfoof.Enabled = false;
            DDLFsool.Enabled = false;
            DDLStudents.Enabled = false;
            BtnAddStudent.Enabled = false;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    public void GetAllTeachers()
    {
        GeneralTable = new DataTable("General");
        try
        {
            AccessDA = new OleDbDataAdapter("SELECT مسلسل, NAME, CODE, [image] FROM [بيانات_الموظفين_بالمدرية]", MySchool.MalafatConnection);
            AccessDA.Fill(GeneralTable);
            DDLTeachers.DataSource = GeneralTable;
            DDLTeachers.DataTextField = "NAME";
            DDLTeachers.DataValueField = "مسلسل";
            DDLTeachers.DataBind();
            ViewState["TeacherTable"] = GeneralTable;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    public void GetAllHonorTypes()
    {

        try
        {
            GeneralTable = new DataTable("General");
            AccessDA = new OleDbDataAdapter("Select Code_Honor_board,name_Honor_board From Honor_board Where kind_Honor_board = 1", MySchool.ServicesConnection);
            AccessDA.Fill(GeneralTable);
            DDLHonorTypes1.DataSource = GeneralTable;
            DDLHonorTypes1.DataTextField = "name_Honor_board";
            DDLHonorTypes1.DataValueField = "Code_Honor_board";
            DDLHonorTypes1.DataBind();
            GeneralTable = new DataTable("General");
            AccessDA = new OleDbDataAdapter("Select Code_Honor_board,name_Honor_board From Honor_board Where kind_Honor_board = 2", MySchool.ServicesConnection);
            AccessDA.Fill(GeneralTable);
            DDLHonorTypes2.DataSource = GeneralTable;
            DDLHonorTypes2.DataTextField = "name_Honor_board";
            DDLHonorTypes2.DataValueField = "Code_Honor_board";
            DDLHonorTypes2.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    public void GetStudentViewPage()
    {
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCMD = new OleDbCommand("SELECT COUNT(viewpage) AS Timez,(SELECT MAX(viewpage) AS Expr2 FROM stu) AS ViewPage FROM stu WHERE (viewpage = (SELECT MAX(viewpage) AS Expr1 FROM stu))", AccessCon);
        OleDbDataReader AccessDr;
        try
        {

            AccessCon.Open();
            AccessDr = AccessCMD.ExecuteReader();
            int Times = 0;
            while (AccessDr.Read())
            {
                Times = Convert.ToInt16(AccessDr.GetValue(0));
                if (Times >= 5)
                {
                    ViewPageStudent = Convert.ToInt16(AccessDr.GetValue(1)) + 1;
                }
                else
                {
                    ViewPageStudent = Convert.ToInt16(AccessDr.GetValue(1));
                }
            }

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message.ToString());
        }
        AccessCon.Close();
    }

    public void GetTeacherViewPage()
    {
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCMD = new OleDbCommand("SELECT COUNT(viewpage) AS Timez,(SELECT MAX(viewpage) AS Expr2 FROM emp) AS ViewPage FROM emp WHERE (viewpage = (SELECT MAX(viewpage) AS Expr1 FROM emp))", AccessCon);
        OleDbDataReader AccessDr;
        try
        {

            AccessCon.Open();
            AccessDr = AccessCMD.ExecuteReader();
            int Times = 0;
            while (AccessDr.Read())
            {
                Times = Convert.ToInt16(AccessDr.GetValue(0));
                if (Times >= 5)
                {
                    ViewPageTeacher = Convert.ToInt16(AccessDr.GetValue(1)) + 1;
                }
                else
                {
                    ViewPageTeacher = Convert.ToInt16(AccessDr.GetValue(1));
                }
            }

        }
        catch (Exception ex)
        {

            Response.Write(ex.Message.ToString());
        }
        AccessCon.Close();
    }


    protected void DDLMarhala_SelectedIndexChanged(object sender, EventArgs e)
    {
        GeneralTable = new DataTable("General");
        try
        {
            AccessDA = new OleDbDataAdapter("SELECT alsofof_code, alsofof_name FROM alsofof Where marhala_code = " + DDLMarhala.SelectedValue.ToString(), MySchool.TheCodesConnection);
            AccessDA.Fill(GeneralTable);
            DDLSfoof.DataSource = GeneralTable;
            DDLSfoof.DataTextField = "alsofof_name";
            DDLSfoof.DataValueField = "alsofof_code";
            DDLSfoof.DataBind();
            if (DDLSfoof.Items.Count > 0)
            {
                DDLSfoof.Enabled = true;
            }

            DDLFsool.Enabled = false;
            DDLStudents.Enabled = false;
            BtnAddStudent.Enabled = false;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }

    }

    protected void DDLSfoof_SelectedIndexChanged(object sender, EventArgs e)
    {
        GeneralTable = new DataTable("General");
        try
        {
            AccessDA = new OleDbDataAdapter("SELECT fasl_code, fasl_name FROM fasl", MySchool.TheCodesConnection);
            AccessDA.Fill(GeneralTable);
            DDLFsool.DataSource = GeneralTable;
            DDLFsool.DataTextField = "fasl_name";
            DDLFsool.DataValueField = "fasl_code";
            DDLFsool.DataBind();
            if (DDLFsool.Items.Count > 0)
            {
                DDLFsool.Enabled = true;
            }
            DDLStudents.Enabled = false;
            BtnAddStudent.Enabled = false;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    protected void DDLFsool_SelectedIndexChanged(object sender, EventArgs e)
    {

        try
        {
            GeneralTable = new DataTable("General");
            AccessDA = new OleDbDataAdapter("SELECT student_t.stu_code, student.stu_name, student.image, student_t.[date] FROM (student_t INNER JOIN student ON student_t.stu_code = student.stu_code) WHERE (student_t.alsofof_code = " + DDLSfoof.SelectedValue.ToString() + ") AND (student_t.fasl_code = " + DDLFsool.SelectedValue.ToString() + ") AND (student_t.asase_code = " + asase_code + ")", MySchool.StudentConnection);
            AccessDA.Fill(GeneralTable);
            DDLStudents.DataSource = GeneralTable;
            DDLStudents.DataTextField = "stu_name";
            DDLStudents.DataValueField = "stu_code";
            DDLStudents.DataBind();
            ViewState["StudentTable"] = GeneralTable;
            if (DDLStudents.Items.Count > 0)
            {
                DDLStudents.Enabled = true;
            }
            BtnAddStudent.Enabled = false;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }

    protected void Enable_BtnAddStudent(object sender, EventArgs e)
    {
        if (DDLStudents.SelectedIndex > -1 && DDLHonorTypes1.SelectedIndex > -1 && TxtDate1.Text.Length > 0)
        {
            BtnAddStudent.Enabled = true;

        }
        else
        {
            BtnAddStudent.Enabled = false;
        }
    }

    protected void Enable_BtnAddTeacher(object sender, EventArgs e)
    {
        if (DDLTeachers.SelectedIndex > -1 && DDLHonorTypes2.SelectedIndex > -1 && TxtDate2.Text.Length > 0)
        {
            BtnAddTeacher.Enabled = true;
        }
        else
        {
            BtnAddTeacher.Enabled = false;
        }
    }

    protected void BtnAddStudent_Click(object sender, EventArgs e)
    {
        LblResult1.Text = ".";
        if (DDLMarhala.SelectedIndex > -1 && DDLSfoof.SelectedIndex > -1 && DDLFsool.SelectedIndex > -1 && DDLStudents.SelectedIndex > -1 && DDLHonorTypes1.SelectedIndex > -1 && TxtDate1.Text.Length > 0)
        {

            DataTable Students = (DataTable)ViewState["StudentTable"];
            OleDbConnection AccessCon = MySchool.ServicesConnection;
            OleDbCommand AccessCMD = new OleDbCommand("", AccessCon);
            AccessCMD.CommandText = "Insert into stu (stu_code, stu_name, Code_Honor_board, dd, mm, yy, viewpage, pic, date_entry, marhala_code, asase_code) VALUES (" + DDLStudents.SelectedValue.ToString() + ",'" + DDLStudents.SelectedItem.ToString() + "'," + DDLHonorTypes1.SelectedValue.ToString() + ",'" + Convert.ToDateTime(TxtDate1.Text).Day.ToString() + "','" + Convert.ToDateTime(TxtDate1.Text).Month.ToString() + "','" + Convert.ToDateTime(TxtDate1.Text).Year.ToString() + "'," + ViewPageStudent + ",'" + Students.Rows[DDLTeachers.SelectedIndex][3].ToString() + "',#" + DateTime.Today.Date.ToShortDateString() + "#," + DDLMarhala.SelectedValue.ToString() + "," + asase_code + ")";
            try
            {
                AccessCon.Open();
                AccessCMD.ExecuteNonQuery();
                LblResult1.Text = "تمـــت الاضافــه";
                LblResult1.ForeColor = System.Drawing.Color.Green;
                TxtDate1.Text = string.Empty;
                BtnAddStudent.Enabled = false;
            }
            catch (Exception ex)
            {
                LblResult1.Text = ex.Message.ToString();
                LblResult1.ForeColor = System.Drawing.Color.Red;
            }
            AccessCon.Close();
        }
    }

    protected void BtnAddTeacher_Click(object sender, EventArgs e)
    {
        LblResult2.Text = ".";
        if (DDLTeachers.SelectedIndex > -1 && DDLHonorTypes2.SelectedIndex > -1 && TxtDate2.Text.Length > 0)
        {
            DataTable Teachers = (DataTable)ViewState["TeacherTable"];
            OleDbConnection AccessCon = MySchool.ServicesConnection;
            OleDbCommand AccessCMD = new OleDbCommand("", AccessCon);
            AccessCMD.CommandText = "Insert into emp (code, name, Code_Honor_board, dd, mm, yy, viewpage, pic, date_entry, asase_code) VALUES (" + DDLTeachers.SelectedValue.ToString() + ",'" + DDLTeachers.SelectedItem.ToString() + "'," + DDLHonorTypes2.SelectedValue.ToString() + ",'" + Convert.ToDateTime(TxtDate2.Text).Day.ToString() + "','" + Convert.ToDateTime(TxtDate2.Text).Month.ToString() + "','" + Convert.ToDateTime(TxtDate2.Text).Year.ToString() + "'," + ViewPageTeacher + ",'" + Teachers.Rows[DDLTeachers.SelectedIndex][3].ToString() + "',#" + DateTime.Today.Date.ToShortDateString() + "#," + asase_code + ")";
            try
            {
                AccessCon.Open();
                AccessCMD.ExecuteNonQuery();
                LblResult2.Text = "تمـــت الاضافــه";
                LblResult2.ForeColor = System.Drawing.Color.Green;
                TxtDate2.Text = string.Empty;
                BtnAddTeacher.Enabled = false;
            }
            catch (Exception ex)
            {
                LblResult2.Text = ex.Message.ToString();
                LblResult2.ForeColor = System.Drawing.Color.Red;
            }
            AccessCon.Close();
        }
    }
}
