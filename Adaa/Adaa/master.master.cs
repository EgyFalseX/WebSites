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
        if (TheSessionsAdaa.UserID != null)
        {
            BtnLogout.Visible = true;
        }
        else
        {
            BtnLogout.Visible = false;
        }
    }
    protected void BackToMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Adaa/Default.aspx");
    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        TheSessionsAdaa.UserID = null;
        Response.Redirect("~/Adaa/Login.aspx");
    }
}
