<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewNews.ascx.cs" Inherits="ViewTitle" %>
<div dir="rtl" style="text-align: center">
    <asp:GridView ID="GridViewNewsTitle" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" 
        GridLines="None" BorderStyle="None" Font-Bold="True" Font-Size="14px" 
        style="text-align: right">
        <Columns>
            <asp:BoundField DataField="RowNo">
            <ItemStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="GoURL" DataTextField="NewsTitle" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:HyperLinkField>
        </Columns>
    </asp:GridView>

    <asp:Label ID="LblNewsContain" runat="server" Text="Label" Font-Bold="True" 
        Font-Size="14px"></asp:Label>

    <br />
    <asp:Button ID="BtnBack" runat="server" Font-Bold="True" Font-Size="14px" 
        onclick="BtnBack_Click" Text="عوده" Visible="False" Width="100px" />

</div>