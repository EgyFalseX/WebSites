<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadFiles.aspx.cs" Inherits="UploadFiles" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table align="center" class="auto-style1">
                <tr>
                    <td style="text-align: center">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxUploadControl runat="server" ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="350px" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Font-Size="12pt" ID="UCFile" OnFileUploadComplete="UCFile_FileUploadComplete"  AddUploadButtonsHorizontalPosition="Center">
                            <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به" MaxFileSizeErrorText="الملف اكبر من 50 كيلوبايت برجاء رفع ملف اصغر من 50 كيلوبايت" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}">
                            </ValidationSettings>
                            <ClientSideEvents FileUploadComplete="function(s, e) {
  _aspxGetElementById('lblPath').innerHTML = e.callbackData;
}"></ClientSideEvents>
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
                            <AdvancedModeSettings TemporaryFolder="DB\UploadTemp\"></AdvancedModeSettings>
                        </dx:ASPxUploadControl>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center"><dx:ASPxLabel runat="server" ClientInstanceName="lblPath" ClientIDMode="Static" ID="lblPath" style="direction: ltr">
                </dx:ASPxLabel></td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        &nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
