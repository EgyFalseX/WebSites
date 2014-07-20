using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Functions;

public partial class ReportThis : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.ReportName != null)
        {
            ReportViewerStore.ServerReport.ReportPath = MC.ReportPath + TheSessions.ReportName;
            ReportViewerStore.ServerReport.ReportServerUrl = new System.Uri(MC.ReportURL, System.UriKind.Absolute);
            TheSessions.ReportName = null;
        }
        
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }

}