using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    const string imageFolder = "Assets/userimages/";
    dsMails ds = new dsMails();
    dsMailsTableAdapters.UsersTableAdapter adpUser = new dsMailsTableAdapters.UsersTableAdapter();
    dsMailsTableAdapters.QueriesTableAdapter adpQry = new dsMailsTableAdapters.QueriesTableAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e)
    {
        DevExpress.Web.ASPxUploadControl.ASPxUploadControl uploader = (DevExpress.Web.ASPxUploadControl.ASPxUploadControl)sender;
        if (uploader.UploadedFiles.Length == 0)
            return;
        DateTime dt = DateTime.UtcNow.AddHours(2);
        string FName = "attach" + dt.Year.ToString() + dt.Month.ToString() + dt.Day.ToString() +
            dt.Hour.ToString() + dt.Minute.ToString() + dt.Second.ToString() + uploader.UploadedFiles[0].FileName;

        uploader.UploadedFiles[0].SaveAs(MapPath(imageFolder + FName), true);
        Session["imgpath"] = FName;

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        dsMails.UsersRow row = ds.Users.NewUsersRow();
        row.UserID = (int)adpQry.UsersNewID();
        if (tbUserName.Text != string.Empty)
            row.UserName = tbUserName.Text;
        if (tbPassword.Text != string.Empty)
            row.Password = tbPassword.Text;
        if (tbrealname.Text != string.Empty)
            row.realname = tbrealname.Text;
        if (cbtitleId.Value != null && cbtitleId.Value.ToString() != string.Empty)
            row.titleId = Convert.ToByte(cbtitleId.Value);
        if (cbudeptId.Value != null && cbudeptId.Value.ToString() != string.Empty)
            row.udeptId = Convert.ToByte(cbudeptId.Value);
        if (tbmobil.Text != string.Empty)
            row.mobil = tbmobil.Text;
        if (tbumail.Text != string.Empty)
            row.umail = tbumail.Text;
        if (tbsignture.Text != string.Empty)
            row.signture = tbsignture.Text;
        if (Session["imgpath"] != null && Session["imgpath"].ToString() != string.Empty)
            row.imgpath = Session["imgpath"].ToString();

        ds.Users.AddUsersRow(row);
        row.EndEdit();
        adpUser.Update(row);
        Session.Remove("imgpath");
        ASPxPopupControlEditor.JSProperties["cpShowPopup"] = "nohting";

    }
    protected void btnCloseMsg_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Mails/Mails");
    }

}