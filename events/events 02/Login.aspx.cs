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
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/events.mdb");
        OleDbDataAdapter da = new OleDbDataAdapter(string.Format(@"Select [id], seeall, LagnaId
        from addata where [user] = '{0}' And pass = '{1}'", uid, pss), constr);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            eventsCodes.UserID = dt.Rows[0][0].ToString();
            if (eventsCodes.IsNullOrEmpty(dt.Rows[0][1]))
                eventsCodes.IsAdmin = false;
            else
                eventsCodes.IsAdmin = (bool)dt.Rows[0][1];
            if (!eventsCodes.IsNullOrEmpty(dt.Rows[0][2]))
                eventsCodes.LagnaId = dt.Rows[0][2];
            return true;
        }
        else
            return false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (eventsCodes.IsAuthorized == false)
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
        if (!LogMeIn(TxtUserName.Text, TxtPassword.Text))
        {
            LblState.Text = "خطأ في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }

        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }
}