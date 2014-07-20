using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (Request.QueryString["openparent"] != null)
        {
            RadPanelBar1.FindItemByValue(Request.QueryString["openparent"]).Expanded = true;
            if (Request.QueryString["openchild"] != null)
                RadPanelBar1.FindItemByValue((string)Request.QueryString["openchild"]).Expanded = true;
        }
        
    }

}