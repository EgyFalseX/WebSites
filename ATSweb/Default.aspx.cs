using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.UserID == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
    }
    protected void RCBSkins_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        
        if (RCBSkins.SelectedIndex > 0)
        {
            TheSessions.TelerikSkin = RCBSkins.SelectedValue;
            DB.SaveUserSkin(RCBSkins.SelectedValue);
            Response.Redirect("Default.aspx");
        }
        
    }
   
}