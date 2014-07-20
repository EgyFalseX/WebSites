using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class ViewAllMessages : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        switch (ASPxCBLagnaId.SelectedItem.Value.ToString())
        {
            case"1":
                GVEditor.DataSourceID = "DSData1";
                GVEditor.DataBind();
                break;
            case "2":
                GVEditor.DataSourceID = "DSData2";
                GVEditor.DataBind();
                break;
            case "3":
                GVEditor.DataSourceID = "DSData3";
                GVEditor.DataBind();
                break;
            case "4":
                GVEditor.DataSourceID = "DSData4";
                GVEditor.DataBind();
                break;
            default:
                break;
        }
        GVEditor.Visible = true;
    }
}