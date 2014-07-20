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
 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (sessionETSTQuery.UserID == null)
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
        dsEstrdaddata ds = new dsEstrdaddata();
        dsEstrdaddataTableAdapters.UserInfoTableAdapter adpUser = new dsEstrdaddataTableAdapters.UserInfoTableAdapter();
        adpUser.FillByuser_pass(ds.UserInfo, TxtUserName.Text, TxtPassword.Text); 
        if (ds.UserInfo.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        sessionETSTQuery.UserID = ds.UserInfo[0].id;
        sessionETSTQuery.LagnaId = ds.UserInfo[0].LagnaId;
        if (mcETSTQuery.IsNullOrEmpty(ds.UserInfo[0].isadmin))
            sessionETSTQuery.IsAdmin = false;
        else
            sessionETSTQuery.IsAdmin = ds.UserInfo[0].isadmin;

        if (Request.QueryString["RedirectURL"] == null)
        {
            Response.Redirect("~/ETSTQuery/");
        }
        else
        {
            Response.Redirect(Request.QueryString["RedirectURL"]);
        }
    }

}