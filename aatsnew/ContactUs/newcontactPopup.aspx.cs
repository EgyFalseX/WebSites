using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newcontactPopup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        DevExpress.Web.ASPxPopupControl.ASPxPopupControl popup = new DevExpress.Web.ASPxPopupControl.ASPxPopupControl();
        popup.ID = "popup";
        popup.ClientInstanceName = "popup";
        popup.ContentUrl = "newcontact.aspx";
        popup.HeaderText = "Popup";
        popup.Height = 600;
        popup.Width = 600;
        popup.AutoUpdatePosition = true;
        Form.Controls.Add(popup);
    }
    protected void ASPxButton2_Click(object sender, EventArgs e)
    {
        
    }
}