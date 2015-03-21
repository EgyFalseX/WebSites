using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VideoViewerEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionImageGallary.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!sessionImageGallary.IsAdmin)
        {
            Response.Redirect("Login.aspx?RedirectURL=AccessDenied.aspx");
        }
    }
    protected void ASPxCallbackPanelData_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        if (ASPxTreeListData.FocusedNode.GetValue("Id") != null)
        {
            dsData.Select(DataSourceSelectArguments.Empty);
            ASPxGridViewData.DataBind();
        }
        
    }
    
    protected void dsData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (ASPxTreeListData.FocusedNode.GetValue("Id") == null)
        {
            e.Command.CommandText = "";
        }
        else
        {
            e.Command.CommandText = "SELECT * FROM VideoLinks WHERE VideoFolder = " + ASPxTreeListData.FocusedNode.GetValue("Id");
            
        }
        dsData.DataBind();

    }
    protected void dsData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["VideoFolder"].Value = ASPxTreeListData.FocusedNode.GetValue("Id");
    }
}