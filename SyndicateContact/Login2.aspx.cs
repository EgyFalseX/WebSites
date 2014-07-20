using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.OleDb;

public partial class Login2 : Page
{

    private bool LogMeIn(string uid, string pss)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/contact.mdb");
        OleDbDataAdapter da = new OleDbDataAdapter(string.Format(@"Select [id], isadmin,
        (SELECT Top 1 LagnaId FROM UserAppilty WHERE pid = UserInfo.id) AS LagnaId,
        (SELECT Top 1 EdaraId FROM UserAppilty WHERE pid = UserInfo.id) AS EdaraId
        from UserInfo where [user] = '{0}' And pass = '{1}'", uid, pss), constr);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            CodesSyndicateContact.UserID = dt.Rows[0][0].ToString();
            if (CodesSyndicateContact.IsNullOrEmpty(dt.Rows[0][1]))
                CodesSyndicateContact.IsAdmin = false;
            else
                CodesSyndicateContact.IsAdmin = (bool)dt.Rows[0][1];
            if (!CodesSyndicateContact.IsNullOrEmpty(dt.Rows[0][2]))
                CodesSyndicateContact.LagnaId = false;
            if (!CodesSyndicateContact.IsNullOrEmpty(dt.Rows[0][3]))
                CodesSyndicateContact.EdaraId = false;
            
            return true;
        }
        else
            return false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CodesSyndicateContact.IsAuthorized == false)
        {
            PnlLogin.Visible = true;
            PnlLogout.Visible = false;
        }
        else
        {
            PnlLogin.Visible = false;
            PnlLogout.Visible = true;
        }
        
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
            Response.Redirect("Default2.aspx");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        CodesSyndicateContact.EdaraId = null;
        CodesSyndicateContact.IsAdmin = false;
        CodesSyndicateContact.LagnaId = null;
        CodesSyndicateContact.UserID = null;
        Response.Redirect("Default2.aspx");
    }
}