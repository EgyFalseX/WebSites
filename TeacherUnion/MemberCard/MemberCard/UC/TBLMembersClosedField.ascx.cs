using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class TBLMembersClosedField : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMemberCard.IsAdmin)
            Response.Redirect("~/");
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
        if (sessionMemberCard.IsAdmin)
        {
            e.Command.CommandText = @"SELECT [MemberId], [MemberName], [closed],
            (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = TBLAllMember.SyndicateId) AS Syndicate,
            (SELECT SubCommitte FROM CDSubCommitte WHERE SubCommitteId = TBLAllMember.SubCommitteId) AS SubCommitte
             FROM [TBLAllMember]";
        }
        else
        {
            if (sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubType)
            {
                e.Command.CommandText = @"SELECT [MemberId], [MemberName], [closed],
            (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = TBLAllMember.SyndicateId) AS Syndicate,
            (SELECT SubCommitte FROM CDSubCommitte WHERE SubCommitteId = TBLAllMember.SubCommitteId) AS SubCommitte
             FROM [TBLAllMember] WHERE closed = False AND userin = " + sessionMemberCard.UserID;

            }
            else if(sessionMemberCard.usersub == sessionMemberCard.UserSubType.SubSyn)
            {
                e.Command.CommandText = @"SELECT [MemberId], [MemberName], [closed],
            (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = TBLAllMember.SyndicateId) AS Syndicate,
            (SELECT SubCommitte FROM CDSubCommitte WHERE SubCommitteId = TBLAllMember.SubCommitteId) AS SubCommitte
             FROM [TBLAllMember] WHERE closed = False AND SyndicateId = " + sessionMemberCard.SyndicateId;
            }
           
        }
    }

}