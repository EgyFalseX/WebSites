using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxMenu;
using DevExpress.Web.ASPxNavBar;
using DevExpress.Web.ASPxTabControl;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
        protected void Page_Load(object sender, EventArgs e) {

        }
        protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            sessionMails.UserID = null;
        }
}