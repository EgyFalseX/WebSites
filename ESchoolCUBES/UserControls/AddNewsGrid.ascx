<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddNewsGrid.ascx.cs" Inherits="UserControls_AddNewsGride" %>
              
              
<asp:GridView ID="GridViewNews" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="code_news" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged" 
        onprerender="GridView2_PreRender" CellPadding="4" GridLines="None" 
                    style="direction: rtl" Width="568px" Height="294px" 
    AllowPaging="True" onpageindexchanging="GridViewNews_PageIndexChanging1" 
    ForeColor="#333333">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:BoundField DataField="news_title" HeaderText="العنوان" >
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="news_details" HeaderText="التفاصيل" >
                        <ItemStyle Width="200px" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Timeline" HeaderText="التاريخ" 
                            DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="يعرض">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" 
                                    oncheckedchanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_starting") %>'></asp:TextBox>
                                <asp:HiddenField ID="HiddenField1" Value="<% # Bind('code_news') %>" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" Value = '<%# Bind("id_starting") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" Value="<% # Bind('code_news') %>" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" Value = '<%# Bind("id_starting") %>' />
                               

                                <br />
                                <asp:CheckBox ID="CheckBox1" runat="server" 
                                    oncheckedchanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="code_news" HeaderText="code_news" Visible="False" />
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" 
                            SelectText="حذف" />
                    </Columns>
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="Gainsboro" />
                </asp:GridView>
                