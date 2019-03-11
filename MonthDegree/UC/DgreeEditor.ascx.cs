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
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxEditors;

public partial class DgreeEditor : System.Web.UI.UserControl
{
    List<Record> list = new List<Record>();
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
        
        int start = GVEditor.PageIndex * GVEditor.SettingsPager.PageSize;
        int end = (GVEditor.PageIndex + 1) * GVEditor.SettingsPager.PageSize;
        GridViewDataColumn colDegree = GVEditor.Columns["degree"] as GridViewDataColumn;
        for (int i = 0; i < GVEditor.VisibleRowCount; i++)
        {
            ASPxTextBox txtDgree = (ASPxTextBox)GVEditor.FindRowCellTemplateControl(i, colDegree, "txtDgree");
            if (txtDgree == null)
                continue;
            int id = Convert.ToInt32(GVEditor.GetRowValues(i, GVEditor.KeyFieldName));
            float dgree; float.TryParse(txtDgree.Text, out dgree);
            list.Add(new Record(id, dgree));
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
    protected void GVEditor_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
    {

        //if (e.Exception != null)
        //    GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        //else
        //{
        //    if (e.NewValues["rply"] == null || CBSend.Checked == false)
        //        GVEditor.JSProperties["cpShowPopup"] = "تم التعديل ...";
        //    else
        //    {
        //        string ShowThis = string.Empty;

        //        try
        //        {
        //            SmtpClient client = MailConfig();
        //            MailMessage message = new MailMessage();

        //            message.From = new MailAddress(((NetworkCredential)client.Credentials).UserName);
        //            message.To.Add(new MailAddress(e.NewValues["mail"].ToString()));
        //            message.Subject = "noreply";
        //            message.Body = e.NewValues["rply"].ToString();
        //            message.IsBodyHtml = true;
                    
        //            client.Send(message);
        //            ShowThis = "تم التعديل ..." + Environment.NewLine + "تم ارسال بريد";
        //        }
        //        catch (Exception ex)
        //        {
        //            ShowThis = ex.Message;
        //        }

        //        GVEditor.JSProperties["cpShowPopup"] = ShowThis;
        //    }
            
        //}
        
    }
    protected void GVEditor_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم الحـــذف ...";
    }
    protected void GVEditor_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        if ((bool)e.NewValues["adminagree"] == true && (bool)e.NewValues["agreeshow"] == false)
        {
            GVEditor.JSProperties["cpShowPopup"] = "لا يمكن عرض رساله لم يوافق المستخدم علي عرضها";
            e.Cancel = true;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DSData.Update();
    }
    protected void GVEditor_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
    {
        if (e.Parameters == "post")
        {
            for (int i = 0; i < list.Count; i++)
            {
                DSData.UpdateParameters["dgree"].DefaultValue = list[i].Dgree.ToString();
                DSData.UpdateParameters["tarteeb"].DefaultValue = list[i].Tarteeb.ToString();
                DSData.Update();
            }
            GVEditor.DataBind();
        }
    }
    
}

public class Record
{
    int tarteeb;
    float dgree;
    
    public Record(int tarteeb, float dgree)
    {
        this.tarteeb = tarteeb;
        this.dgree = dgree;
    }
    public int Tarteeb { get { return this.tarteeb; } }
    public float Dgree { get { return this.dgree; } }

}