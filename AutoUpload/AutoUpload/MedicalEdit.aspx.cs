using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MedicalEdit : System.Web.UI.Page
{
    dsMedicalTableAdapters.tblmedicalTableAdapter adp = new dsMedicalTableAdapters.tblmedicalTableAdapter();
    dsMedicalTableAdapters.NETWORKTableAdapter adpNetwork = new dsMedicalTableAdapters.NETWORKTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Edit"] != null)
            {
                btnEdit.Visible = true;
                btnSave.Visible = false;
                Binding();
                return;
            }
            if (Request.QueryString["id"] == null || Request.QueryString["type"] == null)
            {
                Response.Redirect("SelectMedicalChanges.aspx");
            }
        }
    }
    private void Binding()
    {
        dsMedical.tblmedicalRow row = adp.GetDataByid(Convert.ToInt32(Request.QueryString["Edit"]))[0];
        dsMedical.NETWORKRow NetWorkRow = adpNetwork.GetDataByID(row.IDnetwork)[0];

        cbGOVID.Value = NetWorkRow.GOVID.ToString();
        cbgehatypid.Value = NetWorkRow.gehatypid.ToString();
        cbtaksosid.Value = NetWorkRow.taksosid.ToString();
        cbIDnetwork.Value = row.IDnetwork.ToString();
        dedatetahweel.Date = row.datetahweel;
        tbrem.Text = row.rem;

        HFid.Value = row.memberid.ToString();
        HFtype.Value = row.typemember.ToString();

    }
   
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblState.Text = string.Empty;

        if (MC.IsNullOrEmpty(dedatetahweel.Value) || MC.IsNullOrEmpty(cbIDnetwork.Value))
        {
            lblState.Text = "من فضلك ادخل جميع البيانات المطلوبة";
            return;
        }
        byte typemember = Convert.ToByte(Request.QueryString["type"]);
        int memberid = Convert.ToInt32(Request.QueryString["id"]);
        DateTime datetahweel = dedatetahweel.Date;
        int IDnetwork = Convert.ToInt32(cbIDnetwork.Value);
        string rem = string.Empty;
        if (!MC.IsNullOrEmpty(tbrem.Value))
            rem = tbrem.Value.ToString();
        int userin = Convert.ToInt32(TheSessions.UserID);
        adp.Insert(typemember, memberid, datetahweel, IDnetwork, rem, userin, DateTime.Now);
        ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم الحفظ";
        Response.Redirect("SelectMedicalChanges.aspx");
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        lblState.Text = string.Empty;

        if (MC.IsNullOrEmpty(dedatetahweel.Value) || MC.IsNullOrEmpty(cbIDnetwork.Value))
        {
            lblState.Text = "من فضلك ادخل جميع البيانات المطلوبة";
            return;
        }
        byte typemember = Convert.ToByte(HFtype.Value);
        int memberid = Convert.ToInt32(HFid.Value);
        DateTime datetahweel = dedatetahweel.Date;
        int IDnetwork = Convert.ToInt32(cbIDnetwork.Value);
        string rem = string.Empty;
        if (!MC.IsNullOrEmpty(tbrem.Value))
            rem = tbrem.Value.ToString();
        int userin = Convert.ToInt32(TheSessions.UserID);
        adp.Update(typemember, memberid, datetahweel, IDnetwork, rem, userin, DateTime.Now, Convert.ToInt32(Request.QueryString["Edit"]));
        ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم التعديل";
        Response.Redirect("SelectMedicalChanges.aspx");
    }

}