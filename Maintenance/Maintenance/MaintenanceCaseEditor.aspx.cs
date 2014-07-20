using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintenanceCaseEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMaintenance.MaintenanceIsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("Default.aspx");
            return;
        }
        if (!IsPostBack)
            bindUI(Convert.ToInt32(Request.QueryString["id"]));
    }
    void bindUI(int id)
    {
        dsMaintenanceTableAdapters.MaintenanceTableAdapter adp = new dsMaintenanceTableAdapters.MaintenanceTableAdapter();
        dsMaintenance.MaintenanceDataTable dt = adp.GetDataByMaintenanceId(id);
        if (dt.Count == 0)
        {
            Response.Redirect("Default.aspx");
            return;
        }
        dsMaintenance.MaintenanceRow row = dt[0];
        if (!row.read_code)
        {
            //set message read to true
            adp.SetReaded(row.MaintenanceId);
        }
        deMaintenanceDate.Value = row.MaintenanceDate;
        tbrealname.Text = row["sendername"].ToString();
        tbmaddres.Text = row.maddres;
        tbmassage.Text = row.massage;
        cbtodeptId.Value = row.todeptId.ToString();
        cemclosed.Checked = row.mclosed;
        tbtodepreply.Text = row.todepreply;

        cemclosed.Visible = sessionMaintenance.MaintenanceIsAdmin;// show close only for admin
        //btnSave.Visible = !row.mclosed;
        if (row.mclosed)
        {
            lbldateclosed.Text = row["closename"].ToString();
            lbldateclosed.Text = row.dateclosed.ToShortDateString();
            btnSave.Visible = false;
        }
        else
        {
            if (row.todeptId.ToString() == sessionMaintenance.deptId || sessionMaintenance.MaintenanceIsAdmin)// show save btn only for admin or for sender
                btnSave.Visible = true;
            else
                btnSave.Visible = false;
            if (row.UserID.ToString() != sessionMaintenance.MaintenanceUserID)
            {
                btnSave.Visible = true;
                lbldateclosed.Visible = false;
                lbldateclosed.Visible = false;
                ASPxFormLayoutMain.Items[9].ShowCaption = DevExpress.Utils.DefaultBoolean.False;
                ASPxFormLayoutMain.Items[10].ShowCaption = DevExpress.Utils.DefaultBoolean.False;
            }
            else
            {
                cemclosed.Visible = true;
                btnSave.Visible = true;
            }
        }

        

        //if (row.UserID.ToString() == sessionMaintenance.MaintenanceUserID && !sessionMaintenance.MaintenanceIsAdmin)
        //{
        //    btnSave.Visible = false;
        //}
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        tbtodepreply.Validate();
        if (!tbtodepreply.IsValid)
            return;
        int id = Convert.ToInt32(Request.QueryString["id"]);
        dsMaintenanceTableAdapters.MaintenanceTableAdapter adp = new dsMaintenanceTableAdapters.MaintenanceTableAdapter();
        adp.SaveReply(tbtodepreply.Text, id);
        if (cemclosed.Checked)
        {
            adp.SetClosed(Convert.ToInt32(sessionMaintenance.MaintenanceUserID), DateTime.Now, id);
        }
        //btnSave.JSProperties["cpShowPopup"] = "تم الحفظ ...";
        lblState.Text = "تم حفظ الرسالة";
    }
}