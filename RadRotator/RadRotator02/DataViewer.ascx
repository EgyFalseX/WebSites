<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DataViewer.ascx.cs" Inherits="DataViewer" %>
<style type="text/css">
    .style1
    {
        width: 641px;
        height: 269px;
    }
    .style2
    {
        width: 216px;
    }
    .style4
    {
        height: 26px;
    }
</style>
<style type="text/css">
        .left
        {
            width: 31px;
            height: 34px;
            background-image: url(images/_leftbtn.gif);
            border: 0px;
            background-color: transparent;
            cursor: hand;
        }

        .right
        {
            width: 31px;
            height: 34px;
            background-image: url(images/_rightbtn.gif);
            border: 0px;
            background-color: transparent;
            cursor: hand;
        }
    </style>
<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
</telerik:RadScriptManager>
<telerik:RadRotator ID="RadRotator1" runat="server" Width="640px" Height="357px"
    DataSourceID="DSData" FrameDuration="5000" Skin="Default" Style="text-align: center"
    ScrollDuration="1000" PauseOnMouseOver="False" WrapFrames="False">
    <ItemTemplate>
        <table class="style1">
            <tr>
                <td class="style2" rowspan="2" align="left" valign="top">
                    <asp:Image ID="Image2" runat="server" Height="260px" ImageUrl='<%# Eval("ImageLink") %>'
                        Width="430px" />
                    
                </td>
                <td align="right" class="style4" valign="top">
                    <asp:HyperLink ID="HyperLink1" Target="_new" runat="server" Font-Bold="True" NavigateUrl='<%# Eval("Link") %>'
                        Text='<%# Eval("Caption") %>' Font-Size="14pt"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" style="text-align: right">
                    <asp:Label ID="Label2" runat="server" Font-Bold="False" Text='<%# Eval("Contain") %>'
                        Font-Size="12pt"></asp:Label>
                </td>
            </tr>
        </table>
        <div>
        <button onclick="$find('<%=RadRotator1.ClientID%>').showNext(Telerik.Web.UI.RotatorScrollDirection.Left);"
                type="button" class="left">
            </button>
            <button onclick="$find('<%=RadRotator1.ClientID%>').showNext(Telerik.Web.UI.RotatorScrollDirection.Right);"
                type="button" class="right">
            </button>
</div>
    </ItemTemplate>
    <SlideShowAnimation Duration="1000" Type="Fade" />
    <ControlButtons LeftButtonID="leftButton" RightButtonID="rightButton" />
</telerik:RadRotator>
<asp:AccessDataSource ID="DSData" runat="server" DataFile="App_Data/DataDB.mdb" SelectCommand="SELECT [ID], [Caption], [Contain], [ImageLink], 'PageViewer.aspx?ID=' &amp; [ID] AS [Link] FROM [RotatorData] WHERE viewpage = TRUE">
</asp:AccessDataSource>

