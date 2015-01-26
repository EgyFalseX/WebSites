using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class XRepViewer03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        if (Request.QueryString["id"] == null)
            Response.Redirect("tblmeetingtrainEditor.aspx");
        
        HttpContext.Current.Session["XRep03ID"] = Convert.ToInt32(Request.QueryString["id"]);
    }
}