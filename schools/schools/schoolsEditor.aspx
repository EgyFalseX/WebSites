<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="schoolsEditor.aspx.cs" Inherits="schoolsEditor" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx1" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 517px;
        }
        .auto-style2
        {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="center" class="auto-style1" dir="rtl">
        <tr>
            <td colspan="2" style="text-align: center">
                <dx:ASPxValidationSummary ID="ASPxValidationSummarygv" runat="server" Font-Bold="True" Font-Size="10pt" ValidationGroup="gv" ShowErrorsInEditors="True">
                </dx:ASPxValidationSummary>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxButton ID="btnClear" runat="server" Font-Size="12pt" OnClick="btnClear_Click" TabIndex="9" Text="جديد" Width="200px" Theme="PlasticBlue">
                </dx:ASPxButton>
            </td>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Font-Size="12pt" Text="المحافظة">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbgovid" runat="server" Font-Size="12pt" TabIndex="1" Width="250px" Theme="PlasticBlue" DataSourceID="dscdgov" TextField="gov" ValueField="govid" AutoPostBack="True">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="gov" />
                    </Columns>
                    <ValidationSettings ValidationGroup="gv">
                        <RequiredField ErrorText="يجب ادخال نوع الفعالية" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dscdgov" runat="server" DataFile="~/App_Data/schools.mdb" SelectCommand="SELECT [govid], [gov] FROM [cdgov]"></asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Font-Size="12pt" Text="المنطقة او الحي">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbhayid" runat="server" Font-Size="12pt" TabIndex="1" Width="250px" Theme="PlasticBlue" DataSourceID="dshayid" TextField="hay" ValueField="hayid">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="hay" />
                    </Columns>
                    <ValidationSettings ValidationGroup="gv">
                        <RequiredField ErrorText="يجب ادخال نوع الفعالية" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dshayid" runat="server" DataFile="~/App_Data/schools.mdb" SelectCommand="SELECT [hayid], [govid], [hay] FROM [cdhay] WHERE ([govid] = ?)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbgovid" DefaultValue="0" Name="govid" PropertyName="Value" Type="Byte" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="12pt" Text="اسم المدرسة">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxTextBox ID="tbschoolname" runat="server" Font-Size="12pt" TabIndex="2" Width="250px" Theme="PlasticBlue">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="12pt" Text="نوع المدرسة" RightToLeft="True">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbschooltypeid" runat="server" Font-Size="12pt" TabIndex="1" Width="250px" Theme="PlasticBlue" DataSourceID="dsCdSchoolType" TextField="schooltype" ValueField="schooltypeid">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="schooltype" />
                    </Columns>
                    <ValidationSettings ValidationGroup="gv">
                        <RequiredField ErrorText="يجب ادخال نوع الفعالية" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsCdSchoolType" runat="server" DataFile="~/App_Data/schools.mdb" SelectCommand="SELECT [schooltypeid], [schooltype] FROM [CdSchoolType]"></asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="12pt" Text="العنوان">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxMemo ID="tbaddress" runat="server" Font-Size="12pt" Height="50px" TabIndex="3" Width="250px" Theme="PlasticBlue">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="12pt" Text="تليفونات">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxTextBox ID="tbschooltel" runat="server" Font-Size="12pt" TabIndex="4" Width="250px" Theme="PlasticBlue">
                    <ValidationSettings ValidationGroup="gv">
                        <RequiredField ErrorText="يجب ادخال عدد الحضور" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Font-Size="12pt" Text="فاكس">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxTextBox ID="tbfax" runat="server" Font-Size="12pt" TabIndex="4" Width="250px" Theme="PlasticBlue">
                    <ValidationSettings ValidationGroup="gv">
                        <RequiredField ErrorText="يجب ادخال عدد الحضور" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Font-Size="12pt" Text="الموقع الالكتروني">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxTextBox ID="tbsite" runat="server" Font-Size="12pt" TabIndex="4" Width="250px" Theme="PlasticBlue">
                    <ValidationSettings ValidationGroup="gv">
                        <RequiredField ErrorText="يجب ادخال عدد الحضور" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Font-Size="12pt" Text="البريد الالكتروني">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxTextBox ID="tbmail" runat="server" Font-Size="12pt" TabIndex="4" Width="250px" Theme="PlasticBlue">
                    <ValidationSettings ValidationGroup="gv">
                        <RequiredField ErrorText="يجب ادخال عدد الحضور" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Size="12pt" Text="يعرض">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="cboxshowsite" runat="server" style="direction: ltr">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Font-Size="12pt" Text="صورة">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxUploadControl runat="server" ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="280px" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Font-Size="12pt" ID="UCFile" OnFileUploadComplete="UCFile_FileUploadComplete">
                    <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به" MaxFileSize="153600" MaxFileSizeErrorText="الملف اكبر من 150 كيلوبايت برجاء رفع ملف اصغر من 150 كيلوبايت" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" AllowedFileExtensions=".jpg, .jpeg, .png, .bmp, .gif">
                    </ValidationSettings>
                    <ClientSideEvents FileUploadComplete="function(s, e) {
myImg.SetImageUrl('Assets/schoolsImages/' + e.callbackData);
}">
                    </ClientSideEvents>
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
                    <AdvancedModeSettings TemporaryFolder="..\App_Data\UploadTemp\">
                    </AdvancedModeSettings>
                </dx:ASPxUploadControl>
            </td>
        </tr>
        <tr>
            <td valign="top">
                &nbsp;</td>
            <td>
                                            <dx:ASPxImage runat="server" Width="100px" Height="100px" ClientInstanceName="myImg" ClientIDMode="Static" ID="myImg"></dx:ASPxImage>

            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="btnSave" runat="server" Font-Size="12pt" OnClick="btnSave_Click" TabIndex="9" Text="حفظ" Width="200px" Theme="PlasticBlue" ValidationGroup="gv">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HiddenField ID="HFId" runat="server" />
            </td>
            <td>
                <dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server"
                    AllowDragging="True" ClientInstanceName="popupeditor"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
                    HeaderText="رسالـــه"
                    Modal="True" PopupHorizontalAlign="WindowCenter"
                    PopupVerticalAlign="WindowCenter" RightToLeft="True"
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Height="120px"
                    Width="300px" Style="text-align: center"
                    Font-Bold="False" LoadingPanelText="جاري التحميل&amp;hellip;">
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Web/dvLoading.gif">
                    </LoadingPanelImage>
                    <ClientSideEvents Init="function(s, e) {
	if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
                    <CloseButtonStyle>
                        <Paddings Padding="0px" />
                    </CloseButtonStyle>
                    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False">
                        <BorderBottom BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" />
                    </ContentStyle>
                    <HeaderStyle>
                        <Paddings PaddingLeft="10px" PaddingBottom="4px" PaddingRight="4px"
                            PaddingTop="4px" />
                    </HeaderStyle>
                    <ContentCollection>

                        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                            تم 
    التحميل
                        </dx:PopupControlContentControl>

                    </ContentCollection>
                </dx:ASPxPopupControl>

            </td>
        </tr>
    </table>
</asp:Content>

