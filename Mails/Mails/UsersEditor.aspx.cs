using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UsersEditor : System.Web.UI.Page
{
    string imageFolder = "Assets/userimages/";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMails.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!sessionMails.IsAdmin)
            Response.Redirect("Default.aspx");
    }

    protected void CBExporter_ButtonClick(object source, DevExpress.Web.ASPxEditors.ButtonEditClickEventArgs e)
    {
        if (e.ButtonIndex == 0 && CBExporter.SelectedIndex > -1)
        {
            string ExType = CBExporter.SelectedItem.Value.ToString();
            switch (ExType)
            {
                case "Csv":
                    ASPxGridViewExporterEditor.WriteCsvToResponse();
                    break;
                case "Pdf":
                    ASPxGridViewExporterEditor.WritePdfToResponse();
                    break;
                case "Rtf":
                    ASPxGridViewExporterEditor.WriteRtfToResponse();
                    break;
                case "Xls":
                    ASPxGridViewExporterEditor.WriteXlsToResponse();
                    break;
                case "Xlsx":
                    ASPxGridViewExporterEditor.WriteXlsxToResponse();
                    break;
                default:
                    break;
            }
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
    }

    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
    }

    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //Get new ID to insert at
        e.Command.Parameters["UserID"].Value = MailCL.GetNewID("Users", "UserID");
    }
    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        DateTime dt = DateTime.UtcNow.AddHours(2);
        string FName = "pic" + dt.Year.ToString() + dt.Month.ToString() + dt.Day.ToString() + dt.Hour.ToString() + dt.Minute.ToString() + dt.Second.ToString() + ".jpg";

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl uploader = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (uploader.UploadedFiles.Length == 0)
            return;
        uploader.UploadedFiles[0].SaveAs(MapPath(imageFolder + FName), true);
        Session["imgpath"] = FName;
    }
    protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        if (Session["imgpath"] != null)
            e.NewValues["imgpath"] = imageFolder + Session["imgpath"];
        Session.Remove("imgpath");

        if (e.NewValues["imgpath"] != e.OldValues["imgpath"])//Delete Old File
        {
            if (System.IO.File.Exists(MapPath(imageFolder + e.OldValues["imgpath"])))
                System.IO.File.Delete(MapPath(imageFolder + e.OldValues["imgpath"]));
        }
    }
    protected void GVEditor_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        if (Session["imgpath"] != null)
        {
            e.NewValues["imgpath"] = Session["imgpath"];
            Session.Remove("imgpath");
        }
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("imgpath");
    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("imgpath");
    }

}
