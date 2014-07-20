<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="CreateReply.aspx.cs" Inherits="CreateReply" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<style type="text/css">
    
    .auto-style2
    {
        width: 82px;
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
            <td valign="top">
                <dx:ASPxValidationSummary ID="ASPxValidationSummaryMain" runat="server" HorizontalAlign="Right" RightToLeft="True" ShowErrorsInEditors="True" ValidationGroup="vld" RenderMode="OrderedList" Visible="False">
                </dx:ASPxValidationSummary>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="الــــــــــــرد">
                </dx:ASPxLabel>
            </td>
            <td valign="top">
                <dx:ASPxHtmlEditor ID="editor" runat="server" Style="direction: ltr" TabIndex="4" RightToLeft="True" Height="350px" Width="600px">
                    <Settings AllowHtmlView="False" AllowPreview="False" />
                </dx:ASPxHtmlEditor>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="المرفقات">
                </dx:ASPxLabel>
            </td>
            <td valign="top">
                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css" Width="280px">
                    <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" MaxFileSize="1048576" MaxFileSizeErrorText="الملف اكبر من 1 ميجا برجاء رفع ملف اصغر من 1 ميجا" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

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
            <td valign="top">
                <dx:ASPxButton ID="btnSend" runat="server" OnClick="btnSend_Click" Style="margin-right: 0px" Text="ارسال" Width="150px" TabIndex="5"  ValidationGroup="vld">
                    <Image Height="32px" Url="Images/SendMail.png" Width="48px">
                    </Image>
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">&nbsp;</td>
            <td valign="top">
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
        </table>
</form>

