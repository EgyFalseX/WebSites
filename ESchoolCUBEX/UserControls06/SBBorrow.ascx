<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SBBorrow.ascx.cs" Inherits="UserControl_SBBorrow" %>
<%@ Register src="SBBookDetials.ascx" tagname="SBBookDetials" tagprefix="uc1" %>
<style type="text/css">
    .SBBorrowstyle1
    {
            direction: ltr;
        width: 600px;
        margin-left: 0px;
    }
    .SBBorrowstyle1style2
    {
        width: 141px;
    }
    .SBBorrowstyle1style3
    {
        height: 55px;
    }
    </style>
<div dir="rtl">
                <asp:GridView ID="GridViewBooks" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" EmptyDataText="لا يوجد كتب هنــــــــا" ForeColor="#333333" 
                    GridLines="None" onselectedindexchanged="GridViewBooks_SelectedIndexChanged" 
                    style="direction: rtl" Width="700px">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="number" HeaderText="الرقم العام" />
                        <asp:BoundField DataField="name_book" HeaderText="اسم الكتاب" />
                        <asp:BoundField DataField="date" HeaderText="تاريخ الاستعاره" />
                        <asp:BoundField DataField="date_er" HeaderText="تاريخ الارجاع" />
                        <asp:BoundField DataField="date_f" HeaderText="التاريخ الفعلي" />
                        <asp:CommandField SelectText="تفاصيل الكتاب" ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            <asp:Panel ID="PanelBookDetials" runat="server" Width="429px" Visible="False" 
                    style="text-align: right">
                <uc1:SBBookDetials ID="SBBookDetials1" runat="server" Visible="True" />
            </asp:Panel>
</div>
    
        


    
        
