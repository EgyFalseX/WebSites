<%@ Page Title="" Language="C#" MasterPageFile="MainPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Left" runat="server">
    <dx:ASPxTreeView ID="MailFilter" AllowSelectNode="True" runat="server" AutoPostBack="True" OnNodeClick="MailFilter_NodeClick">
        <Nodes>
            <dx:TreeViewNode Text="صندوق الرسائل" Expanded="True" Image-Url="images/person.png">
                <Image Url="images/person.png"></Image>
                <Nodes>
                    <dx:TreeViewNode Text="الوارد" Image-Url="images/inbox.png" Name="inbox">
                        <Image Url="images/inbox.png"></Image>
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="الصادر" Image-Url="images/sent.png" Name="outbox">
                        <Image Url="images/sent.png"></Image>
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="مسودة" Image-Url="images/drafts.png" Name="draft" Visible="False">
                        <Image Url="images/drafts.png"></Image>
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="محزوفات" Image-Url="images/trash.png" Name="trash">
                        <Image Url="images/trash.png"></Image>
                    </dx:TreeViewNode>
                </Nodes>
            </dx:TreeViewNode>
        </Nodes>
        <Styles>
            <NodeImage Paddings-PaddingTop="3px">
                <Paddings PaddingTop="3px"></Paddings>
            </NodeImage>
        </Styles>
    </dx:ASPxTreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <dx:ASPxSplitter ID="ContentSplitter" runat="server" Orientation="Vertical" Height="100%" Width="100%" ClientInstanceName="ContentSplitter">
        <ClientSideEvents PaneResized="OutlookController.ContentSplitterPaneResized" />
        <Styles>
            <Pane>
                <Border BorderWidth="0px" />
                <Paddings Padding="0px" />
            </Pane>
        </Styles>
        <Panes>
            <dx:SplitterPane Name="MessageList">
                <PaneStyle CssClass="mlist"></PaneStyle>
                <ContentCollection>
                    <dx:SplitterContentControl>
                        <dx:ASPxCallbackPanel ID="MessageListPanel" runat="server" RenderMode="Div" Height="100%">
                            <PanelCollection>
                                <dx:PanelContent ID="PanelContent1" runat="server">
                                    <dx:ASPxGridView ID="MessagesGrid" runat="server" ClientInstanceName="MessagesGrid"
                                        DataSourceID="dsMessages" KeyFieldName="msgid" Width="100%" Caption="البيــــــــــا نـــــــــــــــات" SummaryText="الملخص" RightToLeft="True" EnableCallBacks="False" OnHtmlRowPrepared="MessagesGrid_HtmlRowPrepared" style="direction: ltr">
                                        <ClientSideEvents FocusedRowChanged="function(s, e) {
	callbackPanelMSGDetails.PerformCallback()
}" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ButtonType="Image" FixedStyle="Left">
                                                <DeleteButton Visible="True">
                                                    <Image Url="Images/DeleteMSG.png">
                                                    </Image>
                                                </DeleteButton>
                                                <HeaderTemplate>
                                                    <dx:ASPxCheckBox ID="cbSelectAll" runat="server" CheckState="Unchecked" ClientInstanceName="headerSelectionASPxCheckBox" Visible="False">
                                                        <ClientSideEvents CheckedChanged="function(s, e) {
	function(s,e){MessagesGrid.SelectAllRowsOnPage(s.GetChecked());
}" />
                                                    </dx:ASPxCheckBox>
                                                </HeaderTemplate>
                                            </dx:GridViewCommandColumn>

                                            <dx:GridViewDataColumn FieldName="realname" Width="200px" Caption="الراسل" VisibleIndex="3" />
                                            <dx:GridViewDataColumn FieldName="msgsubject" Caption="عنوان" VisibleIndex="4" />
                                            <dx:GridViewDataDateColumn FieldName="msgsenddate" Width="200px" GroupIndex="0" SortOrder="Descending" Caption="تاريخ" VisibleIndex="1">
                                                <PropertiesDateEdit DisplayFormatString="g" />
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="نوع الرسالة" FieldName="MsgType" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                <PropertiesComboBox DataSourceID="dsCDMsgType" TextField="MsgType" ValueField="MsgType" ValueType="System.Int32">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn Caption="ردود لم تقراء" FieldName="rplyCount" ShowInCustomizationForm="True" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataColumn FieldName="attach" Width="40px">
                                            <Settings AllowGroup="False" />
                                            <HeaderCaptionTemplate>
                                                <div class="attachcap"></div>
                                            </HeaderCaptionTemplate>
                                            <DataItemTemplate>
                                                <dx:ASPxImage ID="AttachmentImg" runat="server" ImageUrl="images/attach.png" OnDataBinding="AttachmentImg_DataBinding" />
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" SortingImageSpacing="5px" />
                                        </dx:GridViewDataColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords" />
                                        <Settings ShowGroupPanel="True" VerticalScrollBarMode="Visible" VerticalScrollableHeight="0"
                                            ShowGroupedColumns="True" GridLines="Vertical" />
                                        <SettingsBehavior AllowFocusedRow="True" AutoExpandAllGroups="true"
                                            EnableRowHotTrack="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                        <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه"
                                            CommandDelete="حذف" CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار"
                                            CommandUpdate="تحديث" ConfirmDelete="هل انت متأكد؟"
                                            CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ" EmptyHeaders="راس فارغ"
                                            FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه"
                                            FilterControlPopupCaption="خيارات التصفيه"
                                            GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه"
                                            GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه"
                                            HeaderFilterShowAll="اظهار الكل" HeaderFilterShowBlanks="اظهار الفارغ"
                                            HeaderFilterShowNonBlanks="اظهار غير الفارغ"
                                            PopupEditFormCaption="صفحة المحرر" />
                                        <Paddings Padding="0px" />
                                        <Border BorderWidth="0px" />
                                        <Styles>
                                            <Row Cursor="pointer" />
                                        </Styles>
                                    </dx:ASPxGridView>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane Name="MessageBody" ScrollBars="Auto">
                <PaneStyle CssClass="mbody"></PaneStyle>
                <Separator>
                    <SeparatorStyle>
                        <Border BorderWidth="1px" />
                        <BorderLeft BorderWidth="0px" />
                        <BorderRight BorderWidth="0px" />
                    </SeparatorStyle>
                </Separator>
                <ContentCollection>
                    <dx:SplitterContentControl>

                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanelMSGDetails" runat="server" ClientInstanceName="callbackPanelMSGDetails" OnCallback="ASPxCallbackPanelMSGDetails_Callback" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxPageControl ID="ASPxPageControlMsg" runat="server" ActiveTabIndex="0" RightToLeft="True" Width="100%" Style="direction: rtl" Visible="False">
                                        <TabPages>
                                            <dx:TabPage Name="msgTab" Text="نص الرسالة">
                                                <ContentCollection>
                                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxHyperLink ID="lblAttach" runat="server" Target="_blank">
                                                                    </dx:ASPxHyperLink>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxHtmlEditor ID="tbMsg" runat="server" ActiveView="Preview" Width="100%">
                                                                        <Settings AllowDesignView="False" AllowHtmlView="False" />
                                                                    </dx:ASPxHtmlEditor>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage Name="replayTab" Text="الرد">
                                                <ContentCollection>
                                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                        <asp:AccessDataSource ID="dsReplay" runat="server" DataFile="../App_Data/contact.mdb" DeleteCommand="DELETE FROM [msgreply] WHERE (([msgid] = ?) OR ([msgid] IS NULL AND ? IS NULL)) AND (([userreply] = ?) OR ([userreply] IS NULL AND ? IS NULL)) AND (([replydata] = ?) OR ([replydata] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [msgreply] ([msgid], [userreply], [replydata], [replyattach], [replydate]) VALUES (?, ?, ?, ?, ?)" SelectCommand="SELECT msgreply.msgid, msgreply.userreply, msgreply.replyattach, Users.realname, Users.imgpath, Users.signture, Users.umail, CDtitle.titleName, CDdept.deptName, msgreply.replydate, msgreply.replydata, msgreply.id FROM (((CDdept RIGHT OUTER JOIN Users ON CDdept.deptId = Users.udeptId) LEFT OUTER JOIN CDtitle ON Users.titleId = CDtitle.titleId) RIGHT OUTER JOIN msgreply ON Users.UserID = msgreply.userreply) WHERE (msgreply.msgid = ?)" UpdateCommand="UPDATE [msgreply] SET [replyattach] = ?, [replydate] = ? WHERE (([msgid] = ?) OR ([msgid] IS NULL AND ? IS NULL)) AND (([userreply] = ?) OR ([userreply] IS NULL AND ? IS NULL)) AND (([replydata] = ?) OR ([replydata] IS NULL AND ? IS NULL))">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="msgid" Type="Int32" />
                                                                <asp:Parameter Name="userreply" Type="Int32" />
                                                                <asp:Parameter Name="replydata" Type="String" />
                                                            </DeleteParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="msgid" Type="Int32" />
                                                                <asp:Parameter Name="userreply" Type="Int32" />
                                                                <asp:Parameter Name="replydata" Type="String" />
                                                                <asp:Parameter Name="replyattach" Type="String" />
                                                                <asp:Parameter Name="replydate" Type="DateTime" />
                                                            </InsertParameters>
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="-100" Name="msgid" Type="Int32" />
                                                            </SelectParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="replyattach" Type="String" />
                                                                <asp:Parameter Name="replydate" Type="DateTime" />
                                                                <asp:Parameter Name="msgid" Type="Int32" />
                                                                <asp:Parameter Name="userreply" Type="Int32" />
                                                                <asp:Parameter Name="replydata" Type="String" />
                                                            </UpdateParameters>
                                                        </asp:AccessDataSource>
                                                        <asp:DataList ID="DataListMsg" runat="server" DataSourceID="dsReplay" Style="direction: rtl" Width="100%" DataKeyField="id" GridLines="Horizontal" Height="100%">
                                                            <FooterTemplate>
                                                                <dx:ASPxButton ID="btnrplyHead" runat="server" AutoPostBack="False" Text="اضافة رد">
                                                                    <ClientSideEvents Click="function(s, e) {
 var key = MessagesGrid.GetRowKey(MessagesGrid.GetFocusedRowIndex());
 ReplyPopupControl.SetContentUrl('CreateReply.aspx?id=' + key);
 ReplyPopupControl.Show();
}" />
                                                                </dx:ASPxButton>
                                                            </FooterTemplate>
                                                            <HeaderTemplate>
                                                                <dx:ASPxButton ID="btnrplyHead" runat="server" Text="اضافة رد" AutoPostBack="False">
                                                                    <ClientSideEvents Click="function(s, e) {
 var key = MessagesGrid.GetRowKey(MessagesGrid.GetFocusedRowIndex());
 ReplyPopupControl.SetContentUrl('CreateReply.aspx?id=' + key);
 ReplyPopupControl.Show();
}" />
                                                                </dx:ASPxButton>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <table dir="rtl">
                                                                    <tr>
                                                                        <td rowspan="3">&nbsp;</td>
                                                                        <td rowspan="2" style="width: 106px">
                                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("imgpath") %>' />
                                                                            <br />
                                                                            <br />
                                                                            <br />
                                                                        </td>
                                                                        <td style="width: 118px">
                                                                            <dx:ASPxLabel ID="lbltitleName" runat="server" Text='<%# Eval("titleName") %>'>
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 118px">
                                                                            <dx:ASPxLabel ID="lbldeptName" runat="server" Text='<%# Eval("deptName") %>'>
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 106px">
                                                                            <dx:ASPxLabel ID="lblrealname" runat="server" Text='<%# Eval("realname") %>'>
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                        <td style="width: 118px">
                                                                            <dx:ASPxLabel ID="lblsignture" runat="server" Text='<%# Eval("signture") %>'>
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;</td>
                                                                        <td colspan="2" style="direction: rtl">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="التاريخ">
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                        <td colspan="2" style="direction: rtl">
                                                                            <dx:ASPxLabel ID="lblreplydate" runat="server" Text='<%# Eval("replydate") %>'>
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="المرفقات">
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                        <td colspan="2">
                                                                            <dx:ASPxHyperLink ID="lblreplyattach" runat="server" Text='<%# Eval("replyattach") %>' NavigateUrl='<%# Eval("replyattach", "Assets/rplyattach/{0}") %>' />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="الـــــــرد" valign="top">
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                        <td style="direction: rtl" colspan="2">
                                                                            <dx:ASPxLabel ID="lblreplydata" runat="server" RightToLeft="True" Text='<%# Eval("replydata") %>' EncodeHtml="False">
                                                                            </dx:ASPxLabel>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage Name="ToTab" Text="المرسل الية">
                                                <ContentCollection>
                                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxListBox ID="lbUsers" runat="server" DataSourceID="dsUsers" Style="direction: rtl" ReadOnly="True" RightToLeft="True">
                                                            <Columns>
                                                                <dx:ListBoxColumn Caption="الاسم" FieldName="realname" />
                                                                <dx:ListBoxColumn Caption="البريد" FieldName="umail" />
                                                            </Columns>
                                                        </dx:ASPxListBox>
                                                        <asp:AccessDataSource ID="dsUsers" runat="server" DataFile="../App_Data/contact.mdb" SelectCommand="SELECT realname, umail, imgpath, signture FROM Users WHERE EXISTS (SELECT msgid, userto, inbasket FROM msgto WHERE (userto = Users.UserID) AND (msgid = ?))">
                                                            <SelectParameters>
                                                                <asp:Parameter DefaultValue="-100" Name="?" />
                                                            </SelectParameters>
                                                        </asp:AccessDataSource>
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                        </TabPages>
                                    </dx:ASPxPageControl>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanelReply" runat="server" ClientInstanceName="callbackPanelReply" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent ID="PanelContent2" runat="server">
                                    <dx:ASPxPopupControl ID="ASPxPopupControl2" runat="server" AllowDragging="True" AllowResize="True"
                                        CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
                                        PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="700px"
                                        Height="500px" FooterText="يمكنك تعديل حجم الصفحة عن طريق سحب الطرف الايمن اسفل الصفحه"
                                        HeaderText="اضافة رد" ClientInstanceName="ReplyPopupControl" EnableHierarchyRecreation="True" PopupAnimationType="Fade" RightToLeft="True" ScrollBars="Auto" Modal="True" ShowPageScrollbarWhenModal="True" ContentUrl="CreateReply.aspx">
                                        <ContentCollection>
                                            <dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server" SupportsDisabledAttribute="True"></dx:PopupControlContentControl>
                                        </ContentCollection>
                                    </dx:ASPxPopupControl>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>
    <asp:AccessDataSource ID="dsMessages" runat="server" DataFile="../App_Data/contact.mdb" SelectCommand="SELECT msgto.msgid, msgto.userto, contactdata.MsgTypeId, contactdata.msgSender, contactdata.msgsenddate, contactdata.msgsubject, contactdata.msgattachpath, contactdata.msgdetials, Users.realname, CDMsgType.MsgType, msgto.inbasket, msgto.readed, CBool(IIf([contactdata].[msgattachpath]='', false,true)) AS attach,
