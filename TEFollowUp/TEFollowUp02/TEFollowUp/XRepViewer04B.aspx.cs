using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XRepViewer04B : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!TheSessionsTEFollowUp.IsAdmin)
            Response.Redirect("AccessDenied.aspx");
        //if (Request.QueryString["id"] == null)
        //    Response.Redirect("tblmeetingtrainEditor.aspx");
    }
    protected void cbMoshref_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpContext.Current.Session["XRep04BID"] = cbMoshref.Value;
        HttpContext.Current.Session["XRep04BName"] = cbMoshref.Text;
        ReportToolbar1.Visible = true; ReportViewer1.Visible = true;
        
    }
}