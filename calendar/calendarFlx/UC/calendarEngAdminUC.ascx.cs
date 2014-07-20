using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class calendarEngAdminUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserID_calendar"] == null)
            Response.Redirect("Logincalendar.aspx");
        
    }
}