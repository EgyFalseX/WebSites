using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;

public partial class TBLMembers : System.Web.UI.UserControl
{
    private void CLearForm()
    {
        cbSyndicateId.Value = null;
        cbSubCommitteId.Value = null;
        tbMemberName.Value = null;
        deBdate.Value = null;
        cbGenderId.Value = null;
        cbMaritalStatusId.Value = null;
        cbIdTypeId.Value = null;
        tbNID.Value = null;
        deNIDEndDate.Value = null;
        tbStreet.Value = null;
        tbHomeNo.Value = null;
        tbFlatNo.Value = null;
        tbArea.Value = null;
        tbCity.Value = null;
        cbGovId.Value = null;
        tbMobile.Value = null;
        tbHomeTel.Value = null;
        tbWorkTel.Value = null;
        tbEMail.Value = null;
        tbKidNO.Value = null;
        tbReceiptNo.Value = null;
        cbGehaId.Value = null;
        cbContactTypeID.Value = null;
    }
    private void LoadInfo(object MemberId)
    {
        DataTable dt = MC.SelectTBLMembers(MemberId);
        if (dt.Rows.Count == 0)
            Response.Redirect(Request.Url.ToString());

        DataRow row = dt.Rows[0];

        if ((bool)row["Closed"] == true && TheSessions.IsAdmin == false)
            Response.Redirect("../AccessDenied.aspx");


        cbSyndicateId.Value = row["SyndicateId"];
        cbSubCommitteId.Value = row["SubCommitteId"];
        tbMemberName.Value = row["MemberName"];
        deBdate.Value = row["Bdate"];
        cbGenderId.Value = row["GenderId"];
        cbMaritalStatusId.Value = row["MaritalStatusId"];
        cbIdTypeId.Value = row["IdTypeId"];
        tbNID.Value = row["NID"];
        deNIDEndDate.Value = row["NIDEndDate"];
        tbStreet.Value = row["Street"];
        tbHomeNo.Value = row["HomeNo"];
        tbFlatNo.Value = row["FlatNo"];
        tbArea.Value = row["Area"];
        tbCity.Value = row["City"];
        cbGovId.Value = row["GovId"];
        tbMobile.Value = row["Mobile"];
        tbHomeTel.Value = row["HomeTel"];
        tbWorkTel.Value = row["WorkTel"];
        tbEMail.Value = row["EMail"];
        tbKidNO.Value = row["KidNO"];
        cbContactTypeID.Value = row["ContactTypeID"];
        tbReceiptNo.Value = row["ReceiptNo"];
        cbGehaId.Value = row["GehaId"];
        lblPath.Value = row["MemberImage"].ToString();
        myImg.ImageUrl = MC.FilesPath + row["MemberImage"];
        HttpContext.Current.Session["CompanionImage"] = row["MemberImage"];
 
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            HttpContext.Current.Session["CompanionImage"] = null;
            DSSyndicateId.Selecting += DSSyndicateId_Selecting;
        }

        if (Request.QueryString["mm"] != null)
        {
            if (!IsPostBack)
                LoadInfo(Request.QueryString["mm"]);
            ASPxPageControl1.TabPages[1].Visible = true;
            ASPxPageControl1.TabPages[1].Enabled = true;
        }
        else
        {
            ASPxPageControl1.TabPages[1].Visible = false;
            ASPxPageControl1.TabPages[1].Enabled = false;
        }

    }
    protected void DSSyndicateId_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (TheSessions.IsAdmin)
        {
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]";
        }
        else
        {
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate] WHERE SyndicateId = " + TheSessions.SyndicateId;
        }
    }
    protected void cbSyndicateId_SelectedIndexChanged(object sender, EventArgs e)
    {
        HFSyndicateId.Value = cbSyndicateId.Value.ToString();
    }
    protected void UCFile_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);
        
        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        UCpic.UploadedFiles[0].SaveAs(MapPath(MC.FilesPath + FName), true);
        e.CallbackData = FName;
        HttpContext.Current.Session["CompanionImage"] = FName;
    }
    protected void UCpic_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        UCpic.UploadedFiles[0].SaveAs(MapPath(MC.FilesPath + FName), true);
        Session["CompanionImage"] = FName;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (MC.IsNullOrEmpty(Request.QueryString["mm"]))
            {
                object member = MC.InsertTBLMembers(cbSyndicateId.Value, cbSubCommitteId.Value, tbMemberName.Value, deBdate.Value, cbGenderId.Value, cbMaritalStatusId.Value, cbIdTypeId.Value,
                tbNID.Value, deNIDEndDate.Value, tbStreet.Value, tbHomeNo.Value, tbFlatNo.Value, tbArea.Value, tbCity.Value, cbGovId.Value, tbMobile.Value, tbHomeTel.Value,
                tbWorkTel.Value, tbEMail.Value, tbKidNO.Value, cbContactTypeID.Value, HttpContext.Current.Session["CompanionImage"], tbReceiptNo.Value, cbGehaId.Value);
                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم الاضافه";
                Response.Redirect(Request.Url.ToString() + "?mm=" + member);
            }
            else if (MC.UpdateTBLMembers(Request.QueryString["mm"], cbSyndicateId.Value, cbSubCommitteId.Value, tbMemberName.Value, deBdate.Value, cbGenderId.Value, cbMaritalStatusId.Value, cbIdTypeId.Value,
                tbNID.Value, deNIDEndDate.Value, tbStreet.Value, tbHomeNo.Value, tbFlatNo.Value, tbArea.Value, tbCity.Value, cbGovId.Value, tbMobile.Value, tbHomeTel.Value,
                tbWorkTel.Value, tbEMail.Value, tbKidNO.Value, cbContactTypeID.Value, HttpContext.Current.Session["CompanionImage"], tbReceiptNo.Value, cbGehaId.Value))
            {
                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم التعديل";
            }
        }
        catch (SqlException ex)
        {
            ASPxPopupControlEditor.JSProperties["cpShowPopup"] = ex.Message;
        }
    }

    protected void GVEditor_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم الاضـــافه ...";

    }
    protected void GVEditor_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم التعــــديل ...";

    }
    protected void GVEditor_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم الحـــذف ...";
        if (System.IO.File.Exists(MapPath(MC.FilesPath + e.Values["CompanionImage"])))//Delete Pic
            System.IO.File.Delete(MapPath(MC.FilesPath + e.Values["CompanionImage"]));
    }
    protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        if (Session["CompanionImage"] != null)
            e.NewValues["CompanionImage"] = Session["CompanionImage"];
        Session.Remove("CompanionImage");

        if (e.NewValues["CompanionImage"] != e.OldValues["CompanionImage"])//Delete Old File
        {
            if (System.IO.File.Exists(MapPath(MC.FilesPath + e.OldValues["CompanionImage"])))
                System.IO.File.Delete(MapPath(MC.FilesPath + e.OldValues["CompanionImage"]));
        }

    }
    protected void GVEditor_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        if (Session["CompanionImage"] != null)
        {
            e.NewValues["CompanionImage"] = Session["CompanionImage"];
            Session.Remove("CompanionImage");
        }
    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("CompanionImage");

        ViewState["OpeningEditor"] = true;//To Load Data Into Editor
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("CompanionImage");
    }

    
}