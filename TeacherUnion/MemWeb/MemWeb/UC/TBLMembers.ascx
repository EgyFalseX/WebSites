<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TBLMembers.ascx.cs" Inherits="TBLMembers" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<style type="text/css">
    .auto-style1
    {
        text-align: right;
        width: 96px;
    }
</style>

<table align="center" style="width: 570px">
    <tr>
        <td dir="ltr" colspan="2">
            <dx:ASPxValidationSummary ID="ASPxVS" runat="server" RightToLeft="True" ShowErrorsInEditors="True" ValidationGroup="VG" Visible="False">
            </dx:ASPxValidationSummary>
        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxComboBox runat="server" ValueType="System.Int32" DataSourceID="DSSyndicateId" TextField="Syndicate" ValueField="SyndicateId" AutoPostBack="True" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="cbSyndicateId" Font-Size="12pt" Width="250px">
                <Columns>
                    <dx:ListBoxColumn FieldName="Syndicate" Caption="الاسم"></dx:ListBoxColumn>
                </Columns>

                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif"></LoadingPanelImage>

                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                    <RequiredField IsRequired="True"></RequiredField>
                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td dir="ltr" class="auto-style1">
            <dx:ASPxLabel runat="server" Text="النقابة الفرعية" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel1" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxComboBox runat="server" ValueType="System.Int32" DataSourceID="DSSubCommitteId" TextField="SubCommitte" ValueField="SubCommitteId" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="cbSubCommitteId" Font-Size="12pt" Width="250px">
                <Columns>
                    <dx:ListBoxColumn FieldName="SubCommitte" Caption="الاسم"></dx:ListBoxColumn>
                </Columns>

                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif"></LoadingPanelImage>

                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                    <RequiredField IsRequired="True"></RequiredField>
                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td dir="ltr" class="auto-style1">
            <dx:ASPxLabel runat="server" Text="اللجنة النقابية" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel2" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxTextBox runat="server" Width="250px" MaxLength="75" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="tbMemberName" Font-Size="12pt">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                    <RequiredField IsRequired="True"></RequiredField>
                </ValidationSettings>
            </dx:ASPxTextBox>

        </td>
        <td dir="ltr" class="auto-style1">
            <dx:ASPxLabel runat="server" Text="الاسم" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel3" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxComboBox runat="server" ValueType="System.Int32" DataSourceID="DSJobtitleID" TextField="Jobtitle" ValueField="JobtitleID" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="cbJobtitleID" Font-Size="12pt" Width="250px">
                <Columns>
                    <dx:ListBoxColumn FieldName="Jobtitle" Caption="الاسم"></dx:ListBoxColumn>
                </Columns>

                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif"></LoadingPanelImage>

                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                    <RequiredField IsRequired="True"></RequiredField>
                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td dir="ltr" class="auto-style1">
            <dx:ASPxLabel runat="server" Text="الوظيفة" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel10" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxDateEdit runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="deBirthDate" Font-Size="12pt" Width="250px">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                    <RequiredField IsRequired="True"></RequiredField>
                </ValidationSettings>
            </dx:ASPxDateEdit>

        </td>
        <td dir="ltr" class="auto-style1">
            <dx:ASPxLabel runat="server" Text="تاريخ الميلاد" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel4" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxDateEdit runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="deWorkeDate" Font-Size="12pt" Width="250px">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                    <RequiredField IsRequired="True"></RequiredField>
                </ValidationSettings>
            </dx:ASPxDateEdit>

        </td>
        <td dir="ltr" class="auto-style1">
            <dx:ASPxLabel runat="server" Text="تاريخ التعيين" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel9" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxComboBox runat="server" ValueType="System.Int32" DataSourceID="DSMemberqualId" TextField="qualName" ValueField="qualId" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="cbMemberqualId" Font-Size="12pt" Width="250px" AutoPostBack="True">
                <Columns>
                    <dx:ListBoxColumn FieldName="qualName" Caption="الاسم"></dx:ListBoxColumn>
                </Columns>

                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif"></LoadingPanelImage>

                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                    <RequiredField IsRequired="True"></RequiredField>
                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td dir="ltr" class="auto-style1">
            <dx:ASPxLabel runat="server" Text="المؤهل" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel5" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxComboBox runat="server" ValueType="System.Int32" DataSourceID="DSMemberSpecialization" TextField="SpecializationName" ValueField="SpecializationId" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="cbMemberSpecialization" Font-Size="12pt" Width="250px">
                <Columns>
                    <dx:ListBoxColumn FieldName="SpecializationName" Caption="الاسم"></dx:ListBoxColumn>
                </Columns>

                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif"></LoadingPanelImage>

                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                    <RequiredField IsRequired="True"></RequiredField>
                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td dir="ltr" class="auto-style1">
            <dx:ASPxLabel runat="server" Text="نوع المؤهل" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel6" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue" style="text-align: center">
            <dx:ASPxUploadControl ID="UCFile" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" OnFileUploadComplete="UCFile_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Width="280px">
                <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" MaxFileSize="51200" MaxFileSizeErrorText="الملف اكبر من 50 كيلوبايت برجاء رفع ملف اصغر من 50 كيلوبايت" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}"
                    NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به">
                </ValidationSettings>
                <ClientSideEvents FileUploadComplete="function(s, e) {
  _aspxGetElementById('lblPath').innerHTML = e.callbackData;
  
  myImg.SetImageUrl('Assets/Images/' + e.callbackData);
}" />
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
                <AdvancedModeSettings TemporaryFolder="..\App_Data\UploadTemp\" />
            </dx:ASPxUploadControl>
            <br />
            <dx:ASPxLabel ID="lblPath" runat="server" ClientIDMode="Static" ClientInstanceName="lblPath" Style="direction: ltr">
            </dx:ASPxLabel>
            <br />
            <dx:ASPxImage ID="myImg" runat="server" ClientIDMode="Static" ClientInstanceName="myImg" Height="100px" Width="100px">
            </dx:ASPxImage>
        </td>
        <td dir="ltr" style="text-align: right; vertical-align: top;">
            <dx:ASPxLabel runat="server" Text="الصوره" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel11" Font-Size="12pt"></dx:ASPxLabel>

        </td>
    </tr>
    <tr>
        <td dir="ltr" class="dxtcRightAlignCell_PlasticBlue" colspan="2">
            <dx:ASPxButton runat="server" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Text="حفظ" ValidationGroup="VG" CssPostfix="PlasticBlue" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" Width="120px" ID="btnSave" OnClick="btnSave_Click">
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td dir="ltr" style="text-align: center" colspan="2">&nbsp;</td>
    </tr>

