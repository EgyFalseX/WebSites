using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.OleDb;

public partial class Login : Page
{
    private bool LogMeIn(string uid, string pss)
    {
        DataTable dt = new DataTable();
        dt = SqlProvider.LoadDataTable(string.Format(@"SELECT UserID, ISAdmin FROM Users WHERE UserName = N'{0}' AND UserPass = N'{1}'", uid, pss));
        if (dt.Rows.Count > 0)
        {
            Sessionz.UserID = dt.Rows[0][0].ToString();
            Sessionz.IsAdmin = dt.Rows[0][1].ToString();
            return true;
        }
        else
            return false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Sessionz.IsAuthorized)
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
            Response.Redirect("~/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
        //Server.UrlEncode(Request.Url.ToString()).ToString();
    }
}