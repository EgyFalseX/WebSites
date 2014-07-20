using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class OldCompanionEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.IsAuth)
        {
            Response.Redirect("~/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        }
        if (!TheSessions.IsAdmin)
            cbSyndicateId.Enabled = false;

        if (HttpContext.Current.Session["CompanionImage3"] != null)
        {
            myImg.ImageUrl = @"Assets/Images/" + HttpContext.Current.Session["CompanionImage3"].ToString();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        lblSate.Text = string.Empty;
        if (MC.IsNullOrEmpty(cb.Value) || MC.IsNullOrEmpty(cbCompanion.Value))
        {
            return;
        }
        if (Session["CompanionImage3"] == null || MC.IsNullOrEmpty(cbNew.Value))
        {
            lblSate.Text = "من فضلك اختر صورة واختر عضو الذي سيتم له الاضافة";
            return;
        }
        dsETST ds = new dsETST();
        dsETSTTableAdapters.OldTBLCompanionTableAdapter adpOld = new dsETSTTableAdapters.OldTBLCompanionTableAdapter();
        dsETSTTableAdapters.TBLCompanionTableAdapter adpNew = new dsETSTTableAdapters.TBLCompanionTableAdapter();
        dsETST.OldTBLCompanionRow Old = (dsETST.OldTBLCompanionRow)adpOld.GetDataByCompanionId(Convert.ToDecimal(cbCompanion.Value)).Rows[0];
        dsETST.TBLCompanionRow New = ds.TBLCompanion.NewTBLCompanionRow();
        New.MemberId = Convert.ToDecimal(cbNew.Value);
        New.CompanionId = Convert.ToDecimal(MC.GetNewID("TBLCompanion", "CompanionId"));
        if (!Old.IsCompanionTypeIdNull())
        {
            New.CompanionTypeId = Old.CompanionTypeId;
        }
        if (!Old.IsCompanionNameNull())
        {
            New.CompanionName = Old.CompanionName;
        }
        if (!Old.IsGenderIdNull())
        {
            New.GenderId = Old.GenderId;
        }
        if (!Old.IsCompanionBdateNull())
        {
            New.CompanionBdate = Old.CompanionBdate;
        }
        New.CompanionImage = Session["CompanionImage3"].ToString();
        New.renew = true;
        Session.Remove("CompanionImage3");
        New.userin = Convert.ToInt32(TheSessions.UserID);
        New.datein = DateTime.Now;
        ds.TBLCompanion.AddTBLCompanionRow(New);
        New.EndEdit();
        adpNew.Update(ds.TBLCompanion);
        ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "تم الاضافه";
    }
    protected void DSCDSyndicate_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (TheSessions.IsAdmin)
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]";
        else
            e.Command.CommandText = "SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate] WHERE SyndicateId = " + TheSessions.SyndicateId;
    }
    protected void UCFile_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        UCpic.UploadedFiles[0].SaveAs(MapPath(@"Assets/Images/" + FName), true);
        e.CallbackData = FName;
        Session["CompanionImage3"] = FName;
    }
    protected void DSDataOld_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (!TheSessions.IsAdmin)
        {
            e.Command.CommandText = @"SELECT [MemberId], [MemberName] FROM [OldTBLMembers] WHERE ([SyndicateId] = " + TheSessions.SyndicateId + @") order by MemberName";
        }
        else
        {
            e.Command.CommandText = @"SELECT [MemberId], [MemberName] FROM [OldTBLMembers] WHERE ([SyndicateId] = ?) order by MemberName";
        }
    }
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

        if (!TheSessions.IsAdmin)
        {
            e.Command.CommandText = @"SELECT [MemberId], [MemberName] FROM [TBLMembers] WHERE ([SyndicateId] = " + TheSessions.SyndicateId + ") order by MemberName";
        }
        else
        {
            e.Command.CommandText = @"SELECT [MemberId], [MemberName] FROM [TBLMembers] WHERE ([SyndicateId] = ?) order by MemberName";
        }
    }
}