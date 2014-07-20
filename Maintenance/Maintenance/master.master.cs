using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BtnLogout.Visible = sessionMaintenance.MaintenanceIsAuth;
    }
    protected void BackToMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        sessionMaintenance.MaintenanceUserID = null;
        Response.Redirect("Login.aspx");
    }
}
