<%@ Page Title="" Language="C#" MasterPageFile="~/Mails/MasterPage.master" AutoEventWireup="true" CodeFile="AdminMails.aspx.cs" Inherits="AdminMails" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <Buttons>
                    <dx:EditButton Text="تصدير" Width="50px">
                    </dx:EditButton>
                </Buttons>
                <ValidationSettings>
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                </ValidationSettings>
            </dx:ASPxComboBox>
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="MessagesGrid" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
    <dx:ASPxGridView ID="MessagesGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="MessagesGrid" DataSourceID="dsData" style="direction: rtl" EnableCallBacks="False" KeyFieldName="msgid">
        <ClientSideEvents FocusedRowChanged="function(s, e) {
	callbackPanelMSGDetails.PerformCallback();
MsgPopupControl.Show();
}" />
        <Columns>
            <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowSelectCheckbox="True">
                <EditButton Text="التفاصيل">
                </EditButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="msgid" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="نوع الرسالة" FieldName="MsgType" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="المرسل" FieldName="SenderUser" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="المرسل الية" FieldName="ToUser" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="تاريخ" FieldName="msgsenddate" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="العنوان" FieldName="msgsubject" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" AutoExpandAllGroups="True" ColumnResizeMode="NextColumn" EnableRowHotTrack="True" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterBar="Visible" />
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
    </dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
        </tr>
    </table>
    <asp:AccessDataSource ID="dsData" runat="server" DataFile="~/App_Data/contact.mdb" SelectCommand="SELECT msgto.msgid, CDMsgType.MsgType, Users_1.realname AS SenderUser, Users.realname AS ToUser, contactdata.msgsenddate, contactdata.msgsubject, contactdata.msgattachpath, contactdata.msgdetials FROM ((((CDMsgType RIGHT OUTER JOIN contactdata ON CDMsgType.MsgTypeId = contactdata.MsgTypeId) RIGHT OUTER JOIN msgto ON contactdata.msgid = msgto.msgid) LEFT OUTER JOIN Users Users_1 ON contactdata.msgSender = Users_1.UserID) LEFT OUTER JOIN Users ON msgto.userto = Users.UserID)
order by contactdata.msgsenddate"></asp:AccessDataSource>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="MsgPopupControl" AllowDragging="True" AllowResize="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="700px" Height="500px" FooterText="يمكنك تعديل حجم الصفحة عن طريق سحب الطرف الايمن اسفل الصفحه" EnableHierarchyRecreation="True" 
        PopupAnimationType="Fade" RightToLeft="True" ScrollBars="Auto" Modal="True" ShowPageScrollbarWhenModal="True">
        <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
     <dx:ASPxCallbackPanel ID="ASPxCallbackPanelMSGDetails" runat="server" ClientInstanceName="callbackPanelMSGDetails" OnCallback="ASPxCallbackPanelMSGDetails_Callback">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxPageControl ID="ASPxPageControlMsg" runat="server" ActiveTabIndex="0" RightToLeft="True" Style="direction: rtl" Visible="False" Width="100%">
        <TabPages>
            <dx:TabPage Name="msgTab" Text="نص الرسالة">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
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
                    <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
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
                        <asp:DataList ID="DataListMsg" runat="server" DataKeyField="id" DataSourceID="dsReplay" GridLines="Horizontal" Height="100%" Style="direction: rtl" Width="100%">
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
                                            <dx:ASPxHyperLink ID="lblreplyattach" runat="server" NavigateUrl='<%# Eval("replyattach", "Assets/rplyattach/{0}") %>' Text='<%# Eval("replyattach") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="الـــــــرد" valign="top">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td colspan="2" style="direction: rtl">
                                            <dx:ASPxLabel ID="lblreplydata" runat="server" EncodeHtml="False" RightToLeft="True" Text='<%# Eval("replydata") %>'>
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
                    <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxListBox ID="lbUsers" runat="server" DataSourceID="dsUsers" ReadOnly="True" RightToLeft="True" Style="direction: rtl">
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
    
            
            </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

