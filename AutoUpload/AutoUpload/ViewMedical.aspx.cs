using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewMedical : System.Web.UI.Page
{
    dsMedical ds = new dsMedical();
    dsMedicalTableAdapters.ViewMedicalTableAdapter adp = new dsMedicalTableAdapters.ViewMedicalTableAdapter();

    dsETSTTableAdapters.TBLMembersTableAdapter adpMem = new dsETSTTableAdapters.TBLMembersTableAdapter();
    dsETSTTableAdapters.TBLCompanionTableAdapter adpComp = new dsETSTTableAdapters.TBLCompanionTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.IsAuth)
            Response.Redirect("~/Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!IsPostBack)
        {
            if (TheSessions.IsAdmin)
                adp.Fill(ds.ViewMedical);
            else
                adp.FillByuserin(ds.ViewMedical, Convert.ToInt32(TheSessions.UserID));

            foreach (dsMedical.ViewMedicalRow row in ds.ViewMedical)
            {
                if (row.typemember == 1)
                {
                    row.MemberName = adpMem.GetMemberName(row.memberid);
                }
                else if (row.typemember == 2)
                {
                    row.MemberName = adpComp.GetCompanionName(row.memberid);
                }
            }
            GVEditor.DataSource = ds.ViewMedical;
            GVEditor.DataBind();
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
    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (TheSessions.IsAdmin)
        {
            e.Command.CommandText = @"SELECT tblmedical.id, tblmedical.typemember, tblmedical.memberid, tblmedical.datetahweel, tblmedical.IDnetwork, tblmedical.rem, tblmedical.userin,
            tblmedical.datein, NETWORK.NAME FROM (tblmedical LEFT OUTER JOIN NETWORK ON tblmedical.id = NETWORK.ID)";
        }
        else
        {
            e.Command.CommandText = @"SELECT tblmedical.id, tblmedical.typemember, tblmedical.memberid, tblmedical.datetahweel, tblmedical.IDnetwork, tblmedical.rem, tblmedical.userin, 
            tblmedical.datein, NETWORK.NAME FROM (tblmedical LEFT OUTER JOIN NETWORK ON tblmedical.id = NETWORK.ID)
            WHERE tblmedical.userin = " + TheSessions.UserID;
        }
    }

}