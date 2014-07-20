<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrnInstructorRating.ascx.cs" Inherits="UC_TrnInstructorRating" %>
<style type="text/css">
    .style3
    {
        width: 491px;
        text-align: center;
    }
    .style4
    {
        text-align: center;
    }
    .style5
    {
        height: 30px;
    }
    .style6
    {
        text-align: center;
    }
</style>
<div dir="rtl" class="style4">
<br />
    <table class="style3" dir="rtl">
        <tr>
            <td class="style6">
                <asp:Label ID="Label1" runat="server" Text="المدربيــــــــن"></asp:Label>
                <asp:DropDownList ID="DDLIns" runat="server" AutoPostBack="True" Height="20px" 
                    onselectedindexchanged="DDLIns_SelectedIndexChanged" Width="226px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
    <asp:GridView ID="GVRating" runat="server" AutoGenerateColumns="False" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None" Width="400px">
        <Columns>
            <asp:BoundField DataField="EvalItemId" HeaderText="EvalItemId" 
                Visible="False" />
            <asp:BoundField DataField="EvalItemName" HeaderText="اســم نوع التقييـــــم" />
            <asp:TemplateField HeaderText="التقييــــــــم">
                <ItemTemplate>
                    <asp:DropDownList ID="DDLRate" runat="server" Width="99px">
                        <asp:ListItem Selected="True">----لا شيء----</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="style5">
    <asp:Button ID="BtnSave" runat="server" Text="حفـــــــــظ" 
        onclick="BtnSave_Click" Width="100px" />
<asp:Label ID="LblState" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
        <br />
        
</div>