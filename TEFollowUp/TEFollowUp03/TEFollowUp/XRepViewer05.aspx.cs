using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XRepViewer05 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        //if (!TheSessionsTEFollowUp.IsAdmin)
        //    Response.Redirect("AccessDenied.aspx");
    }
    protected void cbMoshref_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (deFrom.Value != null && deTo.Value != null)
        {
            HttpContext.Current.Session["XRep05From"] = deFrom.Value;
            HttpContext.Current.Session["XRep05To"] = deTo.Value;
            ReportToolbar1.Visible = true; ReportViewer1.Visible = true;
        }
    }
}