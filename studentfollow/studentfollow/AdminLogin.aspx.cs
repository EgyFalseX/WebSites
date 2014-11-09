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
        DataTable userData = MCstudentfollow.LoadDataTable(string.Format(@"SELECT id, user, [pass], realname, job, isadmin
        FROM adminfollow WHERE (user = '{0}') AND ([pass] = '{1}')", TxtUserName.Text, TxtPassword.Text), false, MCstudentfollow.Connection.ConnectionString);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessionsstudentfollow.UserID = userData.Rows[0]["id"].ToString();
        if (userData.Rows[0]["isadmin"].ToString() == string.Empty)
            TheSessionsstudentfollow.IsAdmin = false;
        else
            TheSessionsstudentfollow.IsAdmin = Convert.ToBoolean(userData.Rows[0]["isadmin"]);
        TheSessionsstudentfollow.UserRealName = userData.Rows[0]["realname"].ToString();
        TheSessionsstudentfollow.Userjob = userData.Rows[0]["job"].ToString();
        
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/studentfollow/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }

}