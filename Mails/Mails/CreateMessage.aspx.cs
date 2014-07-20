using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Collections.ObjectModel;

public partial class CreateMessage : System.Web.UI.Page
{
    const string imageFolder = "Assets/msgattach/";
    const string SuccessText = "تــم ارســال الرســـالة";
    
    private SmtpClient MailConfig()
    {
        dsMails.mailinfoDataTable tbl = new dsMailsTableAdapters.mailinfoTableAdapter().GetData();
        SmtpClient client = null;
        if (tbl.Rows.Count == 0)
            return client;
        client = new SmtpClient();
        dsMails.mailinfoRow mail = tbl[0];

        client.Host = mail.mailserver;
        client.Port = mail.port;
        client.Credentials = new NetworkCredential(mail.username, mail.pass);
        client.EnableSsl = mail.enableSsl;

        return client;
    }
    
    private void SendMail(List<string> To, string MailContains)
    {
        try
        {
            SmtpClient client = MailConfig();
            if (client == null)
                return;

            MailMessage message = new MailMessage();
            message.From = new MailAddress(((NetworkCredential)client.Credentials).UserName);
            foreach (string item in To)
                message.To.Add(new MailAddress(item));
            
            message.Subject = "noreply";
            message.Body = MailContains;
            message.IsBodyHtml = true;

            client.Send(message);
        }
        catch { }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMails.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        Session.Remove("msgattach");

        if (IsPostBack)
        {
            Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");
            //Page.ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.onunload = CloseWindow();");
        }
        
        //editor = new DevExpress.Web.ASPxHtmlEditor.ASPxHtmlEditor

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        
        int msgid = Convert.ToInt32(MailCL.GetNewID("contactdata", "msgid"));
        string attachfilename = string.Empty;
        if (Session["msgattach"] != null)
            attachfilename = Session["msgattach"].ToString();
        string title = string.Empty;
        if (tbTitle.Value != null)
            title = tbTitle.Value.ToString();

        dsMails ds = new dsMails();
        dsMailsTableAdapters.contactdataTableAdapter adpMSG = new dsMailsTableAdapters.contactdataTableAdapter();
        dsMailsTableAdapters.UsersInRolesTableAdapter adpUserRole = new dsMailsTableAdapters.UsersInRolesTableAdapter();
        dsMailsTableAdapters.msgtoTableAdapter adpMsgTo = new dsMailsTableAdapters.msgtoTableAdapter();
        dsMailsTableAdapters.UsersTableAdapter adpUser = new dsMailsTableAdapters.UsersTableAdapter();
        //Convert.ToByte(cbCDMsgType.Value)
        adpMSG.Insert(msgid, null, Convert.ToInt32(sessionMails.UserID), DateTime.UtcNow.AddHours(2), title, attachfilename, editor.Html, false);

        Session.Remove("msgattach");
        List<string> MailTo = new List<string>();
        foreach (DevExpress.Web.ASPxEditors.ListEditItem item in cblUsers.SelectedItems)
        {
            dsMails.msgtoRow row = ds.msgto.NewmsgtoRow();
            row.msgid = msgid;
            row.userto = Convert.ToInt32(item.Value);
            ds.msgto.AddmsgtoRow(row);
            string mail = adpUser.ScalarGetUserMail(row.userto);
            if (mail != string.Empty)
                MailTo.Add(mail);
        }
        foreach (DevExpress.Web.ASPxEditors.ListEditItem item in cblRoles.SelectedItems)
        {
            dsMails.UsersInRolesDataTable tbl = adpUserRole.GetDataByRoleId(Convert.ToByte(item.Value));
            foreach (dsMails.UsersInRolesRow tblItem in tbl.Rows)
            {
                if (ds.msgto.FindBymsgiduserto(msgid, tblItem.UserId) == null)
                {
                    dsMails.msgtoRow row = ds.msgto.NewmsgtoRow();
                    row.msgid = msgid;
                    row.userto = tblItem.UserId;
                    ds.msgto.AddmsgtoRow(row);

                    string mail = adpUser.ScalarGetUserMail(tblItem.UserId);
                    if (mail != string.Empty)
                        MailTo.Add(mail);
                }
            }
        }
        adpMsgTo.Update(ds.msgto);
        SendMail(MailTo, editor.Html);

        HtmlForm form = Page.FindControl("formmsg") as HtmlForm;
        if (form != null)
        {
            form.Controls.Clear();
            WebControl textControl = CreateCentredText(SuccessText);
            textControl.ForeColor = System.Drawing.Color.FromArgb(0, 51, 51);
            if (textControl != null)
                form.Controls.Add(textControl);
            
        }

    }
    protected virtual WebControl CreateCentredText(string TextAlign)
    {
        Table table = new Table();
        TableRow row = new TableRow();
        TableCell cell = new TableCell();
        TableRow row2 = new TableRow();
        TableCell cell2 = new TableCell();
        Label lbl = new Label();
        Button btn = new Button();
        btn.Text = "اغلاق";
        btn.Click += (o, e) => { 
            //Response.Redirect("CreateMessage.aspx"); 
            //Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");
            //Page.ClientScript.RegisterStartupScript(typeof(Page), "closePage", "window.onunload = CloseWindow();");
            //ClientScript.RegisterStartupScript(typeof(Page), "closePage", "<script type='text/JavaScript'>window.close();</script>");
        };

        lbl.Text = TextAlign;

        table.Rows.Add(row);
        table.Rows.Add(row2);

        row.Cells.Add(cell);
        row2.Cells.Add(cell2);
       
        cell.Controls.Add(lbl);
        cell2.Controls.Add(btn);

        table.Height = Unit.Percentage(100);
        table.Width = Unit.Percentage(100);
        table.BorderWidth = Unit.Pixel(0);

        cell.VerticalAlign = VerticalAlign.Middle;
        cell.HorizontalAlign = HorizontalAlign.Center;
        cell2.VerticalAlign = VerticalAlign.Middle;
        cell2.HorizontalAlign = HorizontalAlign.Center;

        lbl.Font.Name = "Tahoma";
        lbl.Font.Size = FontUnit.Point(8);

        return table;
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
        Session["msgattach"] = FName;
    }

}