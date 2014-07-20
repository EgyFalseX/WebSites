<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BirthDate.ascx.cs" Inherits="BirthDate" %>
<style type="text/css">
    .style1
    {
        width: 300px;
    }
    .style2
    {
    }
    .style3
    {
        width: 197px;
    }
</style>
<div dir="rtl">

    <table align="center" class="style3">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="20px" 
                    Font-Underline="True" ForeColor="Red" Text="عيـــــــد ميلاد سعيــــــــــد"></asp:Label>
            </td>
        </tr>
    </table>

    <asp:DataList ID="DataListStd" runat="server" BackColor="LightGoldenrodYellow" 
        BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
        RepeatColumns="2">
        <AlternatingItemStyle BackColor="PaleGoldenrod" />
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <ItemTemplate>
            <table align="center" class="style1" dir="rtl">
                <tr>
                    <td>
                        <img src="images/birthdayBalloons.gif" style="height: 272px" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Image ID="Image1" runat="server" Height="125px" Width="120px"  
                    ImageUrl ='<%# Bind("Pic") %>'/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="20px" 
                    ForeColor="#9900FF" Text="تهنيء ادارة المدرسه الطالب:" Font-Italic="False" 
                            Font-Names="Andalus"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="LblName" runat="server" Font-Bold="True" Font-Size="20px" 
                    ForeColor="Red" Text='<%# Bind("stu_name") %>' Font-Names="Andalus"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="20px" 
                    ForeColor="#9900FF" Text="الصف: " Font-Names="Andalus"></asp:Label>
                        <asp:Label ID="LblSaf" runat="server" Font-Bold="True" Font-Size="20px" 
                    ForeColor="#9900FF" Text='<%# Bind("alsofof") %>' Font-Names="Andalus"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="20px" 
                    ForeColor="#9900FF" Text="الفصل: " Font-Names="Andalus"></asp:Label>
                        <asp:Label ID="LblFasl" runat="server" Font-Bold="True" Font-Size="20px" 
                    ForeColor="#9900FF" Text='<%# Bind("fasl") %>' Font-Names="Andalus"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" style="text-align: center">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="20px" 
                    ForeColor="#9900FF" Text="بيوم ميلاده" Font-Names="Andalus"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" style="text-align: center">
                        &nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
    </asp:DataList>
</div>