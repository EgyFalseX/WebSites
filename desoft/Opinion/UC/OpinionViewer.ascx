<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OpinionViewer.ascx.cs" Inherits="OpinionViewer" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<style type="text/css">
    .style2
    {
        text-align: right;
        height: 22px;
    }
    .style3
    {
        height: 22px;
    }
</style>

<table align="center">
    <tr>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
    <tr>
        <td>
<dx:ASPxDataView ID="ASPxDataViewViewer" runat="server" 
    CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
    ItemSpacing="4px" PagerAlign="Justify" PagerPanelSpacing="2px" 
    SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" 
    style="text-align: center" DataSourceID="DSData" ColumnCount="1">
    <ItemTemplate>
        <table class="style1" border="3">
                        <tr>
                            <td align="right" class="style3" style="direction: rtl" colspan="3">
                                <dx:ASPxLabel ID="Lblconame" runat="server" Text='<% # bind("coname") %>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style3">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="الاسم" ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style4">
                                <dx:ASPxLabel ID="LblDate" runat="server" 
                                    Text='<%# Bind("condate", "{0:dd/MM/yyyy}") %>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" class="style4" bgcolor="Gray">
                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="التاريخ" 
                                    ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" class="style4">
                                <dx:ASPxLabel ID="Lblsefa" runat="server" Text='<% # bind("sefaid") %>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style4">
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="عنوان" 
                                    ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" class="style5" valign="top">
                                <dx:ASPxMemo ID="tbmassage" runat="server" Height="80px" ReadOnly="True" Text='<% # bind("massage") %>'
                                    Width="360px" style="direction: rtl">
                                </dx:ASPxMemo>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" valign="top"
                                bgcolor="Gray" class="style5">
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="النص" ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        </table>
    </ItemTemplate>
    <PagerSettings SEOFriendly="CrawlerOnly">
        <Summary AllPagesText="كل الصفحات" Text="صفحه {0} من {1}" />
    </PagerSettings>
    <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
    </LoadingPanelImage>
    <LoadingPanelStyle ImageSpacing="5px">
    </LoadingPanelStyle>
    <EmptyDataTemplate>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" 
            Text="لا يوجد بيانات">
        </dx:ASPxLabel>
    </EmptyDataTemplate>
    <DisabledStyle ForeColor="#B1B1B8">
    </DisabledStyle>
</dx:ASPxDataView>

            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="../App_Data/ABOUT.mdb" 
                
                
                SelectCommand="SELECT [addno], [coname], [sefaid], [mail], [massage], [condate] FROM [contact] ORDER BY [addno] DESC">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>


