<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SendMessage.ascx.cs" Inherits="SendMessage" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<style type="text/css">
    .style3
    {
        width: 663px;
        direction: rtl;
    }
    
.dxvsValidationSummary
{
	font: 12px Tahoma;
	color: Red;
}
.dxvsValidationSummary a.dxvsHL
{
	text-decoration: none;
	border-bottom: 1px dashed #f70;
}

.dxvsValidationSummary a.dxvsHL,
.dxvsValidationSummary a.dxvsHL:visited
{
	color: red;
}
    .style4
    {
        width: 437px;
    }
    .style5
    {
        height: 31px;
        direction: rtl;
    }
    </style>

<table align="center">
    
    <tr>
         <td style="direction: rtl">
            <dx:ASPxPanel ID="pnl" runat="server" Height="82px" style="text-align: right; direction: ltr;" 
                Visible="False" Width="456px">
                <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table class="style4">
        <tr>
            <td bgcolor="#CCD9EB" style="text-align: right">
                <dx:ASPxTextBox ID="TxtResultMail" runat="server" 
                    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    ReadOnly="True" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                    style="direction: rtl" Width="250px" BackColor="#76A2D3" 
                    ForeColor="#000099">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td bgcolor="#2A5A8E" style="direction: rtl">
                <asp:Label ID="Label17" runat="server" ForeColor="White" style="direction: rtl" 
                    Text="البريد الالكتروني ( Email ) :"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#CCD9EB">
                <dx:ASPxTextBox ID="TxtResultNumber" runat="server" 
                    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    ReadOnly="True" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                    Width="250px" BackColor="#76A2D3" ForeColor="#000099" 
                    style="direction: rtl">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td bgcolor="#2A5A8E" class="style5">
                <asp:Label ID="Label18" runat="server" ForeColor="White" style="direction: rtl" 
                    Text="رقم الرساله # ( MessageID ) :"></asp:Label>
            </td>
        </tr>
    </table>
                    </dx:PanelContent>
</PanelCollection>
            </dx:ASPxPanel>
         </td>
    </tr>
    </table>
<p>
</p>
<table align="center" style="width: 781px" border="2">
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Label ID="LblTitle" runat="server" Font-Size="15pt" Font-Bold="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center" bgcolor="Yellow">
            <asp:Label ID="LblState" runat="server" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
                <dx:ASPxValidationSummary ID="ASPxVSGroup" runat="server" RightToLeft="True" 
                    ShowErrorsInEditors="True" ValidationGroup="VGroup">
                </dx:ASPxValidationSummary>
        </td>
    </tr>
    <tr>
        <td class="style3" bgcolor="#CCD9EB">
            &nbsp;</td>
        <td style="text-align: right; direction: rtl" bgcolor="#2A5A8E">
            <dx:ASPxButton ID="BtnClear" runat="server" onclick="BtnClear_Click" Text="مسح" 
                Width="150px" ValidationGroup="aaaa">
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td class="style3" bgcolor="#CCD9EB">
            <dx:ASPxComboBox ID="ASPxCBLagnaId" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                DataSourceID="DSCDLagna" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                TextField="LagnaName" ValueField="LagnaId" ValueType="System.Int32" 
                Width="250px" AutoPostBack="True" 
                onselectedindexchanged="ASPxCBLagnaId_SelectedIndexChanged">
                <Columns>
                    <dx:ListBoxColumn Caption="الاسم" FieldName="LagnaName" />
                </Columns>
                <ItemStyle HorizontalAlign="Center" />
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
                <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RequiredField ErrorText="اختر اسم النقابه" IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxComboBox>
            <asp:AccessDataSource ID="DSCDLagna" runat="server" 
                DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT [LagnaId], [LagnaName] FROM [CDLagna]">
            </asp:AccessDataSource>
        </td>
        <td style="text-align: right; direction: rtl" bgcolor="#2A5A8E">
            <asp:Label ID="Label15" runat="server" Text="اسم النقابة" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right" bgcolor="#CCD9EB">
            <dx:ASPxComboBox ID="ASPxCBEdaraId" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                DataSourceID="DSCDEdara" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                TextField="EdaraName" ValueField="EdaraId" ValueType="System.Int32" 
                Width="250px">
                <Columns>
                    <dx:ListBoxColumn Caption="الاسم" FieldName="EdaraName" />
                </Columns>
                <ItemStyle HorizontalAlign="Center" />
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
                <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RequiredField ErrorText="اختر اداره" IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxComboBox>
            <asp:AccessDataSource ID="DSCDEdara" runat="server" 
                DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT [EdaraId],
