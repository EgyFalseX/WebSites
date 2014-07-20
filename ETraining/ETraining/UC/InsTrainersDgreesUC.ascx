<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InsTrainersDgreesUC.ascx.cs" Inherits="UC_InsTrainersDgreesUC" %>
<style type="text/css">
    .style1
    {
        width: 334px;
        height: 44px;
    }
    .style2
    {
        width: 85px;
    }
    .style3
    {
        width: 625px;
    }
    .style4
    {
        width: 58px;
    }
    .style6
    {
        width: 100px;
    }
    .style10
    {
    }
    .style11
    {
        width: 158px;
    }
    .style12
    {
        width: 78px;
    }
    .style13
    {
        text-align: center;
    }
</style>
<div dir="rtl" class="style13">
    <table class="style1" dir="rtl">
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="أسماء الدورات"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLCourses" runat="server" Height="23px" Width="250px" 
                    onselectedindexchanged="DDLCourses_SelectedIndexChanged" 
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <asp:Panel ID="PnlCourseInfo" runat="server" Visible="False">
        <table class="style3" dir="rtl">
            <tr>
                <td class="style4">
                    <asp:Label ID="Label2" runat="server" Text="اسم الدوره"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="LblName" runat="server"></asp:Label>
                </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style12">
                    <asp:Label ID="Label5" runat="server" Text="الدرجه العظمي"></asp:Label>
                </td>
                <td class="style10">
                    <asp:Label ID="LblMaxDgree" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Label ID="Label4" runat="server" Text="من تاريخ"></asp:Label>
                </td>
                <td class="style11">
                    <asp:Label ID="LblDate1" runat="server"></asp:Label>
                </td>
                <td class="style6">
                    &nbsp;</td>
                <td class="style12">
                    <asp:Label ID="Label6" runat="server" Text="الي تاريخ"></asp:Label>
                </td>
                <td class="style10">
                    <asp:Label ID="LblDate2" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <div class="style13">
    <asp:GridView ID="GVDgrees" runat="server" AutoGenerateColumns="False" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None" 
        onrowediting="GVDgrees_RowEditing" onrowupdating="GVDgrees_RowUpdating" 
        Width="625px">
        <Columns>
            <asp:BoundField DataField="EmpName" HeaderText="اسم المتـــدرب" />
            <asp:BoundField DataField="EmpId" HeaderText="EmpId" Visible="False" />
            <asp:BoundField DataField="TRshehId" HeaderText="TRshehId" Visible="False" />
            <asp:TemplateField HeaderText="الدرجـــــــــه">
                <ItemTemplate>
                    <asp:TextBox ID="TxtDgree" runat="server" Height="20px"  Text='<%# bind("Dgree") %>' 
                        Width="100px" AutoPostBack="True" ontextchanged="TxtDgree_TextChanged"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" EditText="حفــــــــــظ" 
                ShowEditButton="True">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
    </div>
    <br />
    <asp:Label ID="LblState" runat="server" ForeColor="Red" Visible="False"></asp:Label>
</div>