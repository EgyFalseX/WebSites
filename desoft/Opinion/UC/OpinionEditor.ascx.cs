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

public partial class OpinionEditor : System.Web.UI.UserControl
{
    private DataTable LoadTable(string commandtext)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/ABOUT.mdb");
        DataTable dt =new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandtext, constr);
        da.Fill(dt);

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
    protected void GVEditor_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
    {

        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
        {
            if (CBSend.Checked == false)
                GVEditor.JSProperties["cpShowPopup"] = "تم التعديل ...";
            else
            {
                string ShowThis = string.Empty;

                try
                {
                    SmtpClient client = MailConfig();
                    MailMessage message = new MailMessage();

                    message.From = new MailAddress(((NetworkCredential)client.Credentials).UserName);
                    message.To.Add(new MailAddress(e.NewValues["mail"].ToString()));
                    message.Subject = "موقع نقابة المعلمين بالفيوم";
                    message.Body = "تم عرض مشاركتكم علي موقع النقابه و نتمني منكم المزيد من التواصل";
                    message.IsBodyHtml = true;
                    
                    client.Send(message);
                    ShowThis = "تم التعديل ..." + Environment.NewLine + "تم ارسال بريد";
                }
                catch (Exception ex)
                {
                    ShowThis = ex.Message;
                }

                GVEditor.JSProperties["cpShowPopup"] = ShowThis;
            }
            
        }
        
    }
    protected void GVEditor_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم الحـــذف ...";
    }
}