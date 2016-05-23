using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class CreatePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDAchieve"] == null)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

      
    }
}
