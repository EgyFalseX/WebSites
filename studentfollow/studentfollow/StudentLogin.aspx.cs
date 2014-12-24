using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class StudentLogin : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessionsstudentfollow.UserStudentID == null)
            PnlLogin.Visible = true;
        else
            PnlLogin.Visible = false;
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "من فضلك ادخل اسم المستخدم و كلمة المرور";
            LblState.ForeColor = Color.Red;
            return;
        }
        DataTable userData = MCstudentfollow.LoadDataTable(string.Format(@"SELECT stu_code
        FROM student WHERE ([user_name_fa] = '{0}') AND ([pass_fa] = '{1}')", TxtUserName.Text, TxtPassword.Text), false, MCstudentfollow.ConnectionStringdataschool());
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }

        TheSessionsstudentfollow.UserStudentID = userData.Rows[0]["stu_code"].ToString();
        TheSessionsstudentfollow.IsAdmin = false;

        DataTable stuInfo = MCstudentfollow.LoadDataTable(string.Format(@"SELECT alsofof_code, fasl_code From student_t Where 
        stu_code = {0} And asase_code = (Select Max(asase_code) From student_t)", TheSessionsstudentfollow.UserStudentID), false, MCstudentfollow.ConnectionStringdataschool());

        if (stuInfo.Rows.Count == 0)
        {
            TheSessionsstudentfollow.UserStudentID = null;
            LblState.Text = "خطاء في العام الدراسي";
            LblState.ForeColor = Color.Red;
            return;
        }

        TheSessionsstudentfollow.alsofof_code = stuInfo.Rows[0]["alsofof_code"].ToString();
        TheSessionsstudentfollow.fasl_code = stuInfo.Rows[0]["fasl_code"].ToString();


        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/studentfollow/Default.aspx");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }

}