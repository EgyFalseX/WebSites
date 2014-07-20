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
    dsSchoolsTableAdapters.UsersTableAdapter adpUser = new dsSchoolsTableAdapters.UsersTableAdapter();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.schoolsUserID == null)
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
        dsSchools.UsersDataTable userData = adpUser.GetDataByLogin(TxtUserName.Text, TxtPassword.Text);
        
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }

        TheSessions.schoolsUserID = userData[0].UserID.ToString();
        TheSessions.schoolsSyndicateId = userData[0].SyndicateId.ToString();
        if (userData[0].IsIsAdminNull())
            TheSessions.schoolsIsAdmin = false;
        else
            TheSessions.schoolsIsAdmin = userData[0].IsAdmin;

        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/schools/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);

    }
}