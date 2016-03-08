using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;


/// <summary>
/// Send Email
/// </summary>
public class SendEmailClass
{
    private bool _IsArabic=false;
    private string _FromEmail, _ToEmail,_Subject, _Body,_AttachFile;


    public string FromEmail
    {
        get { return _FromEmail; }
        set { _FromEmail = value; }
    }
    public string ToEmail
    {
        get { return _ToEmail; }
        set { _ToEmail = value; }
    }
    public string Subject
    {
        get { return _Subject; }
        set { _Subject = value; }
    }
    public string Body
    {
        get { return _Body; }
        set { _Body = value; }
    }
    public string AttachFile
    {
        get { return _AttachFile; }
        set { _AttachFile = value; }
    }

    public bool IsArabic
    {
        get { return _IsArabic; }
        set { _IsArabic = value; }
    }
    public string SendEmailMethod()
    {
        string strMsg;
        SmtpClient client = new SmtpClient("smtp.gmail.com");
        client.EnableSsl = true;
        //client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.Port = 587;
        client.Credentials = new System.Net.NetworkCredential("ariscweb@gmail.com", "hpfvfnAS1a");
        //client.UseDefaultCredentials = true;
        string from = FromEmail;
        string to = ToEmail;

        MailMessage msg = new MailMessage();

        msg.From = new MailAddress(from);
        msg.To.Add(to);

        msg.Subject = Subject;
        msg.Body = Body;
        msg.IsBodyHtml = true;

        if (AttachFile != null)
        {
            System.Net.Mail.Attachment attach = new System.Net.Mail.Attachment(AttachFile);
            msg.Attachments.Add(attach);
        }
        try
        {
            client.Send(msg);
            if(IsArabic)
                strMsg = "تم الارسال بنجاح";
            else
                strMsg = "Sent Successfully";
        }
        catch (Exception ex)
        {
            strMsg = ex.Message;
        }

        return strMsg;


        //try
        //{
        //    MailMessage mail = new MailMessage();
        //    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

        //    mail.From = new MailAddress("ahmed2business@gmail.com");
        //    mail.To.Add("ahmed2works@gmail.com");
        //    mail.Subject = "Test Mail";
        //    mail.Body = "This is for testing SMTP mail from GMAIL";

        //    SmtpServer.Port = 587;
        //    SmtpServer.Credentials = new System.Net.NetworkCredential("ahmed2business", "ddiamond 1987");
        //    SmtpServer.EnableSsl = true;

        //    SmtpServer.Send(mail);
        //    MessageBox.Show("mail Send");
        //}
        //catch (Exception ex)
        //{
        //    MessageBox.Show(ex.ToString());
        //}
    }
}