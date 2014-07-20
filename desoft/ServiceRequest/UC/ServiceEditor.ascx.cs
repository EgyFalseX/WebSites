using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.OleDb;

public partial class ServiceEditor : System.Web.UI.UserControl
{
    #region -   Functions   -
    static string ConnectionStr(string DataBaseName)
    {
        return "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data\" + DataBaseName);
    }
    #endregion
    #region -   Event Handlers   -
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
            GVEditor.JSProperties["cpShowPopup"] = "تم الاضـــــافه ...";
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
    #endregion
    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        string NewID = string.Empty;
        OleDbDataAdapter da = new OleDbDataAdapter(@"Select Max(servisetypeid) From servisetype", ConnectionStr("faservice.mdb"));
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count == 0)
            NewID = "1";
        else
            NewID = (Convert.ToInt16(dt.Rows[0][0].ToString()) + 1).ToString();

        e.Command.Parameters["servisetypeid"].Value = NewID;
    }
}