<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InsTrainerAttendanceUC.ascx.cs" Inherits="UC_InsTrainerAttendanceUC" %>
<style type="text/css">
    .style1
    {
        width: 331px;
    }
    .style2
    {
        width: 71px;
    }
    .style3
    {
        text-align: center;
    }
</style>
<div dir="rtl" class="style3">

    <table class="style1" dir="rtl" align="center">
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="اختار الدوره"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLCourses" runat="server" Height="21px" Width="251px" 
                    AutoPostBack="True" onselectedindexchanged="DDLCourses_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    

    <div class="style3">
    

    <asp:GridView ID="GridViewTrainers" runat="server" AutoGenerateColumns="False" 
        CellPadding="2" ForeColor="Black" GridLines="None" Width="509px" 
            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
        <Columns>
            <asp:BoundField DataField="EmpName" HeaderText="اســـم المتدرب" />
            <asp:BoundField DataField="NiId" HeaderText="الرقــم القومــي" />
            <asp:BoundField DataField="EmpId" HeaderText="EmpId" Visible="False" />
            <asp:BoundField DataField="TRshehId" HeaderText="TRshehId" Visible="False" />
            <asp:TemplateField HeaderText="حضــــــــــر">
                <EditItemTemplate>
                    <asp:CheckBox ID="CBAttended" runat="server"  ToolTip='<%# Bind("EmpId") %>' Checked='<%# Bind("Attended") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CBAttended" runat="server"  ToolTip='<%# Bind("EmpId") %>' Checked='<%# Bind("Attended") %>' />
                </ItemTemplate>
            </asp:TemplateField>
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

    <asp:Button ID="BtnSaveAtt" runat="server" onclick="BtnSaveAtt_Click" 
        Text="حفـــــــظ" Width="170px" Enabled="False" />
        <br />
    <asp:Label ID="LblState" runat="server" ForeColor="Red" Visible="False"></asp:Label>

</div>
<p style="direction: ltr">
    &nbsp;</p>
