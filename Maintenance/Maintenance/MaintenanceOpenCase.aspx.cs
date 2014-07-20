using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintenanceOpenCase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMaintenance.MaintenanceIsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        deMaintenanceDate.Value = DateTime.Now;
        tbrealname.Text = sessionMaintenance.MaintenanceRealname;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        cbtodeptId.Validate(); tbmaddres.Validate(); tbmassage.Validate();
        if (!cbtodeptId.IsValid || !tbmaddres.IsValid || !tbmassage.IsValid)
            return;
        dsMaintenanceTableAdapters.MaintenanceTableAdapter adp = new dsMaintenanceTableAdapters.MaintenanceTableAdapter();
        adp.Insert(DateTime.Now, Convert.ToInt32(sessionMaintenance.MaintenanceUserID), Convert.ToByte(cbtodeptId.Value), string.Empty, tbmassage.Text, false, null, null, false, tbmaddres.Text);
        lblState.Text = "تم ارسال الرسالة";
        tbmaddres.Text = string.Empty; tbmassage.Text = string.Empty;
        //btnSave.JSProperties["cpShowPopup"] = "تم الارسال ...";
    }
}