using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.OleDb;
using System.Web.Security;

public partial class Login : Page
{
    private bool LogMeIn(string uid, string pss)
    {
        DataTable dt = new DataTable();
        dt = MailCL.LoadTable(string.Format(@"SELECT UserID, titleId, IsAdmin, realname, mobil, umail, udeptId, imgpath, signture
                              FROM Users WHERE UserName = '{0}' AND [Password] = '{1}' and IsActive = true", uid, pss));
        if (dt.Rows.Count > 0)
        {
            sessionMails.UserID = dt.Rows[0][0].ToString();
            sessionMails.IsAdmin = (bool)dt.Rows[0][2];

            return true;
        }
        else
            return false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (sessionMails.IsAuth)
            PnlLogin.Visible = false;
        else
            PnlLogin.Visible = true;
        
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "من فضلك ادخل اسم المستخدم و كلمة المرور";
            LblState.ForeColor = Color.Red;
            return;
        }
        if (!LogMeIn(TxtUserName.Text, TxtPassword.Text))
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }

        if (Request.QueryString["RedirectURL"] == null)
        {
            FormsAuthentication.SetAuthCookie(TxtUserName.Text, false);
            Response.Redirect("Default.aspx");
        }
        else
        {
            FormsAuthentication.RedirectFromLoginPage(TxtUserName.Text, false);
            Response.Redirect(Request.QueryString["RedirectURL"]);
        }
        //Server.UrlEncode(Request.Url.ToString()).ToString();
    }
}