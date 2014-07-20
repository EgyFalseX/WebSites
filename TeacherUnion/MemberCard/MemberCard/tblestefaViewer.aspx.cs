using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tblestefaViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMemberCard.IsAuth)
            Response.Redirect("~/MemberCard/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

    }
}