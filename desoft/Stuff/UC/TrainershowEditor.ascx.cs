using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using DevExpress.Web.ASPxGridView;

public partial class TrainershowEditor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
    protected void UCTrainepic_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = "TrainerShow" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".jpg";

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCTrainepic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCTrainepic.UploadedFiles.Length == 0)
            return;
        UCTrainepic.UploadedFiles[0].SaveAs(MapPath("../Files/" + FName), true);
        Session["Trainepic"] = FName;
    }
    protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        if (Session["Trainepic"] != null)
            e.NewValues["Trainepic"] = Session["Trainepic"];
        Session.Remove("Trainepic");
        
        if (e.NewValues["Trainepic"] != e.OldValues["Trainepic"])//Delete Old File
        {
            if (System.IO.File.Exists(MapPath("../Files/" + e.OldValues["Trainepic"])))
                System.IO.File.Delete(MapPath("../Files/" + e.OldValues["Trainepic"]));
        }
    }
    protected void GVEditor_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        if (Session["Trainepic"] != null)
        {
            e.NewValues["Trainepic"] = Session["Trainepic"];
            Session.Remove("Trainepic");
        }
        
        
    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("Trainepic");
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("Trainepic");
    }
}