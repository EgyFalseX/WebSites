<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CatCreator.ascx.cs" Inherits="CatCreator" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .catstyle1
    {
        width: 100%;
    }
    .catstyle2
    {
        width: 368px;
    }
    .catstyle3
    {
        width: 251px;
        text-align:left;
    }
    .catstyle4
    {
        height: 194px;
        vertical-align:top;
        text-align:center;
    }
    .style1
    {
        width: 100px;
    }
</style>

        
        <body style="text-align: center">
            <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
            </telerik:RadScriptManager>
            <table align="center" class="style1">
                <tr>
                    <td align="right" valign="top" colspan="2" style="text-align: center">
                
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
            <asp:Button ID="BtnAdd" runat="server" Font-Bold="False" Font-Size="14px" 
            onclick="BtnAdd_Click" Text="اضافه" Width="100px" Height="26px" />
                        <br />
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="16px" 
                Visible="False"></asp:Label>
                    </td>
                    <td>
                
            <asp:Panel ID="PnlPopCus" ScrollBars="Both"
                        runat="server" Width="230px" Height="350px" CssClass="modalPopup" 
                                BorderColor="#3399FF" BorderStyle="Solid"  >
                        <telerik:RadTreeView ID="RadTreeViewCat" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
                            Skin="Hay" style="text-align: left; direction: ltr;" Font-Bold="True" 
                            Font-Size="14px" AllowNodeEditing="True" onnodeedit="RadTreeViewCat_NodeEdit">
                            <ExpandAnimation Duration="100" />
                            <CollapseAnimation Duration="100" Type="OutQuint" />
                        </telerik:RadTreeView>
                </asp:Panel>
                    </td>
                </tr>
            </table>

