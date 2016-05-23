using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VideoCategoryEditor : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionImageGallary.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        //if (!sessionImageGallary.IsAdmin)
        //{
        //    Response.Redirect("Login.aspx?RedirectURL=AccessDenied.aspx");
        //}
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
    }
    protected void GVEditor_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {

    }

    protected void UCpic_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}{6}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second, DateTime.Now.Millisecond);

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        if (!System.IO.Directory.Exists(MapPath(sessionImageGallary.CategoryImagePath)))
            System.IO.Directory.CreateDirectory(MapPath(sessionImageGallary.CategoryImagePath));

        UCpic.UploadedFiles[0].SaveAs(MapPath(sessionImageGallary.CategoryImagePath + FName), true);
        Session["ImageLink"] = FName;
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("ImageLink");
    }
    protected void GVEditor_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        if (Session["ImageLink"] != null)
        {
            e.NewValues["ImageLink"] = Session["ImageLink"];
            Session.Remove("ImageLink");
        }
    }
    protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        if (Session["ImageLink"] != null)
            e.NewValues["ImageLink"] = Session["ImageLink"];
        Session.Remove("ImageLink");
    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("ImageLink");

        ViewState["OpeningEditor"] = true;//To Load Data Into Editor
    }
 
}