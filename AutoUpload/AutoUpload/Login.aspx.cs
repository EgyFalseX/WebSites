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
        if (TheSessions.UserID == null)
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
        DataTable userData = MC.LoadDataTable(string.Format(@"SELECT UserID, SyndicateId, IsAdmin
        FROM Users WHERE (UserName = '{0}') AND (UserPass = '{1}')", TxtUserName.Text, TxtPassword.Text), false);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessions.UserID = userData.Rows[0]["UserID"].ToString();
        TheSessions.SyndicateId = userData.Rows[0]["SyndicateId"].ToString();
        if (MC.IsNullOrEmpty(userData.Rows[0]["IsAdmin"]))
            TheSessions.IsAdmin = false;
        else
        {
            TheSessions.IsAdmin = (bool)userData.Rows[0]["IsAdmin"];
        }
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }
}