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
        if (sessionupdata.UserID == null)
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
        dsupdata ds = new dsupdata();
        dsupdataTableAdapters.UserInfoTableAdapter adpUser = new dsupdataTableAdapters.UserInfoTableAdapter();
        if (adpUser.FillByUserPass(ds.UserInfo, TxtUserName.Text, TxtPassword.Text) <= 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        dsupdata.UserInfoRow user = ds.UserInfo[0];
        sessionupdata.UserID = user.id.ToString();
        //sessionupdata.SyndicateId = user.SyndicateId.ToString();
        //if (user.IsSubCommitteIdNull())
        //    sessionupdata.SubCommitteId = null;
        //else
        //    sessionupdata.SubCommitteId = user.SubCommitteId.ToString();
        sessionupdata.IsAdmin = user.isadmin;
        //sessionupdata.DatabaseName = user.dataname;
        sessionupdata.UserName = user.user;
        
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