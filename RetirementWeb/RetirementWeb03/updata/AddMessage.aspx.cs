using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddMessage : System.Web.UI.Page
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
    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        string FName = "attach" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".jpg";

        DevExpress.Web.ASPxUploadControl.ASPxUploadControl uploader = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (uploader.UploadedFiles.Length == 0)
            return;
        uploader.UploadedFiles[0].SaveAs(MapPath(mcupdata.FilesPath + FName), true);
        Session["updataattach"] = FName;
    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        lblResult.Text = string.Empty;
        cbtaskid.Validate();
        tbtaskdonedetails.Validate();
        if (!cbtaskid.IsValid || !tbtaskdonedetails.IsValid)
            return;
        dsupdataTableAdapters.workdoneTableAdapter adp = new dsupdataTableAdapters.workdoneTableAdapter();

        string path = Session["updataattach"] == null ? string.Empty : Session["updataattach"].ToString();
        try
        {
            int result = adp.Insert(Convert.ToInt32(sessionupdata.UserID), Convert.ToInt16(cbtaskid.Value), tbtaskdonedetails.Text, path, DateTime.Now, string.Empty, null);
            if (result > 0)
            {
                Response.Redirect("AddMessage.aspx");
            }
            
        }
        catch (Exception ex)
        {
            lblResult.Text = "خطـــاء في الادخال" + Environment.NewLine + ex.Message;
            lblResult.ForeColor = System.Drawing.Color.Red;
        }
        
    }
}