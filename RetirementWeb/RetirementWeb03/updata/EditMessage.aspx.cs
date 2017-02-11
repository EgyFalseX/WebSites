using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditMessage : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionupdata.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!IsPostBack)
        {
            Session["updataattach"] = null;
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
//        if (sessionRetirementWeb.SubCommitteId != null)
//        {
//            e.Command.CommandText = string.Format(@"SELECT esid, [estefaid], [memberid], [estefadate], [membername], [syndicateid], [subcommeteid], [remarkestefa], [sreplay], [closed], [sdatein], [sarfno] FROM [tblestefaa] 
//WHERE ([syndicateid] = {0})  AND (subcommeteid = {1})", sessionRetirementWeb.SyndicateId, sessionRetirementWeb.SubCommitteId);
//        }
//        else
//        {
//            e.Command.CommandText = string.Format(@"SELECT esid, [estefaid], [memberid], [estefadate], [membername], [syndicateid], [subcommeteid], [remarkestefa], [sreplay], [closed], [sdatein], [sarfno] FROM [tblestefaa]
//WHERE ([syndicateid] = {0})", sessionRetirementWeb.SyndicateId);
//        }
    }
    protected void GVEditor_DataBinding(object sender, EventArgs e)
    {

    }

    protected void GVEditor_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCommandButtonEventArgs e)
    {
        DataRow row = ((DataRowView)GVEditor.GetRow(e.VisibleIndex)).Row;
        if (row == null) return;
        if (row["admindate"] == null || row["admindate"].ToString() == string.Empty)
            e.Visible = true;
        else
            e.Visible = false;
    }
}