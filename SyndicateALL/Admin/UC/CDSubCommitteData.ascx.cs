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
using System.Data.SqlClient;

public partial class CDSubCommitteData : System.Web.UI.UserControl
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
   protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        SqlConnection con = new SqlConnection(SqlProvider.SqlConStr);
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            if (Session["pic"] == null)
            {
                cmd.CommandText = @"UPDATE [CDSubCommitteData] SET [saddress] = @saddress, [sphone1] = @sphone1, [sphone2] = @sphone2, 
                [smobil] = @smobil, [sfax] = @sfax, [smail] = @smail WHERE [SubCommitteId] = @SubCommitteId";
            }
            else
            {
                cmd.CommandText = @"UPDATE [CDSubCommitteData] SET [saddress] = @saddress, [sphone1] = @sphone1, [sphone2] = @sphone2, 
                [smobil] = @smobil, [sfax] = @sfax, [smail] = @smail, [slogo] = @slogo WHERE [SubCommitteId] = @SubCommitteId";
                cmd.Parameters.Add(new SqlParameter("@slogo", SqlDbType.Image) { Value = Session["pic"] });
            }
            cmd.Parameters.Add(new SqlParameter("@SubCommitteId", SqlDbType.Int) { Value = e.Keys["SubCommitteId"] });
            cmd.Parameters.Add(new SqlParameter("@saddress", SqlDbType.NVarChar) { Value = e.NewValues["saddress"] });
            cmd.Parameters.Add(new SqlParameter("@sphone1", SqlDbType.NVarChar) { Value = e.NewValues["sphone1"] });
            cmd.Parameters.Add(new SqlParameter("@sphone2", SqlDbType.NVarChar) { Value = e.NewValues["sphone2"] });
            cmd.Parameters.Add(new SqlParameter("@smobil", SqlDbType.NVarChar) { Value = e.NewValues["smobil"] });
            cmd.Parameters.Add(new SqlParameter("@sfax", SqlDbType.NVarChar) { Value = e.NewValues["sfax"] });
            cmd.Parameters.Add(new SqlParameter("@smail", SqlDbType.NVarChar) { Value = e.NewValues["smail"] });
            SqlProvider.InsertEmptyValue(ref cmd);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        con = null;
        cmd = null;
    }
    protected void GVEditor_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        SqlConnection con = new SqlConnection(SqlProvider.SqlConStr);
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = @"INSERT INTO [CDSubCommitteData] ([SubCommitteId], [saddress], [sphone1], [sphone2], [smobil], [sfax], [smail], [slogo]) 
            VALUES
            (@SubCommitteId, @saddress, @sphone1, @sphone2, @smobil, @sfax, @smail, @slogo)";
            cmd.Parameters.Add(new SqlParameter("@SubCommitteId", SqlDbType.Int) { Value = e.NewValues["SubCommitteId"] });
            cmd.Parameters.Add(new SqlParameter("@saddress", SqlDbType.NVarChar) { Value = e.NewValues["saddress"] });
            cmd.Parameters.Add(new SqlParameter("@sphone1", SqlDbType.NVarChar) { Value = e.NewValues["sphone1"] });
            cmd.Parameters.Add(new SqlParameter("@sphone2", SqlDbType.NVarChar) { Value = e.NewValues["sphone2"] });
            cmd.Parameters.Add(new SqlParameter("@smobil", SqlDbType.NVarChar) { Value = e.NewValues["smobil"] });
            cmd.Parameters.Add(new SqlParameter("@sfax", SqlDbType.NVarChar) { Value = e.NewValues["sfax"] });
            cmd.Parameters.Add(new SqlParameter("@smail", SqlDbType.NVarChar) { Value = e.NewValues["smail"] });
            if (Session["pic"] == null)
                cmd.Parameters.Add(new SqlParameter("@slogo", SqlDbType.Image) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new SqlParameter("@slogo", SqlDbType.Image) { Value = Session["pic"] });
            SqlProvider.InsertEmptyValue(ref cmd);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        con = null;
        cmd = null;

    }
    protected void GVEditor_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {
        
        SqlConnection con = new SqlConnection(SqlProvider.SqlConStr);
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = @"DELETE FROM [CDSubCommitteData] WHERE [SubCommitteId] = @SubCommitteId";
            cmd.Parameters.Add(new SqlParameter("@SubCommitteId", SqlDbType.Int) { Value = e.Keys["SubCommitteId"] });
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        con = null;
        cmd = null;
    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("pic");
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("pic");
    }
    protected void UCTrainepic_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        DevExpress.Web.ASPxUploadControl.ASPxUploadControl UCTrainepic = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (UCTrainepic.UploadedFiles.Length == 0)
            return;
        Session["pic"] = UCTrainepic.UploadedFiles[0].FileBytes;
    }

}