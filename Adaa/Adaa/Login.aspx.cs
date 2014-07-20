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
        if (TheSessionsAdaa.UserID == null)
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
        DataTable userData = MCAdaa.LoadDataTable(string.Format(@"SELECT UserID, UserName, [Password], IsAdmin
        FROM Users WHERE (UserName = '{0}') AND ([Password] = '{1}')", TxtUserName.Text, TxtPassword.Text), false);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessionsAdaa.UserID = userData.Rows[0]["UserID"].ToString();
        if (MCAdaa.IsNullOrEmpty(userData.Rows[0]["IsAdmin"]))
            TheSessionsAdaa.IsAdmin = false;
        else
        {
            TheSessionsAdaa.IsAdmin = (bool)userData.Rows[0]["IsAdmin"];
        }
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/Adaa/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }

}