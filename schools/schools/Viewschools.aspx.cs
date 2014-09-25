﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Viewschools : System.Web.UI.Page
{
    dsSchoolsTableAdapters.QueriesTableAdapter adpQry = new dsSchoolsTableAdapters.QueriesTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessions.schoolsIsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        //if (!TheSessions.schoolsIsAdmin)
        //    Response.Redirect("AccessDenied.aspx");

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

    protected void DSData_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (TheSessions.schoolsIsAdmin)
        {
            e.Command.CommandText = @"SELECT schools.schoolId, schools.govid, schools.hayid, schools.schoolname, schools.schooltypeid, schools.address, schools.schooltel, 
            schools.fax, schools.site, schools.mail, schools.imgepath, schools.showsite, cdhay.hay, cdgov.gov, CdSchoolType.schooltype 
            FROM (((schools LEFT OUTER JOIN cdhay ON schools.hayid = cdhay.hayid) LEFT OUTER JOIN CdSchoolType ON schools.schooltypeid = CdSchoolType.schooltypeid) LEFT OUTER JOIN cdgov ON schools.govid = cdgov.govid)";
        }
        else
        {
            e.Command.CommandText = @"SELECT schools.schoolId, schools.govid, schools.hayid, schools.schoolname, schools.schooltypeid, schools.address, schools.schooltel, schools.fax, schools.site, 
            schools.mail, schools.imgepath, schools.showsite, cdhay.hay, cdgov.gov, CdSchoolType.schooltype
            FROM (((schools LEFT OUTER JOIN
            cdhay ON schools.hayid = cdhay.hayid) LEFT OUTER JOIN
            CdSchoolType ON schools.schooltypeid = CdSchoolType.schooltypeid) LEFT OUTER JOIN
            cdgov ON schools.govid = cdgov.govid)
            WHERE (schools.showsite = true)";
        }
    }

}