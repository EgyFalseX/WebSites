<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Absence.ascx.cs" Inherits="UserControls_Absence" %>
<div style="direction: rtl">
    
        <asp:GridView ID="GVAllAbsence" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="Vertical" style="direction: rtl" 
            EmptyDataText="الطالب ليس له سجل في هذا القسم">
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="SPOS" HeaderText="م" />
                <asp:BoundField DataField="date" DataFormatString="{0:yyyy}" 
                    HeaderText="العام" />
                <asp:BoundField DataField="FalseX" HeaderText="نوع الغيــاب" />
                <asp:BoundField DataField="eyab_date_from" DataFormatString="{0:yyyy/MM/dd}" 
                    HeaderText="مــــن" />
                <asp:BoundField DataField="eyab_date_to" DataFormatString="{0:yyyy/MM/dd}" 
                    HeaderText="الـــــي" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
        </asp:GridView>
    
    </div>
    <br />
    
    <div style="direction: rtl">
    
        <asp:GridView ID="GVAbsenceCount" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="Vertical" style="direction: rtl">
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <Columns>
                <asp:BoundField DataField="No" HeaderText="م" />
                <asp:BoundField DataField="AbsenceType" HeaderText="نوع الغيــاب" />
                <asp:BoundField DataField="AbsenceCounter" 
                    HeaderText="الاجمالــــي" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#DCDCDC" />
        </asp:GridView>
    
    </div>