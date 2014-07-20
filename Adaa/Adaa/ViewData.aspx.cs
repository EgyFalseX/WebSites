using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adaa_ViewData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["dataid"] == null)
            return;

        ASPxHtmlEditorViewer.Html = MCAdaa.GetData(Request.QueryString["dataid"]);
    }
}