<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RotatorDataViewer.ascx.cs" Inherits="RotatorDataViewer" %>

<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<style type="text/css">
    .style1
    {
        width: 560px;
        height: 186px;
    }
    .style5
    {
        width: 195px;
    }
    .style6
    {
        width: 192px;
        height: 28px;
    }
    .style7
    {
        width: 196px;
        height: 28px;
    }
    .style8
    {
        height: 25px;
    }
    .style9
    {
        width: 214px;
        height: 28px;
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
                            <td align="right" class="style8" style="direction: rtl" colspan="3">
                                <dx:ASPxLabel ID="Lblconame" runat="server" Text='<%# Eval("name") %>'>
                                    <Border BorderStyle="None" />
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style8">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="الاسم" ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style7">
                                <dx:ASPxLabel ID="LblDate" runat="server" 
                                    Text='<%# Eval("mail") %>'>
                                    <Border BorderStyle="None" />
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" class="style7" bgcolor="Gray">
                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="الايميل" 
                                    ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" class="style6">
                                <dx:ASPxLabel ID="Lblsefa" runat="server" Text='<%# Eval("Caption") %>'>
                                    <Border BorderStyle="None" />
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style7">
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="الموضوع" 
                                    ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" class="style5" valign="top">
                                <dx:ASPxMemo ID="tbmassage" runat="server" Height="100px" ReadOnly="True" Text='<%# Eval("userreply") %>'
                                    Width="488px" style="direction: rtl">
                                    <Border BorderStyle="None" />
                                </dx:ASPxMemo>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" valign="top"
                                bgcolor="Gray" class="style5">
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="التعليق" ForeColor="White">
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
                DataFile="../App_Data/DataDB.mdb" 
                
                
                
                SelectCommand="SELECT ID, IDElement, name, mail, userreply, show, 
(SELECT Caption FROM RotatorElement WHERE IDElement = RotatorData.IDElement) AS Caption 
FROM RotatorData WHERE (show = true)">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>


