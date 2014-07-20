using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default : System.Web.UI.Page
{
    dsMailsTableAdapters.msgreplyTableAdapter adpreply = new dsMailsTableAdapters.msgreplyTableAdapter();
    dsMailsTableAdapters.contactdataTableAdapter adpmsg = new dsMailsTableAdapters.contactdataTableAdapter();
    dsMailsTableAdapters.UsersTableAdapter adpuser = new dsMailsTableAdapters.UsersTableAdapter();
    dsMailsTableAdapters.QueriesTableAdapter adpQ = new dsMailsTableAdapters.QueriesTableAdapter();

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionMails.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }
    protected void MailFilter_NodeClick(object source, DevExpress.Web.ASPxTreeView.TreeViewNodeEventArgs e)
    {
        Response.Redirect("Default.aspx?view=" + e.Node.Name);
    }
    protected void dsMessages_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //e.Command.CommandText = "";
        switch (Request.QueryString["view"])
        {
            case null:
            case "inbox":
                e.Command.CommandText = @"SELECT msgto.msgid, msgto.userto, contactdata.MsgTypeId, contactdata.msgSender, contactdata.msgsenddate, contactdata.msgsubject, contactdata.msgattachpath, 
                Users.realname, CDMsgType.MsgType, msgto.inbasket, CBool(IIf([contactdata].[msgattachpath]='', False,True)) AS attach, msgto.readed,
                (SELECT COUNT(msgid) FROM msgreply WHERE msgid = msgto.msgid AND readed = false) As rplyCount
                FROM (((CDMsgType RIGHT OUTER JOIN
                contactdata ON CDMsgType.MsgTypeId = contactdata.MsgTypeId) LEFT OUTER JOIN
                Users ON contactdata.msgSender = Users.UserID) RIGHT OUTER JOIN
                msgto ON contactdata.msgid = msgto.msgid)
                WHERE (msgto.userto = ?) AND (msgto.inbasket = false)
                ORDER BY contactdata.msgsenddate DESC";
                break;
            case "outbox":
                e.Command.CommandText = @"SELECT contactdata.msgid, contactdata.MsgTypeId, contactdata.msgSender, contactdata.msgsenddate, contactdata.msgsubject, contactdata.msgattachpath,
                Users.realname, CDMsgType.MsgType, CBool(IIf([contactdata].[msgattachpath]='', False,True)) AS attach,
                (SELECT COUNT(msgid) FROM msgreply WHERE msgid = contactdata.msgid AND readed = false) As rplyCount
                FROM ((CDMsgType RIGHT OUTER JOIN
                contactdata ON CDMsgType.MsgTypeId = contactdata.MsgTypeId) LEFT OUTER JOIN
                Users ON contactdata.msgSender = Users.UserID)
                WHERE (contactdata.msgSender = ?) AND (contactdata.inbasket = false)
                ORDER BY contactdata.msgsenddate DESC";
                break;
            case "draft":
                e.Command.CommandText = @"";
                break;
            case "trash":
                e.Command.CommandText = @"SELECT msgto.msgid, msgto.userto, contactdata.MsgTypeId, contactdata.msgSender, contactdata.msgsenddate, contactdata.msgsubject, contactdata.msgattachpath, 
                Users.realname, CDMsgType.MsgType, msgto.inbasket, CBool(IIf([contactdata].[msgattachpath]='', False,True)) AS attach,
                (SELECT COUNT(msgid) FROM msgreply WHERE msgid = msgto.msgid AND readed = false) As rplyCount
                FROM (((CDMsgType RIGHT OUTER JOIN
                contactdata ON CDMsgType.MsgTypeId = contactdata.MsgTypeId) LEFT OUTER JOIN
                Users ON contactdata.msgSender = Users.UserID) RIGHT OUTER JOIN
                msgto ON contactdata.msgid = msgto.msgid)
                WHERE (msgto.userto = ?) AND (msgto.inbasket = true)
                ORDER BY contactdata.msgsenddate DESC";
                break;
        }
    }
    protected void dsMessages_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        switch (Request.QueryString["view"])
        {
            case null:
            case "inbox":
                adpQ.Updatemsgto_inbasket(true, Convert.ToInt32(e.Command.Parameters["msgid"].Value), Convert.ToInt32(e.Command.Parameters["userto"].Value));
                break;
            case "outbox":
                adpQ.Updatecontactdata_inbasket(true, Convert.ToInt32(e.Command.Parameters["msgid"].Value));
                break;
            case "draft":
                e.Command.CommandText = @"";
                break;
            case "trash":
                adpQ.Deletemsgto(Convert.ToInt32(e.Command.Parameters["msgid"].Value), Convert.ToInt32(e.Command.Parameters["userto"].Value));
                break;
        }
        e.Cancel = true;
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
        if (Request.QueryString["view"] == "inbox" || Request.QueryString["view"] == null)
        {
            DataRow row = ((DataRowView)MessagesGrid.GetRow(MessagesGrid.FocusedRowIndex)).Row;
            if ((bool)row["readed"] == false)
                adpQ.Updatemsgto_readed(true, msgid, Convert.ToInt32(sessionMails.UserID));
            adpQ.Updatemsgreply_readed(true, msgid);
        }
        else if (Request.QueryString["view"] == "outbox")
        {
            adpQ.Updatemsgreply_readed(true, msgid);

        }
        
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
    protected void MessagesGrid_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
    {
        if (Request.QueryString["view"] != "inbox" && Request.QueryString["view"] != null)
            return;
        DataRow row = ((DataRowView)MessagesGrid.GetRow(e.VisibleIndex)).Row;
        e.Cell.Font.Bold = !(bool)row["readed"];
    }
    protected void MessagesGrid_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
    {
        if (Request.QueryString["view"] != "inbox" && Request.QueryString["view"] != null) return;
        if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
        
        DataRow row = ((DataRowView)MessagesGrid.GetRow(e.VisibleIndex)).Row;
        e.Row.Font.Bold = !(bool)row["readed"];
    }

    protected void AttachmentImg_DataBinding(object sender, EventArgs e)
    {
        DevExpress.Web.ASPxEditors.ASPxImage img = (DevExpress.Web.ASPxEditors.ASPxImage)sender;
        DevExpress.Web.ASPxGridView.GridViewDataRowTemplateContainer container = (DevExpress.Web.ASPxGridView.GridViewDataRowTemplateContainer)img.Parent;
        object obj = container.Grid.GetRowValues(container.VisibleIndex, "msgattachpath");
        if (obj != null && obj.ToString() != string.Empty)
        {
            img.Visible = true;
        }
        else
        {
            img.Visible = false;
        }
    }

    protected void AttachmentImg_DataBound(object sender, EventArgs e)
    {
        //DevExpress.Web.ASPxEditors.ASPxImage img = (DevExpress.Web.ASPxEditors.ASPxImage)sender;
        //DevExpress.Web.ASPxGridView.GridViewDataRowTemplateContainer container = (DevExpress.Web.ASPxGridView.GridViewDataRowTemplateContainer)img.Parent;
        //if (container.DataItem != null && container.DataItem.ToString() != string.Empty)
        //{
        //    img.Visible = true;
        //}
        //else
        //{
        //    img.Visible = false;
        //}
    }
}