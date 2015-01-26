using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XRepViewer04A : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Request.QueryString["id"] == null)
        //    Response.Redirect("tblmeetingtrainEditor.aspx");
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }
    protected void cbMoshref_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpContext.Current.Session["XRep04AID"] = cbMoshref.Value;
        HttpContext.Current.Session["XRep04AName"] = cbMoshref.Text;
        ReportToolbar1.Visible = true; ReportViewer1.Visible = true;
        
    }
}