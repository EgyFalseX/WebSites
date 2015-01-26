using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class tbladdformdetailsEditor_Remove : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionRetirementWeb.DatabaseName);
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                DataTable dt = MCTEFollowUp.LoadDataTable("SELECT ystfad, tawseat FROM tbladdform WHERE formid = " + Request.QueryString["id"], false);
                if (dt.Rows.Count > 0)
                {
                    tbystfad.Text = dt.Rows[0]["ystfad"].ToString();
                    tbtawseat.Text = dt.Rows[0]["tawseat"].ToString();
                }
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
    protected void GVEditor_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {

    }
    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["yearid"].Value = MCTEFollowUp.GetNewID("cdyear", "yearid");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        OleDbConnection con = MCTEFollowUp.Connection;
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = @"Update tbladdform SET ystfad = @ystfad, tawseat = @tawseat WHERE formid = @formid";
            OleDbParameter Pramystfad = new OleDbParameter("@ystfad", tbystfad.Value); cmd.Parameters.Add(Pramystfad);
            OleDbParameter Pramtawseat = new OleDbParameter("@tawseat", tbtawseat.Value); cmd.Parameters.Add(Pramtawseat);
            OleDbParameter Pramformid = new OleDbParameter("@formid", Request.QueryString["id"]); cmd.Parameters.Add(Pramformid);
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            throw ex;
        }
        con.Close();
    }
}