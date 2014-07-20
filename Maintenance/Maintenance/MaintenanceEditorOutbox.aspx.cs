using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintenanceEditorOutbox : System.Web.UI.Page
{

    dsMaintenanceTableAdapters.QueriesTableAdapter adpQry = new dsMaintenanceTableAdapters.QueriesTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMaintenance.MaintenanceIsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        //if (!sessionMaintenance.MaintenanceIsAdmin)
        //    Response.Redirect("AccessDenied.aspx");

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
    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["deptId"].Value = adpQry.CDdeptNewId();
    }

    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {

    }
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
//        if (sessionMaintenance.MaintenanceIsAdmin)
//        {
//            e.Command.CommandText = @"SELECT Maintenance.MaintenanceId, Maintenance.MaintenanceDate, Maintenance.maddres, Maintenance.mclosed, Users.realname, Maintenance.read_code FROM 
//            (Maintenance LEFT OUTER JOIN Users ON Maintenance.UserID = Users.UserID)";
//        }
    }
}