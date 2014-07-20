using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tbladvViewer : System.Web.UI.Page
{
    dsAdvetsTableAdapters.tbladvTableAdapter adp = new dsAdvetsTableAdapters.tbladvTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.IsAuthadvets)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!IsPostBack)
        {
            if (TheSessions.IsAdminadvets)
            {
                tbadminrem.ReadOnly = false;
                cbadminlike.ReadOnly = false;
                btnSave.Visible = true;
            }
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
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (TheSessions.IsAdminadvets)
        {
            e.Command.CommandText = @"SELECT tbladv.Id, tbladv.advdate, tbladv.SyndicateId, tbladv.IdTypeId, tbladv.placce, 
            tbladv.remmarks, tbladv.[number], tbladv.egabeat, tbladv.salbeat, tbladv.sugeest, tbladv.resmobile, tbladv.datein, 
            tbladv.userin, CDSyndicate.Syndicate, CDIdType.IdType, Users.Uname, tbladv.adminlike, tbladv.adminrem, tbladv.attachpath 
            FROM (((tbladv INNER JOIN CDIdType ON tbladv.IdTypeId = CDIdType.IdTypeId) INNER JOIN CDSyndicate ON tbladv.SyndicateId = CDSyndicate.SyndicateId) 
            LEFT OUTER JOIN Users ON tbladv.userin = Users.UserID)";
        }
        else
        {
            e.Command.CommandText = @"SELECT tbladv.Id, tbladv.advdate, tbladv.SyndicateId, tbladv.IdTypeId, tbladv.placce, 
            tbladv.remmarks, tbladv.[number], tbladv.egabeat, tbladv.salbeat, tbladv.sugeest, tbladv.resmobile, tbladv.datein, 
            tbladv.userin, CDSyndicate.Syndicate, CDIdType.IdType, Users.Uname, tbladv.adminlike, tbladv.adminrem, tbladv.attachpath 
            FROM (((tbladv INNER JOIN CDIdType ON tbladv.IdTypeId = CDIdType.IdTypeId) INNER JOIN CDSyndicate ON tbladv.SyndicateId = CDSyndicate.SyndicateId) 
            LEFT OUTER JOIN Users ON tbladv.userin = Users.UserID)
            WHERE tbladv.userin = " + TheSessions.UserIDadvets;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        adp.UpdateQueryAdminFields(cbadminlike.Checked, tbadminrem.Text, DateTime.Now, Convert.ToInt32(HFId.Get("Id")));
        Response.Redirect(Request.RawUrl);
    }

}