</table>
<asp:SqlDataSource ID="DSSyndicateId" runat="server" ConnectionString="<%$ ConnectionStrings:MemberWebConnectionString %>" SelectCommand="SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]"></asp:SqlDataSource>
<asp:SqlDataSource ID="DSSubCommitteId" runat="server" ConnectionString="<%$ ConnectionStrings:MemberWebConnectionString %>" SelectCommand="SELECT [SubCommitteId], [SubCommitte], [SyndicateId] FROM [CDSubCommitte] WHERE ([SyndicateId] = @SyndicateId)">
    <SelectParameters>
        <asp:ControlParameter ControlID="cbSyndicateId" Name="SyndicateId" PropertyName="Value" Type="Int32" DefaultValue="0" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="DSJobtitleID" runat="server" ConnectionString="<%$ ConnectionStrings:MemberWebConnectionString %>" SelectCommand="SELECT [JobtitleID], [Jobtitle] FROM [CDJobtitle]"></asp:SqlDataSource>
<asp:SqlDataSource ID="DSMemberqualId" runat="server" ConnectionString="<%$ ConnectionStrings:MemberWebConnectionString %>" SelectCommand="SELECT [qualId], [qualName] FROM [CDQualification]"></asp:SqlDataSource>
<asp:SqlDataSource ID="DSMemberSpecialization" runat="server" ConnectionString="<%$ ConnectionStrings:MemberWebConnectionString %>" SelectCommand="SELECT [qualId], [SpecializationId], [SpecializationName] FROM [CDSpecialization] WHERE ([qualId] = @qualId)">
    <SelectParameters>
        <asp:ControlParameter ControlID="cbMemberqualId" DefaultValue="0" Name="qualId" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server"
    AllowDragging="True" ClientInstanceName="popupeditor"
    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
    HeaderText="رسالـــه"
    Modal="True" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Height="120px"
    Width="300px" Style="text-align: center"
    Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/dvLoading.gif">
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



