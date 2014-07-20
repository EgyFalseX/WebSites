using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class CompanionCardEditor : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (TheSessions.IsAdmin)
        {
            e.Command.CommandText = @"SELECT TBLCompanion.CompanionId, TBLCompanion.CompanionName, TBLCompanion.cardr, TBLCompanion.dater, CDSyndicate.Syndicate AS SyndicateMem, 
            CDSyndicate_1.Syndicate FROM (((CDSyndicate CDSyndicate_1 RIGHT OUTER JOIN TBLMembers ON CDSyndicate_1.SyndicateId = TBLMembers.SyndicateId) LEFT OUTER JOIN 
            CDSyndicate ON TBLMembers.MemberSyndicateId = CDSyndicate.SyndicateId) RIGHT OUTER JOIN TBLCompanion ON TBLMembers.MemberId = TBLCompanion.MemberId) 
            ORDER BY TBLCompanion.datein";
        }
        else
        {
            e.Command.CommandText = string.Format(@"SELECT TBLCompanion.CompanionId, TBLCompanion.CompanionName, TBLCompanion.cardr, TBLCompanion.dater, CDSyndicate.Syndicate AS SyndicateMem, 
            CDSyndicate_1.Syndicate FROM (((CDSyndicate CDSyndicate_1 RIGHT OUTER JOIN TBLMembers ON CDSyndicate_1.SyndicateId = TBLMembers.SyndicateId) LEFT OUTER JOIN 
            CDSyndicate ON TBLMembers.MemberSyndicateId = CDSyndicate.SyndicateId) RIGHT OUTER JOIN TBLCompanion ON TBLMembers.MemberId = TBLCompanion.MemberId) 
            WHERE TBLMembers.SyndicateId = {0} 
            ORDER BY TBLCompanion.datein", TheSessions.SyndicateId);
        }
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

}