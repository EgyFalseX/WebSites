using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (sessionRetirementWeb.UserID == null)
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
        dsMain ds = new dsMain();
        dsMainTableAdapters.UserInfoTableAdapter adpUser = new dsMainTableAdapters.UserInfoTableAdapter();
        if (adpUser.FillByUserPass(ds.UserInfo, TxtUserName.Text, TxtPassword.Text) <= 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        dsMain.UserInfoRow user = ds.UserInfo[0];
        sessionRetirementWeb.UserID = user.id.ToString();
        sessionRetirementWeb.SyndicateId = user.SyndicateId.ToString();
        sessionRetirementWeb.IsAdmin = user.isadmin;
        sessionRetirementWeb.DatabaseName = user.dataname;
        sessionRetirementWeb.UserName = user.name;
        
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