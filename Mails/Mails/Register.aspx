<%@ Page Title="" Language="C#" MasterPageFile="~/Mails/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 100px;
        direction: rtl;
    }
    .auto-style2
    {
        width: 301px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <table class="auto-style1" align="center">
        <tr>
            <td>
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" Font-Bold="True" Font-Size="11pt" RightToLeft="True" Theme="PlasticBlue" Width="500px">
                    <Items>
                        <dx:LayoutItem Caption="رسالة" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxValidationSummary ID="ASPxFormLayout1_E10" runat="server" Theme="PlasticBlue" ValidationGroup="gv">
                                    </dx:ASPxValidationSummary>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="اسم المستخدم">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbUserName" runat="server" Font-Bold="True" Font-Size="11pt" Theme="PlasticBlue" Width="250px">
                                        <ValidationSettings ValidationGroup="gv">
                                            <RequiredField ErrorText="من فضلك ادخل اسم المستخدم" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="كلمة المرور">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbPassword" runat="server" Font-Bold="True" Font-Size="11pt" Password="True" Theme="PlasticBlue" Width="250px">
                                        <ValidationSettings ValidationGroup="gv">
                                            <RequiredField ErrorText="من فضلك ادخل كلمة المرور" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="الاسم بالكامل">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbrealname" runat="server" Font-Bold="True" Font-Size="11pt" Theme="PlasticBlue" Width="250px">
                                        <ValidationSettings ValidationGroup="gv">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="الوظيفة">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cbtitleId" runat="server" DataSourceID="dsCDtitle" Font-Bold="True" Font-Size="11pt" TextField="titleName" Theme="PlasticBlue" ValueField="titleId" Width="250px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="الوظيفة" FieldName="titleName" />
                                        </Columns>
                                        <ValidationSettings ValidationGroup="gv">
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="الادارة">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cbudeptId" runat="server" DataSourceID="dsCDdept" Font-Bold="True" Font-Size="11pt" TextField="deptName" Theme="PlasticBlue" ValueField="deptId" Width="250px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="الادارة" FieldName="deptName" />
                                        </Columns>
                                        <ValidationSettings ValidationGroup="gv">
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="موبيل">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbmobil" runat="server" Font-Bold="True" Font-Size="11pt" Theme="PlasticBlue" Width="250px">
                                        <ValidationSettings ValidationGroup="gv">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="بريد">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbumail" runat="server" Font-Bold="True" Font-Size="11pt" Theme="PlasticBlue" Width="250px">
                                        <ValidationSettings ValidationGroup="gv">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Italic="False" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="التوقيع">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbsignture" runat="server" Font-Bold="True" Font-Size="11pt" Theme="PlasticBlue" Width="250px">
                                        <ValidationSettings ValidationGroup="gv">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="صورة" Height="100px">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" Height="103px" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css" style="direction: rtl" Width="280px">
                                        <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" MaxFileSize="1048576" MaxFileSizeErrorText="الملف اكبر من 1 ميجا برجاء رفع ملف اصغر من 1 ميجا" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به">
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
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="تسجيل" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxButton ID="btnSave" runat="server" Font-Bold="True" Font-Size="11pt" OnClick="btnSave_Click" Text="تسجيل" Theme="PlasticBlue" ValidationGroup="gv" Width="200px">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True" Font-Size="11pt">
                            </CaptionStyle>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </td>
        </tr>
        </table>
<asp:AccessDataSource ID="dsCDtitle" runat="server" DataFile="~/App_Data/contact.mdb" SelectCommand="SELECT [titleId], [titleName] FROM [CDtitle]"></asp:AccessDataSource>
<asp:AccessDataSource ID="dsCDdept" runat="server" DataFile="~/App_Data/contact.mdb" SelectCommand="SELECT [deptId], [deptName] FROM [CDdept]"></asp:AccessDataSource>
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" ClientInstanceName="msgPopup" CloseAction="None" EnableTheming="True" HeaderText="رسالة" LoadingPanelText="جاري التحميل&amp;hellip;" Modal="True" RightToLeft="True" ShowCloseButton="False" Theme="PlasticBlue" Width="366px" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle">
    <ClientSideEvents Init="function(s, e) {
	if(typeof(s.cpShowPopup) != 'undefined')
		{
				msgPopup.Show();
		} 
}" />
    <ContentCollection>
<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
    <table align="center" class="auto-style2">
        <tr>
            <td style="text-align: center">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="#006600" Text="تم التسجيل و سوف يتم تفعيل الحساب في اقرب وقت ممكن">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxButton ID="btnCloseMsg" runat="server" OnClick="btnCloseMsg_Click" Text="اغلاق">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
        </dx:PopupControlContentControl>
</ContentCollection>
</dx:ASPxPopupControl>
</asp:Content>

