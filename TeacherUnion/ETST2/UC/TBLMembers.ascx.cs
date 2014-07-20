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
        cbMemberSyndicateId.Value = null;
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
        cbDaftar.Value = null;
        cbrenew.Checked = false;
    }
    private void LoadInfo(object MemberId, bool Old = false)
    {
        DataTable dt = new DataTable();
        if (Old)
            dt = MC.SelectOldTBLMembers(MemberId);
        else
            dt = MC.SelectTBLMembers(MemberId);
        
        if (dt.Rows.Count == 0)
            Response.Redirect(Request.Url.ToString());

        DataRow row = dt.Rows[0];

        if ((bool)row["Closed"] == true && TheSessions.IsAdmin == false && !Old)
            Response.Redirect("../AccessDenied.aspx");

        cbSyndicateId.Value = row["SyndicateId"].ToString();
        if (!Old)
        {
            cbMemberSyndicateId.Value = row["MemberSyndicateId"].ToString();
            cbSyndicateId_SelectedIndexChanged(cbSyndicateId, null);
        }
        cbSubCommitteId.Value = row["SubCommitteId"].ToString();

        tbMemberName.Value = row["MemberName"].ToString();
        deBdate.Value = row["Bdate"];
        cbGenderId.Value = row["GenderId"].ToString();
        cbMaritalStatusId.Value = row["MaritalStatusId"].ToString();
        cbIdTypeId.Value = row["IdTypeId"].ToString();
        tbNID.Value = row["NID"].ToString();
        deNIDEndDate.Value = row["NIDEndDate"];
        tbStreet.Value = row["Street"].ToString();
        tbHomeNo.Value = row["HomeNo"].ToString();
        tbFlatNo.Value = row["FlatNo"].ToString();
        tbArea.Value = row["Area"].ToString();
        tbCity.Value = row["City"].ToString();
        cbGovId.Value = row["GovId"].ToString();
        tbMobile.Value = row["Mobile"].ToString();
        tbHomeTel.Value = row["HomeTel"].ToString();
        tbWorkTel.Value = row["WorkTel"].ToString();
        tbEMail.Value = row["EMail"].ToString();
        tbKidNO.Value = row["KidNO"].ToString();
        cbContactTypeID.Value = row["ContactTypeID"].ToString();
        if (!Old)
        {
            if (row["renew"].ToString() != string.Empty)
            {
                cbrenew.Checked = (bool)row["renew"];
            }
        }
        else
        {
            cbrenew.Checked = true;
            cbrenew.Enabled = true;
        }
       
        if (row["ReceiptNo"].ToString() != string.Empty && !Old)
        {
            dsETSTTableAdapters.QueriesTableAdapter adpQry = new dsETSTTableAdapters.QueriesTableAdapter();
            object obj = adpQry.GetDaftarNumber(Convert.ToInt32(row["ReceiptNo"]), Convert.ToInt32(row["ReceiptNo"]), Convert.ToInt32(row["SyndicateId"]));
            cbDaftar.Value = obj;
        }
        cbGehaId.Value = row["GehaId"].ToString();
        
        if (!Old)
        {
            tbReceiptNo.Value = row["ReceiptNo"].ToString();
            lblPath.Value = row["MemberImage"].ToString().ToString();
            myImg.ImageUrl = MC.FilesPath + row["MemberImage"].ToString();
            HttpContext.Current.Session["CompanionImage"] = row["MemberImage"].ToString();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HttpContext.Current.Session["CompanionImage"] = null;
            DSSyndicateId.Selecting += DSSyndicateId_Selecting;
        }
        else
        {
            if (HttpContext.Current.Session["CompanionImage"] != null)
            {
                myImg.ImageUrl = MC.FilesPath + HttpContext.Current.Session["CompanionImage"].ToString();
            }
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
            if (Request.QueryString["mmo"] != null)
            {
                if (!IsPostBack)
                {
                    LoadInfo(Request.QueryString["mmo"], true);
                    cbrenew.Checked = true;
                    cbrenew.Enabled = false;
                }
            }
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
        HFSyndicateId.Value = cbMemberSyndicateId.Value.ToString();
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
        Session["CompanionImage2"] = FName;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        lblState.Text = string.Empty;
        cbSyndicateId.Validate();
        cbMemberSyndicateId.Validate();
        cbSubCommitteId.Validate();
        tbMemberName.Validate();
        deBdate.Validate();
        cbGenderId.Validate();
        cbMaritalStatusId.Validate();
        cbIdTypeId.Validate();
        tbNID.Validate();
        deNIDEndDate.Validate();
        tbStreet.Validate();
        cbGovId.Validate();
        tbMobile.Validate();
        tbKidNO.Validate();
        cbContactTypeID.Validate();

        if (!cbSyndicateId.IsValid || !cbMemberSyndicateId.IsValid || !cbSubCommitteId.IsValid || !tbMemberName.IsValid || !deBdate.IsValid || !cbMaritalStatusId.IsValid ||
            !cbIdTypeId.IsValid || !tbNID.IsValid || !deNIDEndDate.IsValid || !tbStreet.IsValid || !cbGovId.IsValid || !tbMobile.IsValid ||
            !tbMobile.IsValid || !tbKidNO.IsValid || !cbContactTypeID.IsValid || HttpContext.Current.Session["CompanionImage"] == null)
        {
            lblState.Text = "يجب ادخال كل البيانات المطلوبة";
            return;
        }
        dsETST ds = new dsETST();
        dsETSTTableAdapters.QueriesTableAdapter adpQry = new dsETSTTableAdapters.QueriesTableAdapter();
        object obj = adpQry.ExistsEsalNumber(Convert.ToInt32(tbReceiptNo.Text), Convert.ToInt32(tbReceiptNo.Text), Convert.ToInt32(cbDaftar.Value), Convert.ToInt32(cbSyndicateId.Value));
        if (obj == null)
        {
            lblState.Text = "خطاء في رقم الايصال";
            return;
        }
        if (MC.IsNullOrEmpty(Request.QueryString["mm"]))
        {
            if ((int)adpQry.ExistsReceiptNo(Convert.ToInt32(tbReceiptNo.Text), -111) != 0)
            {
                lblState.Text = "رقم الايصال تم ادراجه مسبقا";
                return;
            } 
        }
        else
        {
            if ((int)adpQry.ExistsReceiptNo(Convert.ToInt32(tbReceiptNo.Text), Convert.ToDecimal(Request.QueryString["mm"])) != 0)
            {
                lblState.Text = "رقم الايصال تم ادراجه مسبقا";
                return;
            }
        }
        
        object img = HttpContext.Current.Session["CompanionImage"];
        HttpContext.Current.Session.Remove("CompanionImage"); Session.Remove("CompanionImage");
        try
        {
            if (MC.IsNullOrEmpty(Request.QueryString["mm"]))
            {
                object member = MC.InsertTBLMembers(cbSyndicateId.Value, cbSubCommitteId.Value, tbMemberName.Value, deBdate.Value, cbGenderId.Value, cbMaritalStatusId.Value, cbIdTypeId.Value,
                tbNID.Value, deNIDEndDate.Value, tbStreet.Value, tbHomeNo.Value, tbFlatNo.Value, tbArea.Value, tbCity.Value, cbGovId.Value, tbMobile.Value, tbHomeTel.Value,
                tbWorkTel.Value, tbEMail.Value, tbKidNO.Value, cbContactTypeID.Value, img, tbReceiptNo.Value, cbGehaId.Value, cbrenew.Checked, cbMemberSyndicateId.Value);
                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم الاضافه";
                //disable old member to b added again
                if (!MC.IsNullOrEmpty(Request.QueryString["mmo"]))
                {
                    adpQry.OldTblMamber_Imported(Convert.ToDecimal(Request.QueryString["mmo"]));
                }
                Response.Redirect("TBLMembers.aspx?mm=" + member);
            }
            else if (MC.UpdateTBLMembers(Request.QueryString["mm"], cbSyndicateId.Value, cbSubCommitteId.Value, tbMemberName.Value, deBdate.Value, cbGenderId.Value, cbMaritalStatusId.Value, cbIdTypeId.Value,
                tbNID.Value, deNIDEndDate.Value, tbStreet.Value, tbHomeNo.Value, tbFlatNo.Value, tbArea.Value, tbCity.Value, cbGovId.Value, tbMobile.Value, tbHomeTel.Value,
                tbWorkTel.Value, tbEMail.Value, tbKidNO.Value, cbContactTypeID.Value, img, tbReceiptNo.Value, cbGehaId.Value, cbrenew.Checked, cbMemberSyndicateId.Value))
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
        //if (System.IO.File.Exists(MapPath(MC.FilesPath + e.Values["CompanionImage"])))//Delete Pic
        //    System.IO.File.Delete(MapPath(MC.FilesPath + e.Values["CompanionImage"]));
    }
    protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        if (Session["CompanionImage2"] != null)
            e.NewValues["CompanionImage"] = Session["CompanionImage2"];
        Session.Remove("CompanionImage2");

        //if (e.NewValues["CompanionImage"] != e.OldValues["CompanionImage"])//Delete Old File
        //{
        //    if (System.IO.File.Exists(MapPath(MC.FilesPath + e.OldValues["CompanionImage"])))
        //        System.IO.File.Delete(MapPath(MC.FilesPath + e.OldValues["CompanionImage"]));
        //}

    }
    protected void GVEditor_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        if (Session["CompanionImage2"] != null)
        {
            e.NewValues["CompanionImage"] = Session["CompanionImage2"];
            Session.Remove("CompanionImage2");
        }
    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("CompanionImage2");

        ViewState["OpeningEditor"] = true;//To Load Data Into Editor
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("CompanionImage2");
    }

    protected void DSTBLCompanion_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["CompanionId"].Value = MC.GetNewID("TBLCompanion", "CompanionId");
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("TBLMembers.aspx");
    }

}