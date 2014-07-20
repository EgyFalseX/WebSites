using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data;
using System.Data.OleDb;

public partial class EditUserMessagesLow : System.Web.UI.UserControl
{
    private string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/contact.mdb");
    private DataTable LoadTable(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, constr);
        try
        { da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    private SmtpClient MailConfig()
    {
        DataTable dt = LoadTable("Select mailserver, port, username, pass, enableSsl from mailinfo");
        SmtpClient client = new SmtpClient();
        if (dt.Rows.Count != 0)
        {
            client.Host = dt.Rows[0]["mailserver"].ToString();
            client.Port = (int)dt.Rows[0]["port"]; ;
            client.Credentials = new NetworkCredential(dt.Rows[0]["username"].ToString(), dt.Rows[0]["pass"].ToString());
            client.EnableSsl = (bool)dt.Rows[0]["enableSsl"];
        }
        return client;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["msg"] == null)
            Response.Redirect("~/");

        switch (Request.QueryString["msg"].ToString())
        {
            case "1":
                if ((bool)CodesSyndicateContact.IsAdmin)
                    GVEditor.DataSourceID = "DSData1";
                else
                    GVEditor.DataSourceID = "DSData1User";
                GVEditor.DataBind();
                break;
            case "2":
                if ((bool)CodesSyndicateContact.IsAdmin)
                    GVEditor.DataSourceID = "DSData2";
                else
                    GVEditor.DataSourceID = "DSData2User";
                GVEditor.DataBind();
                break;
            case "3":
                if ((bool)CodesSyndicateContact.IsAdmin)
                    GVEditor.DataSourceID = "DSData3";
                else
                    GVEditor.DataSourceID = "DSData3User";
                GVEditor.DataBind();
                break;
            case "4":
                if ((bool)CodesSyndicateContact.IsAdmin)
                    GVEditor.DataSourceID = "DSData4";
                else
                    GVEditor.DataSourceID = "DSData4User";
                GVEditor.DataBind();
                break;
            default:
                break;
        }
     
    }
    protected void GVEditor_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم التعــــديل ...";
        if (e.NewValues["reply"] == null)
            return;
        try
        {
            SmtpClient client = MailConfig();
            MailMessage message = new MailMessage();

            message.From = new MailAddress(((NetworkCredential)client.Credentials).UserName);
            message.To.Add(new MailAddress(e.OldValues["mail"].ToString()));
            message.Subject = "noreply";
            message.Body = "تم الرد علي رسالتك ارجو الدخول للموقع لمتابعة الرد";
            message.IsBodyHtml = true;

            client.Send(message);
        }
        catch (Exception ex)
        {
            GVEditor.JSProperties["cpShowPopup"] = ex.Message;
        }
    }
}