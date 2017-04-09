﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/master.master" AutoEventWireup="true" CodeFile="ImportData.aspx.cs" Inherits="ImportData" %>
<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="dxflInternalEditorTable_DevEx">
    <tr>
        <td style="text-align: center">&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" Theme="iOS">
                <Items>
                    <dx:LayoutItem Caption="Import Into &quot;tblmemberbank&quot;">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxUploadControl ID="ASPxUploadControlMain" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" OnFileUploadComplete="ASPxUploadControlMain_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css" Width="280px">
                                    <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" MaxFileSize="10485760" MaxFileSizeErrorText="الملف اكبر من 10 ميجا برجاء رفع ملف اصغر من 10 ميجا" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

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
                                </dx:ASPxUploadControl>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Import" ShowCaption="True">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxButton ID="btnImport" runat="server" OnClick="btnImport_Click" Text="Import Into &quot;tblmemberbank&quot;" Width="204px">
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:ASPxFormLayout>
        </td>
    </tr>
</table>
</asp:Content>

