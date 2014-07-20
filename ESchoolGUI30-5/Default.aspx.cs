using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected override void OnPreRender(EventArgs e)
    {
        OleDbCommand COM1 = new OleDbCommand("sdfsdf", MySchool.ControlConnection);
    }
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);


    }
    protected override void OnPreRenderComplete(EventArgs e)
    {
        base.OnPreRenderComplete(e);
        if (TheSessions.StudentID != null)
        {
            Response.Redirect(@"Student\Default.aspx");
        }
    }
}
