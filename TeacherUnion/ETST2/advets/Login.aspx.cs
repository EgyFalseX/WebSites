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
    dsAdvetsTableAdapters.UsersTableAdapter adpUser = new dsAdvetsTableAdapters.UsersTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.UserIDadvets == null)
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
        dsAdvets.UsersDataTable userData = adpUser.GetDataByLogin(TxtUserName.Text, TxtPassword.Text);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }

        TheSessions.UserIDadvets = userData[0].UserID.ToString();
        TheSessions.SyndicateIdadvets = userData[0].SyndicateId.ToString();
        if (userData[0].IsIsAdminNull())
            TheSessions.IsAdminadvets = false;
        else
            TheSessions.IsAdminadvets = userData[0].IsAdmin;

        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/advets/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);

    }
}