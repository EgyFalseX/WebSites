using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMails : System.Web.UI.Page
{
    dsMailsTableAdapters.msgreplyTableAdapter adpreply = new dsMailsTableAdapters.msgreplyTableAdapter();
    dsMailsTableAdapters.contactdataTableAdapter adpmsg = new dsMailsTableAdapters.contactdataTableAdapter();
    dsMailsTableAdapters.UsersTableAdapter adpuser = new dsMailsTableAdapters.UsersTableAdapter();
    dsMailsTableAdapters.QueriesTableAdapter adpQ = new dsMailsTableAdapters.QueriesTableAdapter();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMails.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
        if (!sessionMails.IsAdmin)
            Response.Redirect("Default.aspx");
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

    protected void ASPxCallbackPanelMSGDetails_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        int index = MessagesGrid.FocusedRowIndex;
        if (index == -1 || MessagesGrid.IsGroupRow(index))
        {
            //should clear controls here...
            ASPxPageControlMsg.Visible = false;
            return;
        }
        ASPxPageControlMsg.Visible = true;

        int msgid = Convert.ToInt32(MessagesGrid.GetRowValues(index, MessagesGrid.KeyFieldName));

        tbMsg.Html = adpmsg.ScalarQueryMsgDetails(msgid);
        string attach = adpmsg.ScalarQueryAttach(msgid);
        if (attach != string.Empty)
        {
            //
            lblAttach.NavigateUrl = string.Format("Assets/msgattach/{0}", attach);
            lblAttach.Text = "المرفقــــــات";
        }
        else
        {
            lblAttach.NavigateUrl = string.Empty;
            lblAttach.Text = string.Empty;
        }

        dsUsers.SelectParameters[0].DefaultValue = msgid.ToString();
        DataView DV1 = (DataView)dsUsers.Select(DataSourceSelectArguments.Empty);
        dsUsers.DataBind();
        lbUsers.DataBind();

        dsReplay.SelectParameters[0].DefaultValue = msgid.ToString();
        DataView DV2 = (DataView)dsReplay.Select(DataSourceSelectArguments.Empty);
        dsReplay.DataBind();
        DataListMsg.DataBind();

    }


}