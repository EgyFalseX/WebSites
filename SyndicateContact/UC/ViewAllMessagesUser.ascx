<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewAllMessagesUser.ascx.cs" Inherits="ViewAllMessagesUser" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<style type="text/css">
    .style1
    {
        width: 593px;
    }
    
.dxvsValidationSummary
{
	font: 12px Tahoma;
	color: Red;
}
    </style>

                <asp:AccessDataSource ID="DScontype" runat="server" 
                    DataFile="../App_Data/contact.mdb" 
                    
    SelectCommand="SELECT [contypeid], [contype] FROM [contype]">
                </asp:AccessDataSource>

<table align="center">
    <tr>
        <td dir="ltr" style="text-align: center">
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            
            <dx:ASPxDataView ID="ASPxDataViewViewer" runat="server" 
    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    ItemSpacing="3px" PagerAlign="Justify" PagerPanelSpacing="3px" 
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
    style="text-align: center" DataSourceID="DSData1" ColumnCount="1" Visible="False">
    <ItemTemplate>
        <table class="style1" border="3">
                        <tr>
                            <td align="right" class="style3" style="direction: rtl" colspan="3">
                                <dx:ASPxLabel ID="Lblconame" runat="server" Text='<%# Eval("coname") %>' 
                                    Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style3">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="الاسم" ForeColor="White" 
                                    Font-Bold="True" Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style4">
                                <dx:ASPxLabel ID="LblDate" runat="server" 
                                    Text='<%# Eval("EdaraName") %>' Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" class="style4" bgcolor="Gray">
                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="الاداره" 
                                    ForeColor="White" Font-Bold="True" Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" class="style4">
                                <dx:ASPxLabel ID="Lblsefa" runat="server" Text='<%# Eval("LagnaName") %>' 
                                    Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style4">
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="النقابه" 
                                    ForeColor="White" Font-Bold="True" Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style4" colspan="3">
                                <dx:ASPxLabel ID="LblDate0" runat="server" 
                                    Text='<%# Eval("condate", "{0:dd/MM/yyyy}") %>' Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" bgcolor="Gray" class="style4" 
                                style="border: thin solid #CCCCCC; direction: rtl">
                                <dx:ASPxLabel ID="ASPxLabel9" runat="server" ForeColor="White" Text="التاريخ" 
                                    Font-Bold="True" Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" class="style5" valign="top">
                                <dx:ASPxMemo ID="tbmassage" runat="server" Height="80px" ReadOnly="True" Text='<%# Eval("massage") %>'
                                    Width="500px" style="direction: rtl" Font-Size="Medium">
                                </dx:ASPxMemo>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" valign="top"
                                bgcolor="Gray" class="style5">
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="الرساله" ForeColor="White" 
                                    Font-Bold="True" Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style5" colspan="3" valign="top">
                                <dx:ASPxLabel ID="LblDate1" runat="server" Font-Size="Medium" 
                                    Text='<%# Eval("EdaraIdrName") %>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" bgcolor="Gray" class="style5" 
                                style="border: thin solid #CCCCCC; direction: rtl" valign="top">
                                <dx:ASPxLabel ID="ASPxLabel11" runat="server" ForeColor="White" Text="جهة الرد" 
                                    Font-Bold="True" Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style5" colspan="3" valign="top">
                                <dx:ASPxMemo ID="tbmassage0" runat="server" Height="80px" ReadOnly="True" 
                                    style="direction: rtl" Text='<%# Eval("reply") %>' Width="500px" 
                                    Font-Size="Medium">
                                </dx:ASPxMemo>
                            </td>
                            <td align="right" bgcolor="Gray" class="style5" 
                                style="border: thin solid #CCCCCC; direction: rtl" valign="top">
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" ForeColor="White" Text="الرد" 
                                    Font-Bold="True" Font-Size="Medium">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        </table>
    </ItemTemplate>
    <PagerSettings SEOFriendly="CrawlerOnly">
        <Summary AllPagesText="كل الصفحات" Text="صفحه {0} من {1}" />
    </PagerSettings>
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/dvLoading.gif">
    </LoadingPanelImage>
    <LoadingPanelStyle ImageSpacing="6px">
    </LoadingPanelStyle>
                <PagerStyle ForeColor="White" />
    <EmptyDataTemplate>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" 
            Text="لا يوجد بيانات">
        </dx:ASPxLabel>
    </EmptyDataTemplate>
    <DisabledStyle ForeColor="#B8B8B8">
    </DisabledStyle>
</dx:ASPxDataView>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSData1" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_ask.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_ask.LagnaId) AS LagnaName,
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_ask.EdaraIdr) AS EdaraIdrName
                FROM contact_ask
WHERE agreeshow = true AND adminagree = true
ORDER BY condate DESC">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData2" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, 
                 condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_suggest.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_suggest.LagnaId) AS LagnaName,
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_suggest.EdaraIdr) AS EdaraIdrName
                FROM contact_suggest
WHERE agreeshow = true AND adminagree = true
ORDER BY condate DESC">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData3" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_shkwa.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_shkwa.LagnaId) AS LagnaName,
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_shkwa.EdaraIdr) AS EdaraIdrName
                FROM contact_shkwa
WHERE agreeshow = true AND adminagree = true
ORDER BY condate DESC">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData4" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_thanks.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_thanks.LagnaId) AS LagnaName,
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_thanks.EdaraIdr) AS EdaraIdrName
                FROM contact_thanks
WHERE agreeshow = true AND adminagree = true
ORDER BY condate DESC">
            </asp:AccessDataSource>
        </td>
    </tr>
    </table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    HeaderText="رسالـــه" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/dvLoading.gif">
    </LoadingPanelImage>
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

<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">تم 
    التحميل</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


  


    
