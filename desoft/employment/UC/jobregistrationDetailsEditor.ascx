<%@ Control Language="C#" AutoEventWireup="true" CodeFile="jobregistrationDetailsEditor.ascx.cs"
    Inherits="jobregistrationDetailsEditor" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<style type="text/css">
    .style1
    {
        width: 850px;
    }
    .style2
    {
        text-align: right;
    }
    .style3
    {
        width: 225px;
    }
    .style4
    {
        width: 141px;
    }
    .style5
    {
        text-align: right;
        width: 141px;
    }
    .style7
    {
        text-align: right;
        width: 256px;
    }
    .style8
    {
        text-align: right;
        width: 111px;
    }
    .style9
    {
        text-align: right;
        width: 134px;
    }
    .style10
    {
        text-align: right;
        width: 114px;
    }
</style>
    
<table align="center">
    <tr>
        <td style="text-align: center; direction: rtl;">
            <dx:ASPxLabel ID="lblTitle" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" Font-Names="Andalus" Font-Size="X-Large" 
                ForeColor="Gray" Text="استمارة التقدم لوظيفة " Wrap="False">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <dx:ASPxValidationSummary ID="ASPxValidationSummaryMain" runat="server" ShowErrorsInEditors="True"
                ValidationGroup="errorGrp" RightToLeft="True">
            </dx:ASPxValidationSummary>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" BackColor="White" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px"
                GroupBoxCaptionOffsetY="-19px" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                Style="text-align: center" Width="200px">
                <ContentPaddings PaddingBottom="10px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="10px" />
                <HeaderStyle BackColor="#DEDEDE">
                    <Paddings PaddingBottom="6px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="1px" />
                    <BorderLeft BorderStyle="None" />
                    <BorderRight BorderStyle="None" />
                    <BorderBottom BorderStyle="None" />
                </HeaderStyle>
                <TopLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopLeftCorner.png"
                    Width="5px">
                </TopLeftCorner>
                <NoHeaderTopLeftCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopLeftCorner.png"
                    Width="5px">
                </NoHeaderTopLeftCorner>
                <TopRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopRightCorner.png"
                    Width="5px">
                </TopRightCorner>
                <NoHeaderTopRightCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopRightCorner.png"
                    Width="5px">
                </NoHeaderTopRightCorner>
                <BottomRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomRightCorner.png"
                    Width="5px">
                </BottomRightCorner>
                <BottomLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomLeftCorner.png"
                    Width="5px">
                </BottomLeftCorner>
                <HeaderLeftEdge>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderLeftEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderLeftEdge>
                <HeaderContent>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderContent.png"
                        Repeat="RepeatX" VerticalPosition="bottom" />
                </HeaderContent>
                <HeaderRightEdge>
                    <BackgroundImage HorizontalPosition="right" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderRightEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderRightEdge>
                <HeaderTemplate>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                        CssPostfix="DevEx" Font-Names="Andalus" Font-Size="X-Large" ForeColor="Gray"
                        Style="direction: rtl" Text="البيانـــات الاساسيــــــــــه">
                    </dx:ASPxLabel>
                </HeaderTemplate>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                        <table align="center" class="style1" dir="rtl" style="border-style: solid">
                            <tr>
                                <td style="text-align: right" class="style4">
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="الرقم القومي : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style7">
                                    <dx:ASPxTextBox ID="tbnationalid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" 
                                        Width="200px" TabIndex="1">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style8">
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="الوظيفـــــــه : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style2">
                                    <dx:ASPxComboBox ID="cbadvid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                        Width="200px" TabIndex="2" TextField="advsubject" 
                                        ValueField="advid">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="الوظيفه" FieldName="advsubject" />
                                        </Columns>
                                        <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <LoadingPanelStyle ImageSpacing="5px">
                                        </LoadingPanelStyle>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="الاســـم (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style7">
                                    <dx:ASPxTextBox ID="tbempname" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="2">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل اسمك" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style8">
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="الجنسيـــــــه : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style2">
                                    <dx:ASPxComboBox ID="cbnationalityid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                        Width="200px" TabIndex="3" TextField="nationality"
                                        ValueField="nationalityid">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="اختار جنسيـــه" FieldName="nationality" />
                                        </Columns>
                                        <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <LoadingPanelStyle ImageSpacing="5px">
                                        </LoadingPanelStyle>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="الحاله الاجتماعيـــه (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style7">
                                    <dx:ASPxComboBox ID="cbempstat" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                        Width="200px" TabIndex="4" TextField="state" ValueField="empstat">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="اختار حالــــــه" FieldName="state" />
                                        </Columns>
                                        <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <LoadingPanelStyle ImageSpacing="5px">
                                        </LoadingPanelStyle>
                                        <ValidationSettings ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="اختار حالتك الاجتماعيه" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="style8">
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="تاريخ الميـــــلاد (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style2">
                                    <dx:ASPxDateEdit ID="debirth" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" DisplayFormatString="d/M/yyyy" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                        Width="200px" TabIndex="5">
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                        </CalendarProperties>
                                        <ValidationSettings ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل تاريخ ميلادك" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="العنـــــوان الدائـــم (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style7">
                                    <dx:ASPxTextBox ID="tbaddres" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="6">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل عنوانك" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style8">
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="مكــان الميـــــلاد : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style2">
                                    <dx:ASPxTextBox ID="tbbirthplace" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="7">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="بريد الكتروني (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style7">
                                    <dx:ASPxTextBox ID="tbemail" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="8">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل بريدك الذي سيتم التواصل من خلاله" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style8">
                                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="هاتف رقــــــــم : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style2">
                                    <dx:ASPxTextBox ID="tbtel" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="9">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="مـــوبيـــــل (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td class="style7">
                                    <dx:ASPxTextBox ID="tbmobil" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="10">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل موبيلك الذي سيتم التواصل من خلاله" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style8">
                                    &nbsp;
                                </td>
                                <td class="style2">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
                <Border BorderColor="#8B8B8B" BorderStyle="Solid" BorderWidth="1px" />
            </dx:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" BackColor="White" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px"
                GroupBoxCaptionOffsetY="-19px" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                Style="text-align: center" Width="200px" TabIndex="10">
                <ContentPaddings PaddingBottom="10px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="10px" />
                <HeaderStyle BackColor="#DEDEDE">
                    <Paddings PaddingBottom="6px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="1px" />
                    <BorderLeft BorderStyle="None" />
                    <BorderRight BorderStyle="None" />
                    <BorderBottom BorderStyle="None" />
                </HeaderStyle>
                <TopLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopLeftCorner.png"
                    Width="5px">
                </TopLeftCorner>
                <NoHeaderTopLeftCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopLeftCorner.png"
                    Width="5px">
                </NoHeaderTopLeftCorner>
                <TopRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopRightCorner.png"
                    Width="5px">
                </TopRightCorner>
                <NoHeaderTopRightCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopRightCorner.png"
                    Width="5px">
                </NoHeaderTopRightCorner>
                <BottomRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomRightCorner.png"
                    Width="5px">
                </BottomRightCorner>
                <BottomLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomLeftCorner.png"
                    Width="5px">
                </BottomLeftCorner>
                <HeaderLeftEdge>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderLeftEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderLeftEdge>
                <HeaderContent>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderContent.png"
                        Repeat="RepeatX" VerticalPosition="bottom" />
                </HeaderContent>
                <HeaderRightEdge>
                    <BackgroundImage HorizontalPosition="right" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderRightEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderRightEdge>
                <HeaderTemplate>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                        CssPostfix="DevEx" Font-Names="Andalus" Font-Size="X-Large" ForeColor="Gray"
                        Style="direction: rtl" Text="المؤهـــــــل العلمـــــــــــي">
                    </dx:ASPxLabel>
                </HeaderTemplate>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                        <table align="center" class="style1" dir="rtl" style="border-style: solid">
                            <tr>
                                <td class="style10">
                                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="جهة الدراســــــه (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="tbgeha" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" 
                                        Width="200px" TabIndex="11">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل جهة الدراســـه" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style9">
                                    <dx:ASPxLabel ID="ASPxLabel16" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="التخصــــــــــص (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="tbspecial" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="12">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل تخصصك" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style10">
                                    <dx:ASPxLabel ID="ASPxLabel15" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="سنــــة التخــــــــرج (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="tbyeart" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="13">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل سنة التخــــرج" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style9">
                                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="المؤهـــــــــــل الدراســـي (*) : ">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="tbmoahel" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="200px"
                                        TabIndex="14">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                            <RequiredField IsRequired="True" ErrorText="ادخل مؤهلك الدراسي" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
                <Border BorderColor="#8B8B8B" BorderStyle="Solid" BorderWidth="1px" />
            </dx:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" BackColor="White" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px"
                GroupBoxCaptionOffsetY="-19px" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                Style="text-align: center" Width="200px" TabIndex="15">
                <ContentPaddings PaddingBottom="10px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="10px" />
                <HeaderStyle BackColor="#DEDEDE">
                    <Paddings PaddingBottom="6px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="1px" />
                    <BorderLeft BorderStyle="None" />
                    <BorderRight BorderStyle="None" />
                    <BorderBottom BorderStyle="None" />
                </HeaderStyle>
                <TopLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopLeftCorner.png"
                    Width="5px">
                </TopLeftCorner>
                <NoHeaderTopLeftCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopLeftCorner.png"
                    Width="5px">
                </NoHeaderTopLeftCorner>
                <TopRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopRightCorner.png"
                    Width="5px">
                </TopRightCorner>
                <NoHeaderTopRightCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopRightCorner.png"
                    Width="5px">
                </NoHeaderTopRightCorner>
                <BottomRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomRightCorner.png"
                    Width="5px">
                </BottomRightCorner>
                <BottomLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomLeftCorner.png"
                    Width="5px">
                </BottomLeftCorner>
                <HeaderLeftEdge>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderLeftEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderLeftEdge>
                <HeaderContent>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderContent.png"
                        Repeat="RepeatX" VerticalPosition="bottom" />
                </HeaderContent>
                <HeaderRightEdge>
                    <BackgroundImage HorizontalPosition="right" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderRightEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderRightEdge>
                <HeaderTemplate>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                        CssPostfix="DevEx" Font-Names="Andalus" Font-Size="X-Large" ForeColor="Gray"
                        Style="direction: rtl" Text="الدورات التدريبيــــــــه">
                    </dx:ASPxLabel>
                </HeaderTemplate>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                        <table align="center" class="style1" dir="rtl" style="border-style: solid">
                            <tr>
                                <td style="text-align: center" valign="top">
                                    <dx:ASPxMemo ID="tbdtraining" runat="server" Height="150px" Width="500px" 
                                        TabIndex="16">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
                <Border BorderColor="#8B8B8B" BorderStyle="Solid" BorderWidth="1px" />
            </dx:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" BackColor="White" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px"
                GroupBoxCaptionOffsetY="-19px" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                Style="text-align: center" Width="200px" TabIndex="17">
                <ContentPaddings PaddingBottom="10px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="10px" />
                <HeaderStyle BackColor="#DEDEDE">
                    <Paddings PaddingBottom="6px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="1px" />
                    <BorderLeft BorderStyle="None" />
                    <BorderRight BorderStyle="None" />
                    <BorderBottom BorderStyle="None" />
                </HeaderStyle>
                <TopLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopLeftCorner.png"
                    Width="5px">
                </TopLeftCorner>
                <NoHeaderTopLeftCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopLeftCorner.png"
                    Width="5px">
                </NoHeaderTopLeftCorner>
                <TopRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopRightCorner.png"
                    Width="5px">
                </TopRightCorner>
                <NoHeaderTopRightCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopRightCorner.png"
                    Width="5px">
                </NoHeaderTopRightCorner>
                <BottomRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomRightCorner.png"
                    Width="5px">
                </BottomRightCorner>
                <BottomLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomLeftCorner.png"
                    Width="5px">
                </BottomLeftCorner>
                <HeaderLeftEdge>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderLeftEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderLeftEdge>
                <HeaderContent>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderContent.png"
                        Repeat="RepeatX" VerticalPosition="bottom" />
                </HeaderContent>
                <HeaderRightEdge>
                    <BackgroundImage HorizontalPosition="right" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderRightEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderRightEdge>
                <HeaderTemplate>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                        CssPostfix="DevEx" Font-Names="Andalus" Font-Size="X-Large" ForeColor="Gray"
                        Style="direction: rtl" Text="اخر الخبــــــره العلميـــــــــــه">
                    </dx:ASPxLabel>
                </HeaderTemplate>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                        <table align="center" class="style1" dir="rtl" style="border-style: solid">
                            <tr>
                                <td style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel19" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="مسمي وظيفي #1">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBjop1" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" 
                                        Width="150px" TabIndex="18">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel20" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="جهة العمل #1">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBgeha1" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="150px"
                                        TabIndex="19">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style3" style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="تاريخ ترك الوظيفه #1">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxDateEdit ID="deBdate1" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" DisplayFormatString="d/M/yyyy" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                        Width="150px" TabIndex="20">
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                        </CalendarProperties>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td class="style2" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel28" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="الراتب #1">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBsalary1" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="60px"
                                        TabIndex="21">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style2" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel31" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="سبب ترك العمل #1">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxMemo ID="tbBreson1" runat="server" Height="71px" Width="170px" 
                                        TabIndex="22">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel21" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="مسمي وظيفي #2">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBjop2" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="150px"
                                        TabIndex="23">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel22" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="جهة العمل #2">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBgeha2" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" 
                                        Width="150px" TabIndex="24">
                                        <ValidationSettings ErrorText="قيمه خاطئه" ValidationGroup="errorGrp">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style3" style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel26" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="تاريخ ترك الوظيفه #1">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxDateEdit ID="deBdate2" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" DisplayFormatString="d/M/yyyy" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                        Width="150px" TabIndex="25">
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                        </CalendarProperties>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td class="style2" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel29" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="الراتب #2">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBsalary2" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="60px"
                                        TabIndex="26">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style2" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel32" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="سبب ترك العمل #2">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxMemo ID="tbBreson2" runat="server" Height="71px" Width="170px" 
                                        TabIndex="27">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel23" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="مسمي وظيفي #3">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBjop3" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="150px"
                                        TabIndex="28">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel24" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="جهة العمل #3">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBgeha3" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="150px"
                                        TabIndex="29">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style3" style="text-align: right" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel27" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="تاريخ ترك الوظيفه #1">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxDateEdit ID="deBdate3" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" DisplayFormatString="d/M/yyyy" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                        Width="150px" TabIndex="30">
                                        <CalendarProperties>
                                            <HeaderStyle Spacing="1px" />
                                        </CalendarProperties>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td class="style2" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel30" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="الراتب #3">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxTextBox ID="tbBsalary3" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="60px"
                                        TabIndex="31">
                                        <ValidationSettings ErrorText="قيمه خاطئه">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="style2" valign="top">
                                    <dx:ASPxLabel ID="ASPxLabel33" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                        CssPostfix="DevEx" Text="سبب ترك العمل #3">
                                    </dx:ASPxLabel>
                                    <br />
                                    <br />
                                    <dx:ASPxMemo ID="tbBreson3" runat="server" Height="71px" Width="170px" 
                                        TabIndex="32">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
                <Border BorderColor="#8B8B8B" BorderStyle="Solid" BorderWidth="1px" />
            </dx:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" BackColor="White" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" EnableDefaultAppearance="False" GroupBoxCaptionOffsetX="6px"
                GroupBoxCaptionOffsetY="-19px" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                Style="text-align: center" Width="200px" TabIndex="33">
                <ContentPaddings PaddingBottom="10px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="10px" />
                <HeaderStyle BackColor="#DEDEDE">
                    <Paddings PaddingBottom="6px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="1px" />
                    <BorderLeft BorderStyle="None" />
                    <BorderRight BorderStyle="None" />
                    <BorderBottom BorderStyle="None" />
                </HeaderStyle>
                <TopLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopLeftCorner.png"
                    Width="5px">
                </TopLeftCorner>
                <NoHeaderTopLeftCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopLeftCorner.png"
                    Width="5px">
                </NoHeaderTopLeftCorner>
                <TopRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/TopRightCorner.png"
                    Width="5px">
                </TopRightCorner>
                <NoHeaderTopRightCorner Height="5px" Url="~/Images/ASPxRoundPanel/121496004/NoHeaderTopRightCorner.png"
                    Width="5px">
                </NoHeaderTopRightCorner>
                <BottomRightCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomRightCorner.png"
                    Width="5px">
                </BottomRightCorner>
                <BottomLeftCorner Height="5px" Url="../Images/ASPxRoundPanel/121496004/BottomLeftCorner.png"
                    Width="5px">
                </BottomLeftCorner>
                <HeaderLeftEdge>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderLeftEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderLeftEdge>
                <HeaderContent>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderContent.png"
                        Repeat="RepeatX" VerticalPosition="bottom" />
                </HeaderContent>
                <HeaderRightEdge>
                    <BackgroundImage HorizontalPosition="right" ImageUrl="../Images/ASPxRoundPanel/121496004/HeaderRightEdge.png"
                        Repeat="NoRepeat" VerticalPosition="bottom" />
                </HeaderRightEdge>
                <HeaderTemplate>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                        CssPostfix="DevEx" Font-Names="Andalus" Font-Size="X-Large" ForeColor="Gray"
                        Style="direction: rtl" Text="الــــــــــــــــرد">
                    </dx:ASPxLabel>
                </HeaderTemplate>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                        <table align="center" class="style1" dir="rtl" style="border-style: solid">
                            <tr>
                                <td style="text-align: center" valign="top">
                                    <dx:ASPxMemo ID="tbreplymail" runat="server" Height="150px" Width="500px" 
                                        TabIndex="34">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
                <Border BorderColor="#8B8B8B" BorderStyle="Solid" BorderWidth="1px" />
            </dx:ASPxRoundPanel>
        </td>
    </tr>
    <tr>
        <td style="text-align: left">
            <dx:ASPxCheckBox ID="cbSendMail" runat="server" style="direction: rtl" 
                TabIndex="35" Text="ارسال بريد بعد الرد">
            </dx:ASPxCheckBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxButton ID="btnsend" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" OnClick="btnsend_Click" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                Text="حــفـــــــــــظ" RightToLeft="True" ValidationGroup="errorGrp" 
                TabIndex="36">
            </dx:ASPxButton>
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" AllowDragging="True"
    ClientInstanceName="popupeditor" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
    CssPostfix="DevEx" HeaderText="رسالـــه" MinHeight="80px" MinWidth="200px" Modal="True"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Height="120px" Width="300px"
    Style="text-align: center" Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
    </LoadingPanelImage>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False" HorizontalAlign="Center"
        VerticalAlign="Middle">
        <Border BorderStyle="Solid" BorderWidth="10px" />
    </ContentStyle>
    <HeaderStyle>
        <Paddings PaddingLeft="7px" />
    </HeaderStyle>
    <LoadingPanelStyle ImageSpacing="5px">
    </LoadingPanelStyle>
    <ModalBackgroundStyle BackColor="Gray">
    </ModalBackgroundStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
