<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewMessage.ascx.cs" Inherits="ViewMessage" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
</style>
    <style type="text/css">
        .style1
        {
            width: 450px;
        }
    </style>
                <asp:AccessDataSource ID="DScontype" runat="server" 
                    DataFile="../App_Data/contact.mdb" 
                    
    SelectCommand="SELECT [contypeid], [contype] FROM [contype]">
                </asp:AccessDataSource>
    <table class="style4" align="center">
        <tr>
            <td style="text-align: center" colspan="2">
                <dx:ASPxValidationSummary ID="ASPxVSGroup" runat="server" RightToLeft="True" 
                    ShowErrorsInEditors="True" ValidationGroup="VGroup">
                </dx:ASPxValidationSummary>
            </td>
        </tr>
        <tr>
            <td bgcolor="#CCD9EB" style="text-align: right" align="center">
                <dx:ASPxComboBox ID="ASPxCB" runat="server" 
                    CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    DataSourceID="DScontype" 
                    SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css" 
                    ValueType="System.Int32" Width="250px" BackColor="#6B99CE" 
                    TextField="contype" ValueField="contypeid" style="direction: rtl">
                    <Columns>
                        <dx:ListBoxColumn Caption="اختر" FieldName="contype" />
                    </Columns>
                    <ItemStyle HorizontalAlign="Center" />
                    <LoadingPanelImage Url="App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RequiredField ErrorText="اختر نوع الرساله" 
                            IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td bgcolor="#2A5A8E" style="direction: rtl">
                <asp:Label ID="Label19" runat="server" ForeColor="White" style="direction: rtl" 
                    Text="اختر نوع الرساله"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#CCD9EB" style="text-align: right">
                <dx:ASPxTextBox ID="TxtResultMail" runat="server" 
                    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                    style="direction: rtl" Width="250px" TabIndex="1">
                    <ValidationSettings ErrorTextPosition="Bottom">
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
<ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                        </ErrorFrameStyle>
                        <RegularExpression ErrorText="ادخل بريد صحيح" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        <RequiredField ErrorText="ادخل البريد الالكتروني" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td bgcolor="#2A5A8E" style="direction: rtl">
                <asp:Label ID="Label17" runat="server" ForeColor="White" style="direction: rtl" 
                    Text="البريد الالكتروني ( Email ) :"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#CCD9EB" style="text-align: right">
                <dx:ASPxTextBox ID="TxtResultNumber" runat="server" 
                    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                    CssPostfix="PlasticBlue" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                    Width="250px" 
                    style="direction: rtl" TabIndex="2">
                    <ValidationSettings ErrorTextPosition="Bottom">
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
<ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                        </ErrorFrameStyle>
                        <RequiredField ErrorText="دخل رقم الرساله" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td bgcolor="#2A5A8E" class="style5" style="direction: rtl">
                <asp:Label ID="Label18" runat="server" ForeColor="White" style="direction: rtl" 
                    Text="رقم الرساله # ( MessageID ) :"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#CCD9EB" style="text-align: right">
                <dx:ASPxButton ID="btnView" runat="server" onclick="btnView_Click" TabIndex="3" 
                    Text="( View Message ) عرض الرساله" Width="200px">
                </dx:ASPxButton>
            </td>
            <td bgcolor="#2A5A8E" class="style5" style="direction: rtl">
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblStatus" runat="server" style="direction: rtl"></asp:Label>
            </td>
        </tr>
    </table>
<table align="center" class="style1">
    <tr>
        <td>
