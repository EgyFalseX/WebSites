using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDst"] == null)
            btnLogout.Visible = false;
        else
            btnLogout.Visible = true;
    }
    protected void BackToMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DownloadCenter/Default.aspx");
    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        HttpContext.Current.Session["UserIDst"] = null;
        Response.Redirect("StLogin.aspx");
    }
}
