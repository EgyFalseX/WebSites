<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="CreateMessage.aspx.cs" Inherits="CreateMessage" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<style type="text/css">
    
    .auto-style2
    {
        width: 91px;
        direction: ltr;
    }
</style>
<script>
    function CloseWindow() {
        //window.parent.MsgPopupControl.Hide();
        window.parent.location.reload()
    }
</script>
<form id="formmsg" runat="server">

    <table align="center" dir="rtl">
        <tr>
            <td class="auto-style2" valign="top">
                &nbsp;</td>
            <td valign="top" colspan="3">
                <dx:ASPxValidationSummary ID="ASPxValidationSummaryMain" runat="server" HorizontalAlign="Right" RightToLeft="True" ShowErrorsInEditors="True" ValidationGroup="vld" RenderMode="OrderedList" Visible="False">
                </dx:ASPxValidationSummary>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="المستخدمين">
                </dx:ASPxLabel>
            </td>
            <td valign="top" style="text-align: right">
                <dx:ASPxListBox ID="cblUsers" runat="server" DataSourceID="dsUsers" SelectionMode="CheckColumn" TextField="realname" ValueField="UserID" Width="200px">
                </dx:ASPxListBox>
                <asp:accessdatasource id="dsUsers" runat="server" datafile="../App_Data/contact.mdb" selectcommand="SELECT [UserID], [realname], [umail] FROM [Users] WHERE ([IsActive] = ?)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                </SelectParameters>
            </asp:accessdatasource>
            </td>
            <td valign="top" style="text-align: left">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="المجموعات">
                </dx:ASPxLabel>
            </td>
            <td valign="top" style="text-align: right">
                <dx:ASPxListBox ID="cblRoles" runat="server" DataSourceID="dsRoles" SelectionMode="CheckColumn" TextField="RoleName" ValueField="RoleID" Width="200px">
                </dx:ASPxListBox>
                <asp:accessdatasource id="dsRoles" runat="server" datafile="../App_Data/contact.mdb" selectcommand="SELECT [RoleID], [RoleName] FROM [Roles]"></asp:accessdatasource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="العنوان">
                </dx:ASPxLabel>
            </td>
            <td valign="top" colspan="3">
                <dx:ASPxTextBox ID="tbTitle" runat="server" Style="direction: ltr; margin-right: 0px" Width="200px" TabIndex="3">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="الرسالة">
                </dx:ASPxLabel>
            </td>
            <td valign="top" colspan="3">
                <dx:ASPxHtmlEditor ID="editor" runat="server" Style="direction: ltr" TabIndex="4" RightToLeft="True" Height="350px" Width="600px">
                    <Toolbars>
                        <dx:HtmlEditorToolbar Name="StandardToolbar1">
                            <Items>
                                <dx:ToolbarCutButton>
                                </dx:ToolbarCutButton>
                                <dx:ToolbarCopyButton>
                                </dx:ToolbarCopyButton>
                                <dx:ToolbarPasteButton>
                                </dx:ToolbarPasteButton>
                                <dx:ToolbarPasteFromWordButton>
                                </dx:ToolbarPasteFromWordButton>
                                <dx:ToolbarUndoButton BeginGroup="True">
                                </dx:ToolbarUndoButton>
                                <dx:ToolbarRedoButton>
                                </dx:ToolbarRedoButton>
                                <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                </dx:ToolbarRemoveFormatButton>
                                <dx:ToolbarSuperscriptButton BeginGroup="True">
                                </dx:ToolbarSuperscriptButton>
                                <dx:ToolbarSubscriptButton>
                                </dx:ToolbarSubscriptButton>
                                <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                </dx:ToolbarInsertOrderedListButton>
                                <dx:ToolbarInsertUnorderedListButton>
                                </dx:ToolbarInsertUnorderedListButton>
                                <dx:ToolbarIndentButton BeginGroup="True">
                                </dx:ToolbarIndentButton>
                                <dx:ToolbarOutdentButton>
                                </dx:ToolbarOutdentButton>
                                <dx:ToolbarInsertLinkDialogButton BeginGroup="True">
                                </dx:ToolbarInsertLinkDialogButton>
                                <dx:ToolbarUnlinkButton>
                                </dx:ToolbarUnlinkButton>
                                <dx:ToolbarInsertImageDialogButton>
                                </dx:ToolbarInsertImageDialogButton>
                                <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                    <Items>
                                        <dx:ToolbarInsertTableDialogButton BeginGroup="True">
                                        </dx:ToolbarInsertTableDialogButton>
                                        <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                        </dx:ToolbarTablePropertiesDialogButton>
                                        <dx:ToolbarTableRowPropertiesDialogButton>
                                        </dx:ToolbarTableRowPropertiesDialogButton>
                                        <dx:ToolbarTableColumnPropertiesDialogButton>
                                        </dx:ToolbarTableColumnPropertiesDialogButton>
                                        <dx:ToolbarTableCellPropertiesDialogButton>
                                        </dx:ToolbarTableCellPropertiesDialogButton>
                                        <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                        </dx:ToolbarInsertTableRowAboveButton>
                                        <dx:ToolbarInsertTableRowBelowButton>
                                        </dx:ToolbarInsertTableRowBelowButton>
                                        <dx:ToolbarInsertTableColumnToLeftButton>
                                        </dx:ToolbarInsertTableColumnToLeftButton>
                                        <dx:ToolbarInsertTableColumnToRightButton>
                                        </dx:ToolbarInsertTableColumnToRightButton>
                                        <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                        </dx:ToolbarSplitTableCellHorizontallyButton>
                                        <dx:ToolbarSplitTableCellVerticallyButton>
                                        </dx:ToolbarSplitTableCellVerticallyButton>
                                        <dx:ToolbarMergeTableCellRightButton>
                                        </dx:ToolbarMergeTableCellRightButton>
                                        <dx:ToolbarMergeTableCellDownButton>
                                        </dx:ToolbarMergeTableCellDownButton>
                                        <dx:ToolbarDeleteTableButton BeginGroup="True">
                                        </dx:ToolbarDeleteTableButton>
                                        <dx:ToolbarDeleteTableRowButton>
                                        </dx:ToolbarDeleteTableRowButton>
                                        <dx:ToolbarDeleteTableColumnButton>
                                        </dx:ToolbarDeleteTableColumnButton>
                                    </Items>
                                </dx:ToolbarTableOperationsDropDownButton>
                                <dx:ToolbarFullscreenButton BeginGroup="True">
                                </dx:ToolbarFullscreenButton>
                            </Items>
                        </dx:HtmlEditorToolbar>
                        <dx:HtmlEditorToolbar Name="StandardToolbar2">
                            <Items>
                                <dx:ToolbarParagraphFormattingEdit Width="120px">
                                    <Items>
                                        <dx:ToolbarListEditItem Text="Normal" Value="p" />
                                        <dx:ToolbarListEditItem Text="Heading  1" Value="h1" />
                                        <dx:ToolbarListEditItem Text="Heading  2" Value="h2" />
                                        <dx:ToolbarListEditItem Text="Heading  3" Value="h3" />
                                        <dx:ToolbarListEditItem Text="Heading  4" Value="h4" />
                                        <dx:ToolbarListEditItem Text="Heading  5" Value="h5" />
                                        <dx:ToolbarListEditItem Text="Heading  6" Value="h6" />
                                        <dx:ToolbarListEditItem Text="Address" Value="address" />
                                        <dx:ToolbarListEditItem Text="Normal (DIV)" Value="div" />
                                    </Items>
                                </dx:ToolbarParagraphFormattingEdit>
                                <dx:ToolbarFontNameEdit>
                                    <Items>
                                        <dx:ToolbarListEditItem Text="Times New Roman" Value="Times New Roman" />
                                        <dx:ToolbarListEditItem Text="Tahoma" Value="Tahoma" />
                                        <dx:ToolbarListEditItem Text="Verdana" Value="Verdana" />
                                        <dx:ToolbarListEditItem Text="Arial" Value="Arial" />
                                        <dx:ToolbarListEditItem Text="MS Sans Serif" Value="MS Sans Serif" />
                                        <dx:ToolbarListEditItem Text="Courier" Value="Courier" />
                                    </Items>
                                </dx:ToolbarFontNameEdit>
                                <dx:ToolbarFontSizeEdit>
                                    <Items>
                                        <dx:ToolbarListEditItem Text="1 (8pt)" Value="1" />
                                        <dx:ToolbarListEditItem Text="2 (10pt)" Value="2" />
                                        <dx:ToolbarListEditItem Text="3 (12pt)" Value="3" />
                                        <dx:ToolbarListEditItem Text="4 (14pt)" Value="4" />
                                        <dx:ToolbarListEditItem Text="5 (18pt)" Value="5" />
                                        <dx:ToolbarListEditItem Text="6 (24pt)" Value="6" />
                                        <dx:ToolbarListEditItem Text="7 (36pt)" Value="7" />
                                    </Items>
                                </dx:ToolbarFontSizeEdit>
                                <dx:ToolbarBoldButton BeginGroup="True">
                                </dx:ToolbarBoldButton>
                                <dx:ToolbarItalicButton>
                                </dx:ToolbarItalicButton>
                                <dx:ToolbarUnderlineButton>
                                </dx:ToolbarUnderlineButton>
                                <dx:ToolbarStrikethroughButton>
                                </dx:ToolbarStrikethroughButton>
                                <dx:ToolbarJustifyRightButton BeginGroup="True">
                                </dx:ToolbarJustifyRightButton>
                                <dx:ToolbarJustifyCenterButton>
                                </dx:ToolbarJustifyCenterButton>
                                <dx:ToolbarJustifyLeftButton>
                                </dx:ToolbarJustifyLeftButton>
                                <dx:ToolbarBackColorButton BeginGroup="True">
                                </dx:ToolbarBackColorButton>
                                <dx:ToolbarFontColorButton>
                                </dx:ToolbarFontColorButton>
                            </Items>
                        </dx:HtmlEditorToolbar>
                        <dx:HtmlEditorToolbar>
                            <Items>
                                <dx:ToolbarPrintButton>
                                </dx:ToolbarPrintButton>
                                <dx:ToolbarExportDropDownButton>
                                    <Items>
                                        <dx:ToolbarExportDropDownItem>
                                        </dx:ToolbarExportDropDownItem>
                                        <dx:ToolbarExportDropDownItem Format="Pdf">
                                        </dx:ToolbarExportDropDownItem>
                                        <dx:ToolbarExportDropDownItem Format="Txt">
                                        </dx:ToolbarExportDropDownItem>
                                        <dx:ToolbarExportDropDownItem Format="Docx">
                                        </dx:ToolbarExportDropDownItem>
                                        <dx:ToolbarExportDropDownItem Format="Odt">
                                        </dx:ToolbarExportDropDownItem>
                                        <dx:ToolbarExportDropDownItem Format="Mht">
                                        </dx:ToolbarExportDropDownItem>
                                    </Items>
                                </dx:ToolbarExportDropDownButton>
                            </Items>
                        </dx:HtmlEditorToolbar>
                    </Toolbars>
                    <Settings AllowHtmlView="False" AllowPreview="False" />
                </dx:ASPxHtmlEditor>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="المرفقات">
                </dx:ASPxLabel>
            </td>
            <td valign="top" colspan="3">
                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css" Width="280px">
                    <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" MaxFileSize="2097152" MaxFileSizeErrorText="الملف اكبر من 5 ميجا برجاء رفع ملف اصغر من 5 ميجا" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}"
                        NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به">
                    </ValidationSettings>
                    <AddButton Text="اضافه">
                    </AddButton>
                    <BrowseButton Text="اختار ملف">
                    </BrowseButton>
                    <RemoveButton Text="حذف">
                    </RemoveButton>
                    <UploadButton Text="بداء التحميــــــــــل">
                    </UploadButton>
                    <CancelButton Text="الغــــــاء">
                    </CancelButton>
                    <AdvancedModeSettings TemporaryFolder="App_Data\UploadTemp\" />
                    <Paddings Padding="2px" />
                </dx:ASPxUploadControl>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">&nbsp;</td>
            <td valign="top" colspan="3">
                <dx:ASPxButton ID="btnSend" runat="server" OnClick="btnSend_Click" Style="margin-right: 0px" Text="ارسال" Width="150px" TabIndex="5" ValidationGroup="vld">
                    <Image Height="32px" Url="Images/SendMail.png" Width="48px">
                    </Image>
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">&nbsp;</td>
            <td valign="top" colspan="3">
                <asp:accessdatasource id="dsMessages" runat="server" datafile="../App_Data/contact.mdb" deletecommand="DELETE FROM [contactdata] WHERE [msgid] = ?" insertcommand="INSERT INTO [contactdata] ([msgid], [MsgTypeId], [msgSender], [msgsenddate], [msgsubject], [msgattachpath], [msgdetials], [inbasket]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" selectcommand="SELECT [msgid], [MsgTypeId], [msgSender], [msgsenddate], [msgsubject], [msgattachpath], [msgdetials], [inbasket] FROM [contactdata]" updatecommand="UPDATE [contactdata] SET [MsgTypeId] = ?, [msgSender] = ?, [msgsenddate] = ?, [msgsubject] = ?, [msgattachpath] = ?, [msgdetials] = ?, [inbasket] = ? WHERE [msgid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="msgid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="msgid" Type="Int32" />
                    <asp:Parameter Name="MsgTypeId" Type="Byte" />
                    <asp:Parameter Name="msgSender" Type="Int32" />
                    <asp:Parameter Name="msgsenddate" Type="DateTime" />
                    <asp:Parameter Name="msgsubject" Type="String" />
                    <asp:Parameter Name="msgattachpath" Type="String" />
                    <asp:Parameter Name="msgdetials" Type="String" />
                    <asp:Parameter Name="inbasket" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MsgTypeId" Type="Byte" />
                    <asp:Parameter Name="msgSender" Type="Int32" />
                    <asp:Parameter Name="msgsenddate" Type="DateTime" />
                    <asp:Parameter Name="msgsubject" Type="String" />
                    <asp:Parameter Name="msgattachpath" Type="String" />
                    <asp:Parameter Name="msgdetials" Type="String" />
                    <asp:Parameter Name="inbasket" Type="Boolean" />
                    <asp:Parameter Name="msgid" Type="Int32" />
                </UpdateParameters>
            </asp:accessdatasource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">&nbsp;</td>
            <td valign="top" colspan="3">
            </td>
        </tr>
    </table>
</form>

