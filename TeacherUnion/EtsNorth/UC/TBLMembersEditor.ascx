<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TBLMembersEditor.ascx.cs" Inherits="TBLMembersEditor" %>
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
        width: 641px;
    }

    .auto-style2
    {
        height: 25px;
    }

    .auto-style3
    {
        text-align: right;
        height: 25px;
    }

    .auto-style4
    {
        height: 27px;
        text-align: center;
    }
</style>

<table class="auto-style1" dir="rtl" align="center">
    <tr>
        <td colspan="4">
            <dx:ASPxValidationSummary ID="ASPxVS" runat="server" RightToLeft="True" ShowErrorsInEditors="True" ValidationGroup="VG" Visible="False">
            </dx:ASPxValidationSummary>

        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel runat="server" Text="الاسم" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel1"></dx:ASPxLabel>

        </td>
        <td class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxTextBox runat="server" Width="170px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="tbMemberName" MaxLength="200">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxTextBox>

        </td>
        <td>
            <dx:ASPxLabel runat="server" Text="تاريخ الميلاد" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel2"></dx:ASPxLabel>

        </td>
        <td class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxDateEdit runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="deBirthDate" TabIndex="1">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxDateEdit>

        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel runat="server" Text="المؤهل" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel3"></dx:ASPxLabel>

        </td>
        <td class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxComboBox runat="server" ValueType="System.Int32" DataSourceID="DSMemberqualId" TextField="qualName" ValueField="qualId" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="cbMemberqualId" TabIndex="2">
                <Columns>
                    <dx:ListBoxColumn FieldName="qualName" Caption="الاسم"></dx:ListBoxColumn>
                </Columns>

                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif"></LoadingPanelImage>

                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td>
            <dx:ASPxLabel runat="server" Text="تاريخ المؤهل" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel4"></dx:ASPxLabel>

        </td>
        <td class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxDateEdit runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="dequalDate" TabIndex="3">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxDateEdit>

        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel runat="server" Text="الوظيفة" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel5"></dx:ASPxLabel>

        </td>
        <td class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxComboBox runat="server" ValueType="System.Int32" DataSourceID="DSJobtitleID" TextField="Jobtitle" ValueField="JobtitleID" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="cbJobtitleID" TabIndex="4">
                <Columns>
                    <dx:ListBoxColumn FieldName="Jobtitle" Caption="الاسم"></dx:ListBoxColumn>
                </Columns>

                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif"></LoadingPanelImage>

                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td>
            <dx:ASPxLabel runat="server" Text="تاريخ التعيين" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel6"></dx:ASPxLabel>

        </td>
        <td class="dxtcRightAlignCell_PlasticBlue">
            <dx:ASPxDateEdit runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="deWorkeDate" TabIndex="5">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxDateEdit>

        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxLabel runat="server" Text="العنوان" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel7"></dx:ASPxLabel>

        </td>
        <td class="dxtcRightAlignCell_PlasticBlue" colspan="3">
            <dx:ASPxTextBox runat="server" Width="300px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="tbMemberaddres" TabIndex="6">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxTextBox>

        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <dx:ASPxLabel runat="server" Text="موبيل" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel9"></dx:ASPxLabel>

        </td>
        <td class="auto-style3">
            <dx:ASPxTextBox runat="server" Width="170px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="tbMemberMobil" MaxLength="50" TabIndex="7">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxTextBox>

        </td>
        <td class="auto-style2">
            <dx:ASPxLabel runat="server" Text="تليفون" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="ASPxLabel10"></dx:ASPxLabel>

        </td>
        <td class="auto-style3">
            <dx:ASPxTextBox runat="server" Width="170px" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" ID="tbMemberPhone" MaxLength="50" TabIndex="8">
                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>

                </ValidationSettings>
            </dx:ASPxTextBox>

        </td>
    </tr>
    <tr>
        <td colspan="4">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4" colspan="4">
            <dx:ASPxButton runat="server" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="حفظ" ValidationGroup="VG" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Width="150px" ID="btnSave" OnClick="btnSave_Click" TabIndex="9">
            </dx:ASPxButton>

        </td>
    </tr>
</table>
<asp:SqlDataSource ID="DSMemberqualId" runat="server" ConnectionString="<%$ ConnectionStrings:EtsNorthConnectionString %>" SelectCommand="SELECT [qualId], [qualName] FROM [CDQualification]"></asp:SqlDataSource>
<asp:SqlDataSource ID="DSJobtitleID" runat="server" ConnectionString="<%$ ConnectionStrings:EtsNorthConnectionString %>" SelectCommand="SELECT [JobtitleID], [Jobtitle] FROM [CDJobtitle]"></asp:SqlDataSource>

<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server"
    AllowDragging="True" ClientInstanceName="popupeditor"
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
    HeaderText="رسالـــه"
    Modal="True" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Height="120px"
    Width="300px" Style="text-align: center"
    Font-Bold="False">
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



