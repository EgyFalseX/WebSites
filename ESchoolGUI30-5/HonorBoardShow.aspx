<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HonorBoardShow.aspx.cs" Inherits="HonorBoardShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body style="direction: rtl">
    <form id="form1" runat="server">
    <div>
    
        <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" 
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            CellSpacing="2" EnableTheming="True" GridLines="Both" RepeatColumns="2" 
            Width="445px">
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td colspan="2">
                            <asp:Image ID="Image1" runat="server" Height="69px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <FooterTemplate>
            </FooterTemplate>
        </asp:DataList>
    
    </div>
    </form>
</body>
</html>
