using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Functions;

public partial class Reports : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!Functions.MC.GetPagePriv(new System.IO.FileInfo(System.Web.HttpContext.Current.Request.Url.AbsolutePath).Name, TheSessions.UserID))
        {
            Response.Redirect("~/AccessDenied.aspx");
            return;
        }
        if (!IsPostBack)
        {
            
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
    protected void DDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList DDL = (DropDownList)sender;
        ReportViewerStore.ServerReport.ReportPath = MC.ReportPath + DDL.SelectedValue;
        ReportViewerStore.ServerReport.ReportServerUrl = new System.Uri(MC.ReportURL, System.UriKind.Absolute);
        //ReportViewerStore.ServerReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("PramName", "PramValue"));
    }
    
}