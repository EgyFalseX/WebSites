using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class AmanatViewerw : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionRetirementWeb.DatabaseName);
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
        if (sessionRetirementWeb.SubCommitteId != null)
        {
            e.Command.CommandText = string.Format(@"SELECT amanatw.memberid, amanatw.dofaa, amanatw.senddate, amanatw.amanatdate, amanatw.amanatmony, amanatw.memname, amanatw.amanatrdate, amanatw.SubCommitteId, cdSubCommitte.SubCommitte FROM (amanatw INNER JOIN cdSubCommitte ON amanatw.SubCommitteId = cdSubCommitte.SubCommitteId) 
WHERE (amanatw.SyndicateId = {0}) AND (amanatw.SubCommitteId = {1})", sessionRetirementWeb.SyndicateId, sessionRetirementWeb.SubCommitteId);
        }
        else
        {
            e.Command.CommandText = string.Format(@"SELECT amanatw.memberid, amanatw.dofaa, amanatw.senddate, amanatw.amanatdate, amanatw.amanatmony, amanatw.memname, amanatw.amanatrdate, amanatw.SubCommitteId, cdSubCommitte.SubCommitte FROM (amanatw INNER JOIN cdSubCommitte ON amanatw.SubCommitteId = cdSubCommitte.SubCommitteId) 
WHERE (amanatw.SyndicateId = {0})", sessionRetirementWeb.SyndicateId);
        }
    }

    protected void GVEditor_DataBinding(object sender, EventArgs e)
    {

    }
}