<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrnCourseTrainerViewerUC.ascx.cs" Inherits="UC_TrnCourseTrainerViewerUC" %>
<div dir="rtl">
    <asp:GridView ID="GridViewTrainerViewer" runat="server" 
        AutoGenerateColumns="False" CellPadding="2" ForeColor="Black" 
        GridLines="None" EmptyDataText="لا يوجد مدربيـــن" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        style="text-align: center" Width="500px">
        <Columns>
            <asp:BoundField DataField="EmpName" HeaderText="اسم المـــدرب" />
            <asp:BoundField DataField="JobName" 
                HeaderText="وظيفــة المدرب" />
            <asp:BoundField DataField="email" 
                HeaderText="بريـــد المـــدرب" />
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
<br />
    <asp:Label ID="LblState" runat="server" ForeColor="Red" Visible="False" 
        style="text-align: center"></asp:Label>
</div>