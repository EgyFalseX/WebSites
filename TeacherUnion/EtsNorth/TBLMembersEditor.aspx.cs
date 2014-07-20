using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class TBLMembersEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionsEtsNorth.IsAuth)
        {
            Response.Redirect("~/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }


    }
    
}