<dx:ASPxRoundPanel ID="RoundPnl" runat="server" BackColor="#D1DDED" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                GroupBoxCaptionOffsetY="-18px" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                style="direction: rtl; text-align: right" Visible="False">

    <ContentPaddings PaddingBottom="8px" />
    <HeaderStyle BackColor="#DEDEDE">
    <BorderLeft BorderStyle="None" />
    <BorderRight BorderStyle="None" />
    <BorderBottom BorderStyle="None" />
    </HeaderStyle>
    <TopLeftCorner Height="5px" 
        Url="~/Images/ASPxRoundPanel/581053611/TopLeftCorner.png" Width="5px">
    </TopLeftCorner>
    <NoHeaderTopLeftCorner Height="5px" 
        Url="~/Images/ASPxRoundPanel/581053611/NoHeaderTopLeftCorner.png" Width="5px">
    </NoHeaderTopLeftCorner>
    <TopRightCorner Height="5px" 
        Url="~/Images/ASPxRoundPanel/581053611/TopRightCorner.png" Width="5px">
    </TopRightCorner>
    <NoHeaderTopRightCorner Height="5px" 
        Url="~/Images/ASPxRoundPanel/581053611/NoHeaderTopRightCorner.png" Width="5px">
    </NoHeaderTopRightCorner>
    <BottomRightCorner Height="5px" 
        Url="~/Images/ASPxRoundPanel/581053611/BottomRightCorner.png" Width="5px">
    </BottomRightCorner>
    <BottomLeftCorner Height="5px" 
        Url="~/Images/ASPxRoundPanel/581053611/BottomLeftCorner.png" Width="5px">
    </BottomLeftCorner>
    <HeaderLeftEdge>
        <BackgroundImage HorizontalPosition="left" 
            ImageUrl="~/Images/ASPxRoundPanel/581053611/HeaderLeftEdge.png" 
            Repeat="NoRepeat" VerticalPosition="bottom" />
    </HeaderLeftEdge>
    <HeaderContent>
        <BackgroundImage HorizontalPosition="left" 
            ImageUrl="~/Images/ASPxRoundPanel/581053611/HeaderContent.png" Repeat="RepeatX" 
            VerticalPosition="bottom" />
    </HeaderContent>
    <HeaderRightEdge>
        <BackgroundImage HorizontalPosition="right" 
            ImageUrl="~/Images/ASPxRoundPanel/581053611/HeaderRightEdge.png" 
            Repeat="NoRepeat" VerticalPosition="bottom" />
    </HeaderRightEdge>

    <HeaderTemplate>
        
    </HeaderTemplate>
    <panelcollection>
        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <table align="center" class="style1">
            <tr>
                <td bgcolor="#A2BCDD" class="style3">
                    <asp:Label ID="Label20" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="الاسم : "></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <asp:Label ID="Lblconame" runat="server" ForeColor="#000099" 
                        style="direction: rtl"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3">
                    <asp:Label ID="Label22" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="محمول : "></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <asp:Label ID="Lbltel" runat="server" ForeColor="#000099" 
                        style="direction: rtl"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3">
                    <asp:Label ID="Label23" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="بريد اليكتروني : "></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <asp:Label ID="Lblmail" runat="server" ForeColor="#000099" 
                        style="direction: rtl"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3" valign="top">
                    <asp:Label ID="Label24" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="الرساله : "></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <dx:ASPxMemo ID="Lblmassage" runat="server" BackColor="#A2BCDD" 
                        CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                        ForeColor="#000099" Height="71px" 
                        SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                        style="direction: rtl" Width="300px">
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxMemo>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3">
                    <asp:Label ID="Label25" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="تاريخ الارسال : "></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <asp:Label ID="Lblcondate" runat="server" ForeColor="#000099" 
                        style="direction: rtl"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3" valign="top">
                    <asp:Label ID="Label26" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="الرد : "></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <dx:ASPxMemo ID="Lblreply" runat="server" BackColor="#A2BCDD" 
                        CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                        ForeColor="#000099" Height="71px" 
                        SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                        style="direction: rtl" Width="300px">
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxMemo>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3">
                    <asp:Label ID="Label27" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="اسم النقابه : "></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <asp:Label ID="LblLagnaName" runat="server" ForeColor="#000099" 
                        style="direction: rtl"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3">
                    <asp:Label ID="Label28" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="الاداره : "></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <asp:Label ID="LblEdaraName" runat="server" ForeColor="#000099" 
                        style="direction: rtl"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3">
                    <asp:Label ID="Label29" runat="server" ForeColor="#000099" 
                        style="direction: rtl" Text="تاريخ الرد"></asp:Label>
                </td>
                <td bgcolor="#A2BCDD" class="style2">
                    <asp:Label ID="Lblreplydate" runat="server" ForeColor="#000099" 
                        style="direction: rtl"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#A2BCDD" class="style3">
                    &nbsp;</td>
                <td bgcolor="#A2BCDD" class="style2">
                    &nbsp;</td>
            </tr>
        </table>
            </dx:PanelContent>
    </panelcollection>

    <Border BorderColor="#8B8B8B" BorderStyle="Solid" BorderWidth="1px" />

</dx:ASPxRoundPanel>


        </td>
    </tr>
</table>



