using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionsEtsNorth.IsAuth)
        {
            Response.Redirect("~/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
        if (!mcEtsNorth.IsNullOrEmpty(Request.QueryString["m"]))
        {
            if ((string)Request.QueryString["m"] != sessionsEtsNorth.ModereaId && sessionsEtsNorth.IsAdmin == false)
            {
                Response.Redirect("~/AccessDenied.aspx");
            }
        }
    }
}