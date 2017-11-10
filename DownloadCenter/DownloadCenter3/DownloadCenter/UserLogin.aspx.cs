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

public partial class Login : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessionsDownloadCenter.UserID == null)
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
        DataTable userData = MCDownloadCenter.LoadDataTable(string.Format(@"SELECT stu_code, user_name, [pass]
        FROM student WHERE (perm = -1 and user_name = '{0}') AND ([pass] = '{1}')", TxtUserName.Text, TxtPassword.Text), false, MCDownloadCenter.ConnectionLogin.ConnectionString);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessionsDownloadCenter.UserID = userData.Rows[0]["stu_code"].ToString();
        DataTable safData = MCDownloadCenter.LoadDataTable(string.Format(@"SELECT alsofof_code
        FROM student_t WHERE (stu_code = {0} and asase_code = (select max(asase_code) from student_t where stu_code = {0}))", TheSessionsDownloadCenter.UserID, TxtPassword.Text), false, MCDownloadCenter.ConnectionLogin.ConnectionString);
        if (safData.Rows.Count > 0)
        {
            TheSessionsDownloadCenter.alsofof_code = safData.Rows[0]["alsofof_code"].ToString();
        }
        
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/DownloadCenter/centerViewer.aspx");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }

}