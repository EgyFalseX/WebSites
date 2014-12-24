using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class centerEditor : System.Web.UI.Page
{
    const string imageFolder = "uc/files/";

    protected void Page_Load(object sender, EventArgs e)
    {
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionRetirementWeb.DatabaseName);

        if (HttpContext.Current.Session["UserIDhonor"] == null)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }

    protected void CBExporter_ButtonClick(object source, DevExpress.Web.ASPxEditors.ButtonEditClickEventArgs e)
    {
        
       
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
        DevExpress.Web.ASPxUploadControl.ASPxUploadControl uploader = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        string FName = "attach" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + uploader.UploadedFiles[0].FileName;
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
            e.Command.Parameters["ItemPic"].Value = Session["attach"].ToString();
        }
    }
    protected void DSData_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (Session["attach"] != null)
        {
            e.Command.Parameters["ItemPic"].Value = Session["attach"].ToString();
        }
    }

    protected void GVEditor_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
    {
        if (e.DataColumn.FieldName == "name_prog")
        {
            string text = e.CellValue == null ? string.Empty : e.CellValue.ToString();
            if (!string.IsNullOrEmpty(text) && text.Length > 40)
            {
                e.Cell.Text = text.Substring(0, 40) + "...";
                e.Cell.ToolTip = e.CellValue.ToString();
            }
        }
    }
}