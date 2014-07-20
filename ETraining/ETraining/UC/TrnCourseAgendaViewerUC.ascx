<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrnCourseAgendaViewerUC.ascx.cs" Inherits="UC_TrnCourseAgendaViewerUC" %>
<div dir="rtl">
    <asp:GridView ID="GridViewAgendaViewer" runat="server" 
        AutoGenerateColumns="False" CellPadding="2" ForeColor="Black" 
        GridLines="None" EmptyDataText="لا يوجد اجندات" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        style="text-align: center" Width="700px">
        <Columns>
            <asp:BoundField DataField="DowraId" HeaderText="DowraId" Visible="False" />
            <asp:BoundField DataField="ADate" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="تاريخ الاجنده" />
            <asp:BoundField DataField="TimeFrom" DataFormatString="{0:t}" 
                HeaderText="من الساعه" />
            <asp:BoundField DataField="TimeTo" DataFormatString="{0:t}" 
                HeaderText="الي الســاعه" />
            <asp:BoundField DataField="subject" HeaderText="موضـــوع الاجنـــده" />
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