<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddInfoGrid.ascx.cs" Inherits="UserControls_AddInfoGride" %>
                <asp:GridView ID="GridViewInfo" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="id_info" 
                    onselectedindexchanged="GridViewInfo_SelectedIndexChanged" 
        BackColor="White" BorderColor="#999999" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
                    style="direction: rtl" Width="568px" Height="294px" 
    AllowPaging="True" onpageindexchanging="GridViewInfo_PageIndexChanging">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="date_info" HeaderText="التـــــــــــــاريخ" 
                            DataFormatString="{0:dd/MM/yyyy}" SortExpression="date_info" >
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name_info" HeaderText="المعـــــلومات" 
                            SortExpression="name_info" >
                        <ItemStyle Width="200px" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="id_info" HeaderText="id_info" InsertVisible="False" 
                            ReadOnly="True" Visible="False" />
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" 
                            SelectText="حذف" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="Gainsboro" />
                </asp:GridView>
                
              