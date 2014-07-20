using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class alldataViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsAdaa.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!TheSessionsAdaa.IsAdmin)
            Response.Redirect("AccessDenied.aspx");

        if (Request.QueryString["eporttypeid"] == null)
            GVEditor.Visible = false;
        else
            GVEditor.Visible = true;
    }
    protected void ASPxCallbackPanelViewer_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        //ASPxHtmlEditorViewer.Html = MCAdaa.GetData(e.Parameter);
        //Response.Redirect("ViewData.aspx?dataid=" + e.Parameter);
        
        //string Qry = "ViewData.aspx?dataid=" + e.Parameter;
        //string NewWin = String.Format("Window.open('{0}');", Qry);
        //ClientScript.RegisterStartupScript(this.GetType(), "pop", NewWin, true);
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        if (ASPxCBreporttypeid.Value == null)
            return;
        Response.Redirect("alldataViewer.aspx?eporttypeid=" + ASPxCBreporttypeid.Value);
    }
}