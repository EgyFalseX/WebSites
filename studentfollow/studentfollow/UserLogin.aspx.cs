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

public partial class UserLogin : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessionsstudentfollow.UserID == null)
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
        DataTable userData = MCstudentfollow.LoadDataTable(string.Format(@"SELECT stu_code, user_name_fa, pass_fa
        FROM student WHERE (user_name_fa = '{0}') AND ([pass_fa] = '{1}')", TxtUserName.Text, TxtPassword.Text), false, MCstudentfollow.ConnectionStringdataschool());
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessionsstudentfollow.UserStudentID = userData.Rows[0]["stu_code"].ToString();
        TheSessionsstudentfollow.IsAdmin = false;
        
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/studentfollow/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }

}