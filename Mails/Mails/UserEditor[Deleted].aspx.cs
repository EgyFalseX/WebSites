using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserEditor : System.Web.UI.Page
{
    const string imageFolder = "Assets/userimages/";
   
    protected void Page_Load(object sender, EventArgs e)
    {
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionRetirementWeb.DatabaseName);
        Response.Redirect("~/");

        if (!sessionMails.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
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

    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = "attach" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".jpg";

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl uploader = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (uploader.UploadedFiles.Length == 0)
            return;
        uploader.UploadedFiles[0].SaveAs(MapPath(imageFolder + FName), true);
        Session["attach"] = FName;
    }
    protected void GVEditor_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {

    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("attach");
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("attach");
    }
    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (Session["attach"] != null)
        {
            e.Command.Parameters["imgpath"].Value = Session["attach"].ToString();
            e.Command.Parameters["UserID"].Value = new dsMailsTableAdapters.QueriesTableAdapter().UsersNewID();
        }
    }
    protected void DSData_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (Session["attach"] != null)
        {
            e.Command.Parameters["imgpath"].Value = Session["attach"].ToString();
        }
    }

}