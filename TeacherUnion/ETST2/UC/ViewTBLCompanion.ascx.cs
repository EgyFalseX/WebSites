using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class ViewTBLCompanion : System.Web.UI.UserControl
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


    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (TheSessions.IsAdmin)
        {
            e.Command.CommandText = @"SELECT [CompanionId], [CompanionName], [MemberId], (SELECT MemberName FROM TBLMembers WHERE MemberId = TBLCompanion.MemberId) AS MemberName,
            CompanionImage, (SELECT CompanionType FROM CDCompanionType WHERE CompanionTypeId = TBLCompanion.CompanionTypeId) AS CompanionType, cardr, 
            (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = (SELECT MemberSyndicateId FROM TBLMembers WHERE MemberId = TBLCompanion.MemberId)) AS SyndicateMem, 
            (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = (SELECT SyndicateId FROM TBLMembers WHERE MemberId = TBLCompanion.MemberId)) AS Syndicate 
            FROM [TBLCompanion]";
        }
        else
        {
            e.Command.CommandText = @"SELECT [CompanionId], [CompanionName], [MemberId], (SELECT MemberName FROM TBLMembers WHERE MemberId = TBLCompanion.MemberId) AS MemberName,
            CompanionImage, (SELECT CompanionType FROM CDCompanionType WHERE CompanionTypeId = TBLCompanion.CompanionTypeId) AS CompanionType, cardr, 
            (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = (SELECT MemberSyndicateId FROM TBLMembers WHERE MemberId = TBLCompanion.MemberId)) AS SyndicateMem, 
            (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = (SELECT SyndicateId FROM TBLMembers WHERE MemberId = TBLCompanion.MemberId)) AS Syndicate 
            FROM [TBLCompanion] WHERE EXISTS (SELECT SyndicateId FROM TBLMembers WHERE userin = ? AND MemberId = TBLMembers.MemberId)";
        }
    }
}