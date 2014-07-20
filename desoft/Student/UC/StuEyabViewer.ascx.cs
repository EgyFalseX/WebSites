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

public partial class StuEyabViewer : System.Web.UI.UserControl
{
    #region -   Functions   -
    private DataTable LoadTabledataschool(string commandtext)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/dataschool.mdb");
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandtext, constr);
        da.Fill(dt);

        return dt;
    }
    private void LoadData()
    {
        DataTable dt = LoadTabledataschool(@"SELECT stu_code, asase_code, [date],
        (Select stu_name From student Where stu_code = stu_eyab.stu_code) AS stu_name,
        (Select alsofof_code From student_t Where stu_code = stu_eyab.stu_code And asase_code = stu_eyab.asase_code) AS alsofof_code,
        (Select fasl_code From student_t Where stu_code = stu_eyab.stu_code And asase_code = stu_eyab.asase_code) AS fasl_code
        FROM stu_eyab Where asase_code = (SELECT MAX(asase_code) AS Expr1 FROM stu_eyab stu_eyab_1)");
        ViewState["data"] = dt;
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
    #endregion
    //protected void GVEditor_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    //{
    //    if (e.Column.FieldName == "saf")
    //    {
    //        DataTable saf = LoadTablsaf();
    //        foreach (DataRow row in saf.Rows)
    //        {
    //            if (row["alsofof_code"].ToString() == e.GetListSourceFieldValue("alsofof_code").ToString())
    //            {
    //                e.Value = row["alsofof_name"];
    //                break;
    //            }
    //        }
    //    }
    //    else if (e.Column.FieldName == "fasl")
    //    {
    //        DataTable fasl = LoadTablfasl();
    //        foreach (DataRow row in fasl.Rows)
    //        {
    //            if (row["fasl_code"].ToString() == e.GetListSourceFieldValue("fasl_code").ToString())
    //            {
    //                e.Value = row["fasl_name"];
    //                break;
    //            }
    //        }
    //    }
    //}
}