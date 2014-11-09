using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DevExpress.Web.ASPxGridView;

public partial class fathermassegeEditor : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionRetirementWeb.DatabaseName);
        if (!TheSessionsstudentfollow.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
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
    protected void GVEditor_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {

    }

    protected void GVEditor_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCommandButtonEventArgs e)
    {
        if (e.VisibleIndex == -1) return;
        if (e.ButtonType == DevExpress.Web.ASPxGridView.ColumnCommandButtonType.Edit)
        {
            object reply_code = (GVEditor).GetRowValues(e.VisibleIndex, "reply_code");
            if (reply_code == null)
                e.Visible = false;
            else
                e.Visible = !(bool)reply_code;
        }
        
    }
}