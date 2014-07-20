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
        cbJobtitleID.Value = null;
        deBirthDate.Value = null;
        deWorkeDate.Value = null;
        cbMemberqualId.Value = null;
        cbMemberSpecialization.Value = null;
        lblPath.Value = null;
        myImg.ImageUrl = string.Empty;
    }
    private void LoadInfo(object MemberId)
    {
        DataTable dt = mcMemberWeb.SelectTBLMembers(MemberId);
        if (dt.Rows.Count == 0)
            Response.Redirect(Request.Url.ToString());

        DataRow row = dt.Rows[0];

        //if ((bool)row["Closed"] == true && sessionMemberWeb.IsAdmin == false)
        //    Response.Redirect("../AccessDenied.aspx");

        cbSyndicateId.Value = row["SyndicateId"];
        cbSubCommitteId.Value = row["SubCommitteId"];
        tbMemberName.Value = row["MemberName"];
        deBirthDate.Value = row["BirthDate"];
        cbMemberqualId.Value = row["MemberqualId"];
        cbMemberSpecialization.Value = row["MemberSpecialization"];
        deWorkeDate.Value = row["WorkeDate"];
        lblPath.Value = row["img"].ToString();
        myImg.ImageUrl = mcMemberWeb.FilesPath + row["img"];
 
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["mm"] != null)
        {
            if (!IsPostBack)
                LoadInfo(Request.QueryString["mm"]);
        }
    }
    protected void DSSyndicateId_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (sessionMemberWeb.IsAdmin)
        {
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]";
        }
        else
        {
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate] WHERE SyndicateId = " + sessionMemberWeb.SyndicateId;
        }
    }
    protected void UCFile_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);
        
        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        UCpic.UploadedFiles[0].SaveAs(MapPath(mcMemberWeb.FilesPath + FName), true);
        e.CallbackData = FName;
        HttpContext.Current.Session["img"] = FName;
    }
    protected void UCpic_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        UCpic.UploadedFiles[0].SaveAs(MapPath(mcMemberWeb.FilesPath + FName), true);
        Session["img"] = FName;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (mcMemberWeb.IsNullOrEmpty(Request.QueryString["mm"]))
            {
                object member = mcMemberWeb.InsertTBLMembers(cbSyndicateId.Value, cbSubCommitteId.Value, tbMemberName.Value, deBirthDate.Value, 
                    cbJobtitleID.Value, deWorkeDate.Value, cbMemberqualId.Value, cbMemberSpecialization.Value, lblPath.Value);
                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم الاضافه";
                Response.Redirect(Request.Url.ToString() + "?mm=" + member);
            }
            else if (mcMemberWeb.UpdateTBLMembers(Request.QueryString["mm"], cbSyndicateId.Value, cbSubCommitteId.Value, tbMemberName.Value, deBirthDate.Value,
                cbJobtitleID.Value, deWorkeDate.Value, cbMemberqualId.Value, cbMemberSpecialization.Value, lblPath.Value))
            {
                ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم التعديل";
            }
        }
        catch (SqlException ex)
        {
            ASPxPopupControlEditor.JSProperties["cpShowPopup"] = ex.Message;
        }
    }
    
}