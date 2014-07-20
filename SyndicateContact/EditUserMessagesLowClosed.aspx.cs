using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditUserMessagesLowClosed : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CodesSyndicateContact.IsAuthorized)
        {
            Response.Redirect("Login2.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
            return;
        }
    }
}