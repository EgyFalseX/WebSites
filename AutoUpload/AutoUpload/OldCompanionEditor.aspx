<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="OldCompanionEditor.aspx.cs" Inherits="OldCompanionEditor" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .style1
        {
            width: 411px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <div style="direction: ltr">

        <table align="center" class="style1">
            <tr>
                <td class="auto-style1" colspan="2">

                    <asp:Label ID="lblSate" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="Red"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxComboBox ID="cbSyndicateId" runat="server" DataSourceID="DSCDSyndicate" TextField="Syndicate" ValueField="SyndicateId" ValueType="System.Int32" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" AutoPostBack="True" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسماء" FieldName="Syndicate" />
                        </Columns>
                        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanelImage>
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
                <td class="auto-style1">

                    <asp:Label ID="Label1" runat="server" Text="النقابة الفرعية"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxComboBox ID="cb" runat="server" DataSourceID="DSDataOld" TextField="MemberName" ValueField="MemberId" ValueType="System.Int32" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" EnableCallbackMode="True" EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith" AutoPostBack="True" Height="27px">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسماء" FieldName="MemberName" />
                        </Columns>
                        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanelImage>
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
                <td class="auto-style1">

                    <asp:Label ID="Label2" runat="server" Text="اسماء اعضاء قديمة"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxComboBox ID="cbCompanion" runat="server" DataSourceID="DSCompanion" TextField="CompanionName" ValueField="CompanionId" ValueType="System.Int32" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" EnableCallbackMode="True" EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسماء" FieldName="CompanionName" />
                        </Columns>
                        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanelImage>
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
                <td class="auto-style1">

                    <asp:Label ID="Label3" runat="server" Text="اسماء التابعين"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    &nbsp;</td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">

                    &nbsp;</td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxUploadControl runat="server" ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="280px" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Font-Size="12pt" ID="UCFile" OnFileUploadComplete="UCFile_FileUploadComplete">
                        <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به" MaxFileSize="51200" MaxFileSizeErrorText="الملف اكبر من 50 كيلوبايت برجاء رفع ملف اصغر من 50 كيلوبايت" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}">
                        </ValidationSettings>
                        <ClientSideEvents FileUploadComplete="function(s, e) {
  _aspxGetElementById(&#39;lblPath&#39;).innerHTML = e.callbackData;
  
  myImg.SetImageUrl(&#39;Assets/Images/&#39; + e.callbackData);
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
                    <dx:ASPxLabel runat="server" ClientInstanceName="lblPath" ClientIDMode="Static" ID="lblPath" style="direction: ltr">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxImage runat="server" Width="100px" Height="100px" ClientInstanceName="myImg" ClientIDMode="Static" ID="myImg">
                    </dx:ASPxImage>
                </td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxComboBox ID="cbNew" runat="server" DataSourceID="DSData" TextField="MemberName" ValueField="MemberId" ValueType="System.Int32" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" EnableCallbackMode="True" EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith" Height="27px">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسماء" FieldName="MemberName" />
                        </Columns>
                        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanelImage>
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
                <td class="auto-style1">

                    <asp:Label ID="Label4" runat="server" Text="يضاف الي"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxButton ID="btnEdit" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" OnClick="btnEdit_Click" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="اضافة" Width="200px">
                    </dx:ASPxButton>

                </td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:AccessDataSource ID="DSCDSyndicate" runat="server" DataFile="~/App_Data/ETST.mdb"
                        SelectCommand="SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]" OnSelecting="DSCDSyndicate_Selecting">
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="DSDataOld" runat="server" DataFile="~/App_Data/ETST.mdb"
                        SelectCommand="SELECT [MemberId], [MemberName] FROM [OldTBLMembers] WHERE ([SyndicateId] = ?)
order by MemberName" OnSelecting="DSDataOld_Selecting">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cbSyndicateId" DefaultValue="0" Name="SyndicateId" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/ETST.mdb"
                        SelectCommand="SELECT [MemberId], [MemberName] FROM [TBLMembers] WHERE ([SyndicateId] = ?)
order by MemberName" OnSelecting="DSData_Selecting">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cbSyndicateId" DefaultValue="0" Name="SyndicateId" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="DSCompanion" runat="server" DataFile="~/App_Data/ETST.mdb"
                        SelectCommand="SELECT [CompanionId], [CompanionName] FROM [OldTBLCompanion] WHERE ([MemberId] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cb" DefaultValue="-100" Name="MemberId" PropertyName="Value" Type="Decimal" />
                        </SelectParameters>
                    </asp:AccessDataSource>

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








                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>

