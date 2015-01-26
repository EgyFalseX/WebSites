using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SubjectViewer : System.Web.UI.Page
{
    const string imageFolder = "schoolPhoto/";
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (HttpContext.Current.Session["UserIDgallary"] == null)
        //    Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
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
    
    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (Session["attach"] != null)
        {
            e.Command.Parameters["primg"].Value = Session["attach"].ToString();
        }
    }
    protected void DSData_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (Session["attach"] != null)
        {
            e.Command.Parameters["primg"].Value = Session["attach"].ToString();
        }
    }
}