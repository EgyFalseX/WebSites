using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using DevExpress.Web.ASPxGridView;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class MenuItem : System.Web.UI.UserControl
{
    string FilesPath = "../Files/doc/";
    private string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/events.mdb");
    private DataTable LoadTable(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, constr);
        try
        { da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            ViewState["OpeningEditor"] = false;
    }
    public string GetNewID()
    {
        return LoadTable(@"SELECT IIF(IsNull(MAX(ItemID)), 1, MAX(ItemID) + 1) AS NewID FROM MenuItem").Rows[0][0].ToString();
    }
    private void SaveToFile(string FilePath, object Data)
    {
        File.Create(FilePath).Close();
        TextWriter TW = new StreamWriter(FilePath, false);
        TW.Write(Data);
        TW.Flush();
        TW.Close();
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
        if (System.IO.File.Exists(MapPath("../Files/img/" + e.Values["ItemPic"])))//Delete Pic
            System.IO.File.Delete(MapPath("../Files/img/" + e.Values["ItemPic"]));

        if (System.IO.File.Exists(MapPath(FilesPath + e.Values["ItemID"])))//Delete Data File
            System.IO.File.Delete(MapPath(FilesPath + e.Values["ItemID"]));
    }
    protected void UCpic_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        UCpic.UploadedFiles[0].SaveAs(MapPath("../Files/img/" + FName), true);
        Session["ItemPic"] = FName;
    }
    protected void UCFile_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = String.Format("PIC{0}{1}{2}{3}{4}{5}.jpg", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCpic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCpic.UploadedFiles.Length == 0)
            return;
        UCpic.UploadedFiles[0].SaveAs(MapPath("../Files/img/" + FName), true);
        e.CallbackData = "Files/img/" + FName;
    }
    protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        if (Session["ItemPic"] != null)
            e.NewValues["ItemPic"] = Session["ItemPic"];
        Session.Remove("ItemPic");

        if (e.NewValues["ItemPic"] != e.OldValues["ItemPic"])//Delete Old File
        {
            if (System.IO.File.Exists(MapPath("../Files/img/" + e.OldValues["ItemPic"])))
                System.IO.File.Delete(MapPath("../Files/img/" + e.OldValues["ItemPic"]));
        }

        SaveToFile(MapPath(FilesPath + e.NewValues["ItemID"]), e.NewValues["Data_Path"]);
        e.NewValues["Data_Path"] = DBNull.Value;
    }
    protected void GVEditor_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        if (Session["ItemPic"] != null)
        {
            e.NewValues["ItemPic"] = Session["ItemPic"];
            Session.Remove("ItemPic");
        }
        e.NewValues["ItemID"] = GetNewID();
        SaveToFile(MapPath(FilesPath + e.NewValues["ItemID"]), e.NewValues["Data_Path"]);
        e.NewValues["Data_Path"] = DBNull.Value;
    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("ItemPic");

        ViewState["OpeningEditor"] = true;//To Load Data Into Editor
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("ItemPic");
    }
    protected void CKEditor1_DataBinding(object sender, EventArgs e)
    {
        if ((bool)ViewState["OpeningEditor"] == false)//To Load Data Into Editor
            return;
        ViewState["OpeningEditor"] = false;

        try
        {
            CKEditor.NET.CKEditorControl MyEditor = (CKEditor.NET.CKEditorControl)sender;

            DataRowView row = (DataRowView)GVEditor.GetRow(GVEditor.FocusedRowIndex);
            if (eventsCodes.IsNullOrEmpty(row["ItemID"]))
                return;

            string FilePath = MapPath(FilesPath + row["ItemID"]);

            if (File.Exists(FilePath))
            {
                TextReader TR = new StreamReader(FilePath);
                string tt = TR.ReadToEnd().ToString();
                TR.Close();
                TR.Dispose();
                MyEditor.Text = tt;
            }
        }
        catch
        { }
    }
    
}