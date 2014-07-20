using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;

public partial class zdataViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DSData.DataFile = MapPath(@"~/App_Data/" + TheSessionsZamala.dbName );
        if (!TheSessionsZamala.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }
}