(SELECT COUNT(msgid) FROM msgreply WHERE msgid = msgto.msgid AND readed = false) As rplyCount
FROM (((CDMsgType RIGHT OUTER JOIN contactdata ON CDMsgType.MsgTypeId = contactdata.MsgTypeId) LEFT OUTER JOIN Users ON contactdata.msgSender = Users.UserID) RIGHT OUTER JOIN msgto ON contactdata.msgid = msgto.msgid) WHERE (msgto.userto = ?) AND (msgto.inbasket = false) ORDER BY contactdata.msgsenddate DESC" OnSelecting="dsMessages_Selecting" DeleteCommand="UPDATE msgto SET inbasket = true
WHERE msgid = ? AND userto = ?"
        OnDeleting="dsMessages_Deleting" UpdateCommand="UPDATE msgto SET inbasket = inbasket WHERE (msgid = ?) AND (userto = ?)">
        <DeleteParameters>
            <asp:Parameter Name="msgid" />
            <asp:SessionParameter Name="userto" SessionField="MessagesUserID" />
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="-100" Name="userto" SessionField="MessagesUserID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="msgid" />
            <asp:Parameter Name="userto" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="dsCDMsgType" runat="server" DataFile="../App_Data/contact.mdb" SelectCommand="SELECT [MsgTypeId], [MsgType] FROM [CDMsgType]"></asp:AccessDataSource>
</asp:Content>
