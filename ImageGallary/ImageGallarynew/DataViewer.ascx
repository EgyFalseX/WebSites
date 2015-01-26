<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DataViewer.ascx.cs" Inherits="DataViewer" %>
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
    .style5
    {
    }
    .style6
    {
    }
    .style7
    {
        height: 140px;
        width: 418px;
    }
    .style9
    {
        width: 31px;
    }
    .style10
    {
        height: 40px;
    }
    </style>
      
<telerik:RadScriptManager ID="ScriptManager1" runat="server" EnableTheming="True">
</telerik:RadScriptManager>
<telerik:RadRotator ID="RadRotator1" runat="server" Width="862px" Height="495px"
    DataSourceID="DSData" FrameDuration="5000" Skin="Default" Style="text-align: center"
    ScrollDuration="1000" PauseOnMouseOver="False" WrapFrames="False">
    <ItemTemplate>
    <table style="border-style: none; width: 705px; height: 266px;" 
    frame="border" >
            <tr>
                <td  rowspan="2" align="left" valign="middle" class="style9" >
        <button onclick="$find('<%=RadRotator1.ClientID%>').showNext(Telerik.Web.UI.RotatorScrollDirection.Left);"
                type="button" class="left">
            </button>
                    
                </td>
                <td align="center" valign="top" class="style10" >
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("Caption") %>'
                        Font-Size="12pt"></asp:Label>
                    
                </td>
                <td align="right" valign="middle" class="style6" rowspan="2">
            <button onclick="$find('<%=RadRotator1.ClientID%>').showNext(Telerik.Web.UI.RotatorScrollDirection.Right);"
                type="button" class="right">
            </button>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top"  >
                    <asp:Image ID="Image2" runat="server" Height="467px" ImageUrl='<%# Eval("ImageLink", "schoolPhoto/{0}") %>'
                        Width="786px" />
                    
                </td>
            </tr>
        </table>
        
    </ItemTemplate>
    <SlideShowAnimation Duration="1000" Type="Fade" />
    <ControlButtons LeftButtonID="leftButton" RightButtonID="rightButton" />
</telerik:RadRotator>
<asp:AccessDataSource ID="DSData" runat="server" DataFile="App_Data/DataDB.mdb" SelectCommand="SELECT [ID], [Caption], [Contain], [ImageLink], 'PageViewer.aspx?ID=' &amp; [ID] AS [Link] FROM [RotatorData] WHERE  [aboutid] = ? ORDER BY RotatorData.ID DESC;">
<SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="aboutid" QueryStringField="id" Type="Int32" />
                </SelectParameters>
</asp:AccessDataSource>

