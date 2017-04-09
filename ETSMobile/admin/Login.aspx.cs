using System;
using System.Web.UI;
using System.Drawing;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionETSMobile.IsAuth)
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
        dsData ds = new dsData();
        dsDataTableAdapters.userTableAdapter adpUser = new dsDataTableAdapters.userTableAdapter();
        if (adpUser.FillByuserpass(ds.user, TxtUserName.Text, TxtPassword.Text) <= 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        dsData.userRow user = ds.user[0];
        sessionETSMobile.UserID = user.AutoId;
        sessionETSMobile.IsAdmin = true;
        sessionETSMobile.UserName = user.user;
        
        if (Request.QueryString["RedirectURL"] == null)
        {
            Response.Redirect("~/");
        }
        else
        {
            Response.Redirect(Request.QueryString["RedirectURL"]);
        }
    }
}