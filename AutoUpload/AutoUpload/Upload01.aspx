<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="Upload01.aspx.cs" Inherits="Upload01" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        .auto-style2 {
            text-align: center;
        }
.dxucControl_PlasticBlue,
.dxucEditArea_PlasticBlue
{
	font: 12px Tahoma;
}
.dxucTextBox_PlasticBlue
{
	background-color: white;
	border: 1px solid #B8B8B8;
	padding: 1px 2px;
}
.dxucTextBox_PlasticBlue .dxucEditArea_PlasticBlue
{
	margin: 0px;
	background-color: white;
}

.dxWeb_ucClearButton_PlasticBlue {
    background-position: -100px -112px;
    width: 16px;
    height: 16px;
}
.dxWeb_rpHeaderTopLeftCorner_PlasticBlue,
.dxWeb_rpHeaderTopRightCorner_PlasticBlue,
.dxWeb_rpBottomLeftCorner_PlasticBlue,
.dxWeb_rpBottomRightCorner_PlasticBlue,
.dxWeb_rpTopLeftCorner_PlasticBlue,
.dxWeb_rpTopRightCorner_PlasticBlue,
.dxWeb_rpGroupBoxBottomLeftCorner_PlasticBlue,
.dxWeb_rpGroupBoxBottomRightCorner_PlasticBlue,
.dxWeb_rpGroupBoxTopLeftCorner_PlasticBlue,
.dxWeb_rpGroupBoxTopRightCorner_PlasticBlue,
.dxWeb_mHorizontalPopOut_PlasticBlue,
.dxWeb_mVerticalPopOut_PlasticBlue,
.dxWeb_mVerticalPopOutRtl_PlasticBlue,
.dxWeb_mSubMenuItem_PlasticBlue,
.dxWeb_mSubMenuItemChecked_PlasticBlue,
.dxWeb_mScrollUp_PlasticBlue,
.dxWeb_mScrollDown_PlasticBlue,
.dxWeb_tcScrollLeft_PlasticBlue,
.dxWeb_tcScrollRight_PlasticBlue,
.dxWeb_tcScrollLeftHover_PlasticBlue,
.dxWeb_tcScrollRightHover_PlasticBlue,
.dxWeb_tcScrollLeftPressed_PlasticBlue,
.dxWeb_tcScrollRightPressed_PlasticBlue,
.dxWeb_tcScrollLeftDisabled_PlasticBlue,
.dxWeb_tcScrollRightDisabled_PlasticBlue,
.dxWeb_nbCollapse_PlasticBlue,
.dxWeb_nbExpand_PlasticBlue,
.dxWeb_nbItemBullet_PlasticBlue,
.dxWeb_splVSeparator_PlasticBlue,
.dxWeb_splVSeparatorHover_PlasticBlue,
.dxWeb_splHSeparator_PlasticBlue,
.dxWeb_splHSeparatorHover_PlasticBlue,
.dxWeb_splVCollapseBackwardButton_PlasticBlue,
.dxWeb_splVCollapseBackwardButtonHover_PlasticBlue,
.dxWeb_splHCollapseBackwardButton_PlasticBlue,
.dxWeb_splHCollapseBackwardButtonHover_PlasticBlue,
.dxWeb_splVCollapseForwardButton_PlasticBlue,
.dxWeb_splVCollapseForwardButtonHover_PlasticBlue,
.dxWeb_splHCollapseForwardButton_PlasticBlue,
.dxWeb_splHCollapseForwardButtonHover_PlasticBlue,
.dxWeb_pcCloseButton_PlasticBlue,
.dxWeb_pcPinButton_PlasticBlue,
.dxWeb_pcRefreshButton_PlasticBlue,
.dxWeb_pcCollapseButton_PlasticBlue,
.dxWeb_pcMaximizeButton_PlasticBlue,
.dxWeb_pcSizeGrip_PlasticBlue,
.dxWeb_pcSizeGripRtl_PlasticBlue,
.dxWeb_pPopOut_PlasticBlue,
.dxWeb_pPopOutDisabled_PlasticBlue,
.dxWeb_pAll_PlasticBlue,
.dxWeb_pAllDisabled_PlasticBlue,
.dxWeb_pPrev_PlasticBlue,
.dxWeb_pPrevDisabled_PlasticBlue,
.dxWeb_pNext_PlasticBlue,
.dxWeb_pNextDisabled_PlasticBlue,
.dxWeb_pLast_PlasticBlue,
.dxWeb_pLastDisabled_PlasticBlue,
.dxWeb_pFirst_PlasticBlue,
.dxWeb_pFirstDisabled_PlasticBlue,
.dxWeb_tiBackToTop_PlasticBlue,
.dxWeb_smSecondLevelBullet_PlasticBlue,
.dxWeb_smThirdLevelBullet_PlasticBlue,
.dxWeb_tvColBtn_PlasticBlue,
.dxWeb_tvColBtnRtl_PlasticBlue,
.dxWeb_tvExpBtn_PlasticBlue,
.dxWeb_tvExpBtnRtl_PlasticBlue,
.dxWeb_fmFolder_PlasticBlue,
.dxWeb_fmFolderLocked_PlasticBlue,
.dxWeb_fmCreateButton_PlasticBlue,
.dxWeb_fmMoveButton_PlasticBlue,
.dxWeb_fmRenameButton_PlasticBlue,
.dxWeb_fmDeleteButton_PlasticBlue,
.dxWeb_fmRefreshButton_PlasticBlue,
.dxWeb_fmDwnlButton_PlasticBlue,
.dxWeb_fmCreateButtonDisabled_PlasticBlue,
.dxWeb_fmMoveButtonDisabled_PlasticBlue,
.dxWeb_fmRenameButtonDisabled_PlasticBlue,
.dxWeb_fmDeleteButtonDisabled_PlasticBlue,
.dxWeb_fmRefreshButtonDisabled_PlasticBlue,
.dxWeb_fmDwnlButtonDisabled_PlasticBlue,
.dxWeb_ucClearButton_PlasticBlue,
.dxWeb_ucClearButtonDisabled_PlasticBlue,
.dxWeb_isPrevBtnHor_PlasticBlue,
.dxWeb_isNextBtnHor_PlasticBlue,
.dxWeb_isPrevBtnVert_PlasticBlue,
.dxWeb_isNextBtnVert_PlasticBlue,
.dxWeb_isPrevPageBtnHor_PlasticBlue,
.dxWeb_isNextPageBtnHor_PlasticBlue,
.dxWeb_isPrevPageBtnVert_PlasticBlue,
.dxWeb_isNextPageBtnVert_PlasticBlue,
.dxWeb_isPrevBtnHorDisabled_PlasticBlue,
.dxWeb_isNextBtnHorDisabled_PlasticBlue,
.dxWeb_isPrevBtnVertDisabled_PlasticBlue,
.dxWeb_isNextBtnVertDisabled_PlasticBlue,
.dxWeb_isPrevPageBtnHorDisabled_PlasticBlue,
.dxWeb_isNextPageBtnHorDisabled_PlasticBlue,
.dxWeb_isPrevPageBtnVertDisabled_PlasticBlue,
.dxWeb_isNextPageBtnVertDisabled_PlasticBlue,
.dxWeb_isDot_PlasticBlue,
.dxWeb_isDotDisabled_PlasticBlue,
.dxWeb_isDotSelected_PlasticBlue,
.dxWeb_fmGvHeaderFilterActive_PlasticBlue,
.dxWeb_fmGvHeaderFilter_PlasticBlue,
.dxWeb_fmGvHeaderSortDown_PlasticBlue,
.dxWeb_fmGvHeaderSortUp_PlasticBlue,
.dxWeb_fmThumbnailCheck_PlasticBlue
{
    background-image: url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.PlasticBlue.Web.sprite.png")%>');
    -background-image: url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.PlasticBlue.Web.sprite.gif")%>'); /* for IE6 */
    background-repeat: no-repeat;
    background-color: transparent;
    display:block;
}
.dxucBrowseButton_PlasticBlue
{
	padding: 3px 11px 4px;
	border: 1px solid #B8B8B8;
	background: #E5E5E5 url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.PlasticBlue.Web.ucButtonBack.gif")%>') left top;
}
.dxucBrowseButton_PlasticBlue,
.dxucBrowseButton_PlasticBlue a
{
	color: Black;
	cursor: pointer;
	white-space: nowrap;
	text-decoration: none;
}
.dxucControl_PlasticBlue .dxucBrowseButton_PlasticBlue a
{
	color: Black;
}
.dxucButton_PlasticBlue,
.dxucButton_PlasticBlue a,
.dxucButton_PlasticBlue a:hover
{
	color: #5A83D0;
	white-space: nowrap;
}
.dxucProgressBar_PlasticBlue
{
	border: 1px Solid #B8B8B8;
	background-color: #F5F5F5;
}
.dxucProgressBarIndicator_PlasticBlue
{
	background: #3E5496 url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.PlasticBlue.Web.ucProgressIndicatorBack.gif")%>') repeat-x;
}
        .auto-style3 {
            display: inline;
            text-decoration: none;
            border-width: 0px;
            background-image: url('mvwres://DevExpress.Web.ASPxThemes.v12.2,%20Version=12.2.6.0,%20Culture=neutral,%20PublicKeyToken=b88d1754d700e49a/DevExpress.Web.ASPxThemes.App_Themes.PlasticBlue.Web.sprite.gif');
        }
        .auto-style4 {
            height: 21px;
            width: 100%;
            border-collapse: separate;
            font-style: normal;
            font-variant: normal;
            font-weight: normal;
            font-size: 12px;
            line-height: normal;
            font-family: Tahoma;
            color: #000000;
        }
    .dxeBase
{
	font: 12px Tahoma;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxUploadControl runat="server" ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="280px" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Font-Size="12pt" ID="UCFile" OnFileUploadComplete="UCFile_FileUploadComplete">
                    <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به" MaxFileSize="51200" MaxFileSizeErrorText="الملف اكبر من 50 كيلوبايت برجاء رفع ملف اصغر من 50 كيلوبايت" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}">
                    </ValidationSettings>
                    <ClientSideEvents FileUploadComplete="function(s, e) {
  _aspxGetElementById('lblPath').innerHTML = e.callbackData;
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
            <td class="auto-style2">
                <dx:ASPxLabel runat="server" ClientInstanceName="lblPath" ClientIDMode="Static" ID="lblPath" style="direction: ltr">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
</asp:Content>

