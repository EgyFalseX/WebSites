using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlanDetailsAdminViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["meetingID"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
        if (HttpContext.Current.Session["meetingID"].ToString() != "1")
        {
            Response.Redirect("Default.aspx");
            return;
        }
    }
}