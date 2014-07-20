<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewMenu.ascx.cs" Inherits="ViewMenu" %>

<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<style type="text/css">
    .style3
    {
        height: 126px;
    }
    .style4
    {
        text-align: right;
        font-family: "Times New Roman", Times, serif;
        font-size: medium;
        font-weight: 700;
        color: #0066FF;
    }
    .style5
    {
        height: 22px;
    }
    .style6
    {
        width: 97px;
        text-align: center;
        font-family: "Times New Roman", Times, serif;
        font-size: large;
    }
</style>
<table align="center">
    <tr>
        <td style="text-align: center">
<img class="style2" src="../../../banar.jpg" /></td>
    </tr>
    <tr>
        <td>
<dx:ASPxDataView ID="ASPxDataViewViewer" runat="server" 
    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    ItemSpacing="4px" PagerPanelSpacing="2px" 
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
    style="text-align: center; margin-left: 0px;" DataSourceID="DSData" ColumnCount="1">
    <ItemTemplate>
        <table cellspacing="0" class="rlvEditTable" dir="rtl" 
            style="height: 364px; width: 930px;" bgcolor="White">
            <tr>
                <td class="style5" colspan="3" 
                    style="text-align: center" align="right" valign="top">
                    <asp:Label ID="lblItemName" runat="server" Font-Bold="True" Font-Size="14pt" 
                        Text='<%# Eval("ItemName") %>' 
                        style="font-family: 'Times New Roman', Times, serif; font-size: x-large; color: #000099"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style3" colspan="3" style="text-align: center" 
                    valign="top">
                    <asp:Image ID="img" runat="server" BackColor="White" BorderColor="White" 
                        BorderWidth="2px" Height="150px" 
                         ImageUrl='<%# Eval("ItemPic", "../Files/IMG/{0}") %>'  />
                </td>
            </tr>
            <tr>
                <td align="right" valign="top" class="style6">
                    <asp:Label ID="cnameLabel2" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="نوع الحدث " 
                        style="font-family: 'Times New Roman', Times, serif; text-align: center; font-size: large"></asp:Label>
                </td>
                <td align="right" valign="top">
                    <asp:Label ID="cnameLabel3" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text=":"></asp:Label>
                </td>
                <td class="style4" valign="top">
                    <asp:Label ID="lblItemtype" runat="server" Text='<%# Eval("Itemtype") %>' 
                        
                        style="color: #0066FF; font-size: large; font-family: 'Times New Roman', Times, serif;"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top" class="style6">
                    <asp:Label ID="cityLabel2" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="المصدر/النقابة"></asp:Label>
                </td>
                <td align="right" valign="top">
                    <asp:Label ID="cnameLabel4" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text=":"></asp:Label>
                </td>
                <td class="style4" valign="top">
                    <asp:Label ID="lblLagnaName" runat="server" Text='<%# Eval("LagnaName") %>' 
                        style="color: #0066FF"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top" class="style6">
                    <asp:Label ID="tatLabel2" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="تاريخ البدايه"></asp:Label>
                </td>
                <td align="right" valign="top">
                    <asp:Label ID="cnameLabel5" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text=":"></asp:Label>
                </td>
                <td class="style4" valign="top">
                    <asp:Label ID="lblItemdatestart" runat="server" 
                        Text='<%# Eval("Itemdatestart", "{0:dd/MM/yyyy}") %>' 
                        style="color: #0066FF"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top" class="style6">
                    <asp:Label ID="tatLabel3" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="تاريخ النهايه"></asp:Label>
                </td>
                <td align="right" valign="top">
                    <asp:Label ID="cnameLabel6" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text=":"></asp:Label>
                </td>
                <td class="style4" valign="top">
                    <asp:Label ID="lblItemdateend" runat="server" 
                        Text='<%# Eval("Itemdateend", "{0:dd/MM/yyyy}") %>' style="color: #0066FF"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top" class="style6">
                    <asp:Label ID="tatLabel4" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="ملخص"></asp:Label>
                </td>
                <td align="right" valign="top">
                    <asp:Label ID="cnameLabel7" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text=":"></asp:Label>
                </td>
                <td class="style4" valign="top">
                    <asp:Label ID="lblItemInfo" runat="server" Text='<%# Eval("ItemInfo") %>' 
                        style="color: #0033CC"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top" class="style6">
                    &nbsp;</td>
                <td align="right" valign="top">
                    &nbsp;</td>
                <td style="text-align: left" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("ItemID", "../ViewDetails.aspx?id={0}") %>' 
                        style="font-weight: 700">التفاصيل...</asp:HyperLink>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    <PagerSettings SEOFriendly="CrawlerOnly">
        <Summary AllPagesText="كل الصفحات" Text="صفحه {0} من {1}" />
    </PagerSettings>
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/Loading.gif">
    </LoadingPanelImage>
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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

            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/events.mdb" 
                
                SelectCommand="SELECT [ItemID], [ItemName], [Itemtypeid], [LagnaId], [Itemdatestart], [Itemdateend], [ItemInfo], [ItemPic], (SELECT LagnaName FROM CDLagna WHERE LagnaId = MenuItem.LagnaId) AS LagnaName, (SELECT Itemtype FROM Itemtype WHERE Itemtypeid = MenuItem.Itemtypeid) AS Itemtype FROM [MenuItem] ORDER BY Itemdatestart DESC">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>


