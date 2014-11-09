using DevExpress.Web.ASPxEditors;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class studentallEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsfrsan.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
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

    protected void cbStudent_ValueChanged(object sender, EventArgs e)
    {

    }
    protected void callPnlStudent_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        DevExpress.Web.ASPxCallbackPanel.ASPxCallbackPanel pnl = (DevExpress.Web.ASPxCallbackPanel.ASPxCallbackPanel)sender;
        ASPxLabel saf = (ASPxLabel)pnl.Controls[1]; ASPxLabel fasl = (ASPxLabel)pnl.Controls[3];

        if (e.Parameter == null)
        {
            saf.Text = string.Empty;
            fasl.Text = string.Empty;
        }
        string studentCode = e.Parameter;
        
        System.Data.DataTable studentInfoTbl = MCfrsan.LoadDataTable(string.Format(@"SELECT student_t.alsofof_code, student_t.fasl_code FROM student_t
        WHERE student_t.stu_code = {0} AND asase_code = (SELECT MAX(asase_code) FROM student_t)", studentCode), false, MCfrsan.ConnectionStringdataschool());

        System.Data.DataTable SafFaslTbl = MCfrsan.LoadDataTable(string.Format(@"SELECT alsofof_name, (SELECT faslname FROM fasl WHERE faslcode = {1}) AS fasl
        FROM alsofof WHERE alsofof_code = {0}", studentInfoTbl.Rows[0]["alsofof_code"], studentInfoTbl.Rows[0]["fasl_code"]), false);
        saf.Text = SafFaslTbl.Rows[0]["alsofof_name"].ToString(); fasl.Text = SafFaslTbl.Rows[0]["fasl"].ToString();
        
    }
    protected void callPnlProject_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        DevExpress.Web.ASPxCallbackPanel.ASPxCallbackPanel pnl = (DevExpress.Web.ASPxCallbackPanel.ASPxCallbackPanel)sender;
        ASPxLabel project = (ASPxLabel)pnl.Controls[1];
        if (e.Parameter == null)
            project.Text = string.Empty;
        string SubjectCode = e.Parameter;
        project.Text = MCfrsan.LoadDataTable(@"SELECT tblproject.project FROM tblproject INNER JOIN tblsubject ON tblproject.projectid = tblsubject.projectid WHERE tblsubject.subjectid = " + SubjectCode, false).Rows[0][0].ToString();
    }
    protected void GVEditor_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e)
    {
        if (e.Column.FieldName == "Saf")
        {
            string StudentCode = e.GetListSourceFieldValue("stid").ToString();
            DataTable SafTbl = MCfrsan.LoadDataTable(@"SELECT alsofof_code, alsofof_name FROM alsofof", false);

            DataTable dt = MCfrsan.LoadDataTable(@"SELECT (SELECT alsofof_code FROM student_t WHERE stu_code = student.stu_code AND asase_code = (SELECT MAX(asase_code) FROM student_t)) AS alsofof_code FROM student where stu_code = " + StudentCode, false, MCfrsan.ConnectionStringdataschool());

            foreach (DataRow row in SafTbl.Rows)
            {
                if (row["alsofof_code"].ToString() == dt.Rows[0][0].ToString())
                {
                    e.Value = row["alsofof_name"].ToString();
                    break;
                }
            }

        }
    }
}