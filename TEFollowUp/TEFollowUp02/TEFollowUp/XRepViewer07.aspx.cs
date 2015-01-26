using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XRepViewer07 : System.Web.UI.Page
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
        
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        if (deFrom.Value != null && deFrom.Value != null && cbMoshref.Value != null)
        {
            HttpContext.Current.Session["XRep07ID"] = cbMoshref.Value;
            HttpContext.Current.Session["XRep07From"] = deFrom.Value;
            HttpContext.Current.Session["XRep07To"] = deTo.Value;
            ReportToolbar1.Visible = true; ReportViewer1.Visible = true;
        }
    }
}