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
    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        string path = string.Format(@"ViewMembers.aspx?m={0}&e={1}&g={2}", cbModereaId.Value, cdEdaraId.Value, cdGehaId.Value);
        Response.Redirect(path);
    }
}