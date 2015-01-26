using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XRepViewer06 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        //if (!TheSessionsTEFollowUp.IsAdmin)
        //    Response.Redirect("AccessDenied.aspx");
    }
    protected void cbData_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpContext.Current.Session["XRep06ID"] = cbData.Value;
        ReportToolbar1.Visible = true; ReportViewer1.Visible = true;
    }
}