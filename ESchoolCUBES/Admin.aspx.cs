using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ViewState["id"] = string.Empty;
        if (Request.QueryString["id"] != null)
        {
            ViewState["id"] = Request.QueryString["id"].ToString();
        }
        ShowUC();
    }
    
    public void ShowUC()
    {

        UserControl UC;

        switch (ViewState["id"].ToString())
        {
            case "1"://Show Cat UC
                UC = (UserControl)Page.LoadControl("UserControl/SLCatEditor.ascx");
                PnlShowScreen.Controls.Add(UC);
                RadPanelBarAdmin.Items[0].Selected = true;
                break;
            case "2"://Show Book UC
                UC = (UserControl)Page.LoadControl("UserControl/SLBookEditor.ascx");
                PnlShowScreen.Controls.Add(UC);
                RadPanelBarAdmin.Items[1].Selected = true;
                break;
            case "3"://Show Manager UC
                UC = (UserControl)Page.LoadControl("UserControl/SLUserManager.ascx");
                PnlShowScreen.Controls.Add(UC);
                RadPanelBarAdmin.Items[2].Selected = true;
                break;
            case "4"://Show Summary UC
                UC = (UserControl)Page.LoadControl("UserControl/SLSummary.ascx");
                PnlShowScreen.Controls.Add(UC);
                RadPanelBarAdmin.Items[3].Selected = true;
                break;
        }
    }
   
}
