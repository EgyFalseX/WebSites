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
        if (sessionsynmembers.UserID == null)
            PnlLogin.Visible = true;
        else
            PnlLogin.Visible = false;
        AppDomain.CurrentDomain.SetData("DataDirectory", MapPath("~/synmembers/DataSource/"));// maybe make problem in entire website
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "من فضلك ادخل اسم المستخدم و كلمة المرور";
            LblState.ForeColor = Color.Red;
            return;
        }
        dssynmembers ds = new dssynmembers();
        dssynmembersTableAdapters.UserInfoTableAdapter adpUser = new dssynmembersTableAdapters.UserInfoTableAdapter();
        if (adpUser.FillByUserPass(ds.UserInfo, TxtUserName.Text, TxtPassword.Text) <= 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        dssynmembers.UserInfoRow user = ds.UserInfo[0];
        sessionsynmembers.UserID = user.id.ToString();
        sessionsynmembers.SyndicateId = user.SyndicateId.ToString();
        sessionsynmembers.IsAdmin = user.isadmin;
        sessionsynmembers.DatabaseName = user.dataname;
        sessionsynmembers.UserName = user.name;
        
        if (Request.QueryString["RedirectURL"] == null)
        {
            Response.Redirect("~/synmembers/");
        }
        else
        {
            Response.Redirect(Request.QueryString["RedirectURL"]);
        }
    }
}