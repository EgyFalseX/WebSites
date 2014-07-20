using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class ViewMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }
        DSData.FilterExpression = null;
        DSData.FilterExpression = "ItemID = " + Request.QueryString["id"];
        DSData.DataBind();
        ASPxDataViewViewer.DataBind();
    }
   
}