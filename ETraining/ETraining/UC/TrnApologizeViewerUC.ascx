<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrnApologizeViewerUC.ascx.cs" Inherits="UC_TrnApologizeViewerUC" %>
<style type="text/css">
    .style1
    {
        width: 352px;
        height: 123px;
    }
    .style2
    {
        width: 78px;
    }
</style>
<div dir="rtl">
    <asp:Label ID="LblState" runat="server" ForeColor="Red" Visible="False" 
        style="text-align: center"></asp:Label>
    <table class="style1" dir="rtl" align="center">
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="اسم الدوره"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LblCourseName" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="تاريخ الأعتزار"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LblApologizeDate" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label3" runat="server" Text="سبب الأعتزار"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtReason" runat="server" Height="67px" TextMode="MultiLine" 
                    Width="264px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnAdd" runat="server" Text="اعتـــــــــــزار" Width="149px" 
                    onclick="BtnAdd_Click" />
            </td>
        </tr>
    </table>

</div>
<br />
<div dir="rtl">

    <asp:GridView ID="GridViewApologize" runat="server" AutoGenerateColumns="False" 
        CellPadding="2" ForeColor="Black" GridLines="None" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        style="text-align: center" Width="700px">
        <Columns>
            <asp:BoundField DataField="DowraName" HeaderText="اسم الـــدوره" />
            <asp:BoundField DataField="ApologyDate" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="تاريخ الأعتـــزار" />
            <asp:BoundField DataField="ApologyReson" HeaderText="سبب الأعتـــزار" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>

</div>