(SELECT EdaraName FROM CDEdara WHERE EdaraId = CDLagnaEdarat.EdaraId) AS EdaraName
FROM [CDLagnaEdarat]
WHERE
LagnaId = ?">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ASPxCBLagnaId" DbType="Int32" Name="?" 
                        PropertyName="Value" />
                </SelectParameters>
            </asp:AccessDataSource>
        </td>
        <td style="text-align: right; direction: rtl" bgcolor="#2A5A8E">
            <asp:Label ID="Label9" runat="server" Text="الإدارة" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right" bgcolor="#CCD9EB">
            <dx:ASPxTextBox ID="Txtconame" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Width="250px">
                <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RequiredField IsRequired="True" ErrorText="ادخل الاسم" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </td>
        <td style="text-align: right; direction: rtl" bgcolor="#2A5A8E">
            <asp:Label ID="Label10" runat="server" Text="الاسم" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right" bgcolor="#CCD9EB">
            <dx:ASPxComboBox ID="ASPxCBsefaid" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                DataSourceID="DSsefa" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                TextField="sefa" ValueField="sefaid" ValueType="System.Int32" 
                Width="250px">
                <Columns>
                    <dx:ListBoxColumn Caption="الاسم" FieldName="sefa" />
                </Columns>
                <ItemStyle HorizontalAlign="Center" />
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
                <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RequiredField ErrorText="اختر صفه" IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxComboBox>
            <asp:AccessDataSource ID="DSsefa" runat="server" 
                DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT [sefaid], [sefa] FROM [sefa]"></asp:AccessDataSource>
        </td>
        <td style="text-align: right; direction: rtl" bgcolor="#2A5A8E">
            <asp:Label ID="Label11" runat="server" Text="الصفة" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right" bgcolor="#CCD9EB">
            <dx:ASPxTextBox ID="Txttel" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Width="250px">
                <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RequiredField IsRequired="True" ErrorText="ادخل محمول" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </td>
        <td style="text-align: right; direction: rtl" bgcolor="#2A5A8E">
            <asp:Label ID="Label12" runat="server" Text="المحمول" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right" bgcolor="#CCD9EB">
            <dx:ASPxTextBox ID="Txtmail" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Width="250px">
                <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RegularExpression ErrorText="ادخل بريد صحيح" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField IsRequired="True" ErrorText="ادخل بريد الكتروني" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </td>
        <td style="text-align: right; direction: rtl" bgcolor="#2A5A8E">
            <asp:Label ID="Label13" runat="server" Text="بريد الكتروني" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: right" bgcolor="#CCD9EB" class="style3">
            <dx:ASPxMemo ID="Txtmassage" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                Height="71px" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                Width="350px">
                <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RequiredField ErrorText="ادخل رساله" IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxMemo>
        </td>
        <td style="text-align: right; direction: rtl" valign="top" bgcolor="#2A5A8E">
            <asp:Label ID="Label14" runat="server" Text="الرسالــه" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style3">
            <asp:CheckBox ID="CBShowOnLine" runat="server" 
                Text="اوافق على عرض رسالتي على الموقع" />
            <asp:Label ID="Label16" runat="server" 
                Text="(باختيارك نعم يتمكن زوار الموقع من استعراض رسالتك والرد عليها )" 
                ForeColor="Red"></asp:Label>
        </td>
        <td style="text-align: right; direction: rtl" valign="top" bgcolor="#2A5A8E">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style3">
            &nbsp;</td>
        <td style="text-align: right; direction: rtl" valign="top" bgcolor="#2A5A8E">
            <dx:ASPxButton ID="BtnSend" runat="server" onclick="BtnSend_Click" Text="أرسال" 
                Width="150px">
            </dx:ASPxButton>
        </td>
    </tr>
    </table>


                
            


