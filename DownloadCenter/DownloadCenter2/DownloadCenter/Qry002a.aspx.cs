using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;

public partial class Qry002a : System.Web.UI.Page
{
    const string imageFolder = "Assets/DownloadCenterImages/";

    protected void Page_Load(object sender, EventArgs e)
    {
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionRetirementWeb.DatabaseName);
        if (!TheSessionsDownloadCenter.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
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
        //SELECT studentcode FROM download WHERE (id_prog = ?)
        string dbpath = MCDownloadCenter.LoginDatabasePath.Substring(0, MCDownloadCenter.LoginDatabasePath.Length - 4);
        e.Command.CommandText = string.Format(@"SELECT studentcode, downdate,
        (SELECT stu_name FROM {0}.student WHERE stu_code = download.studentcode) AS stu_name,
        (SELECT alsofof_name FROM alsofof WHERE alsofof_code = (SELECT alsofof_code FROM {0}.student_t WHERE stu_code = download.studentcode AND asase_code = (SELECT MAX(asase_code) FROM {0}.student_t))) AS alsofof_name,
        (SELECT faslname FROM fasl WHERE faslcode = (SELECT fasl_code FROM {0}.student_t WHERE stu_code = download.studentcode AND asase_code = (SELECT MAX(asase_code) FROM {0}.student_t))) AS name_al_fasl
        FROM download WHERE (id_prog = {1})", dbpath, Request.QueryString["id"]);
    }

    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = "attach" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".jpg";

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl uploader = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (uploader.UploadedFiles.Length == 0)
            return;
        uploader.UploadedFiles[0].SaveAs(MapPath(imageFolder + FName), true);
        Session["attach"] = FName;
    }
    protected void GVEditor_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {

    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("attach");
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("attach");
    }
    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (Session["attach"] != null)
        {
            e.Command.Parameters["link"].Value = Session["attach"].ToString();
        }
    }
    protected void DSData_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (Session["attach"] != null)
        {
            e.Command.Parameters["link"].Value = Session["attach"].ToString();
        }
    }
    protected void btndownload_Click(object sender, EventArgs e)
    {
        ASPxButton btn = (ASPxButton)sender;
        MCDownloadCenter.InsetDownloadRequest(Convert.ToInt32(btn.CommandArgument));
    }
}