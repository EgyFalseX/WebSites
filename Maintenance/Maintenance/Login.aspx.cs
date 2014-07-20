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
    dsMaintenanceTableAdapters.UsersTableAdapter adpUser = new dsMaintenanceTableAdapters.UsersTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (sessionMaintenance.MaintenanceUserID == null)
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
        dsMaintenance.UsersDataTable userData = adpUser.GetDataByLogin(TxtUserName.Text, TxtPassword.Text);
        
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }

        sessionMaintenance.MaintenanceUserID = userData[0].UserID.ToString();
        if (!userData[0].IsdeptIdNull())
            sessionMaintenance.deptId = userData[0].deptId.ToString();
        if (!userData[0].IsumailNull())
            sessionMaintenance.umail = userData[0].umail.ToString();
        if (!userData[0].IsrealnameNull())
            sessionMaintenance.MaintenanceRealname = userData[0].realname.ToString();
        if (!userData[0].IsNull("isadmin"))
            sessionMaintenance.MaintenanceIsAdmin = Convert.ToBoolean(userData[0]["isadmin"]);

        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/Maintenance/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);

    }
}