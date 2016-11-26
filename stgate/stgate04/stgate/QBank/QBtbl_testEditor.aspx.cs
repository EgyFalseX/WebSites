using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QBtbl_testEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["QT_UserId"] == null)
            Response.Redirect("QBLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        
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
    protected void GVEditor_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
    {
        e.NewValues["asasecode"] = GetAsas();
        e.NewValues["testorder"] = GetNewOrder(e.NewValues["asasecode"].ToString(), e.NewValues["code_al_fasl"].ToString(), e.NewValues["alsofof_code"].ToString(), e.NewValues["mawad_no"].ToString());
        e.NewValues["datein"] = DateTime.Now.Date;
        e.NewValues["userin"] = Convert.ToInt32(HttpContext.Current.Session["QT_UserId"]);
        if (e.NewValues["testactive"] != null && Convert.ToBoolean(e.NewValues["testactive"]))
            e.NewValues["activedate"] = DateTime.Now.Date;
    }
    protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.NewValues["datein"] = DateTime.Now.Date;
        e.NewValues["userin"] = Convert.ToInt32(HttpContext.Current.Session["QT_UserId"]);
    }

    private string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"../data/QBank.mdb");
    private string constrAsas = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"../data/asase.mdb");
    private DataTable LoadTable(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, constr);
        try
        { da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    private DataTable LoadTableAsas(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, constrAsas);
        try
        { da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    public string GetAsas()
    {
        return LoadTableAsas(@"SELECT MAX(asase_code) AS NewID FROM asase").Rows[0][0].ToString();
    }
    public string GetNewOrder(string asasecode, string code_al_fasl, string alsofof_code, string mawad_no)
    {
        return LoadTable(string.Format("SELECT IIF(IsNull(MAX(testorder)), 1, MAX(testorder) + 1) AS testorder FROM tbl_test WHERE asasecode = {0} AND code_al_fasl = {1} AND alsofof_code = {2} AND mawad_no = {3}"
            , asasecode, code_al_fasl, alsofof_code, mawad_no)).Rows[0][0].ToString();
    }

    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        int x = e.Command.Parameters.Count;
    }
}