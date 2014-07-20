<%@ Page Title="" Language="C#" MasterPageFile="~/Mails/MasterPage.master" AutoEventWireup="true" CodeFile="Qry01.aspx.cs" Inherits="Qry01" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsMessages">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="رقم الرسالة" FieldName="msgid" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="تاريخ الرسالة" FieldName="msgsenddate" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="عنوان الرسالة" FieldName="msgsubject" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="مسار المرفق" FieldName="msgattachpath" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="حذف" FieldName="inbasket" VisibleIndex="7">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn Caption="اسم المرسل" FieldName="realname" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="موبيل" FieldName="mobil" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="نوع الرسالة" FieldName="MsgType" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
    </dx:ASPxGridView>
    <asp:AccessDataSource ID="dsMessages" runat="server" DataFile="~/App_Data/contact.mdb" SelectCommand="SELECT contactdata.msgid, contactdata.MsgTypeId, contactdata.msgSender, contactdata.msgsenddate, contactdata.msgsubject, contactdata.msgattachpath, contactdata.inbasket, Users.realname, Users.mobil, CDMsgType.MsgType FROM ((contactdata LEFT OUTER JOIN CDMsgType ON contactdata.MsgTypeId = CDMsgType.MsgTypeId) LEFT OUTER JOIN Users ON contactdata.msgSender = Users.UserID)"></asp:AccessDataSource>
</asp:Content>

