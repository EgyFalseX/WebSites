<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPHolidays.ascx.cs" Inherits="UserControls_Holidays" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="ÇáÃÌÇÒÇÊ" OnPreRender="GridView1_PreRender" AllowPaging="True" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="äæÚ ÇáÃÌÇÒÉ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ßæÏ_äæÚ_ÇáÇÌÇÒÉ") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_HolidayType" runat="server" OnDataBinding="lbl_HolidayType_DataBinding"
                        Text='<%# Bind("ßæÏ_äæÚ_ÇáÇÌÇÒÉ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÊÇÑíÎ_ÇáÇÌÇÒÉ" HeaderText="ÊÇÑíÎ ÈÏÁ ÇáÃÌÇÒÉ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÊÇÑíÎ_ÇäÊåÇÁ_ÇáÇÌÇÒå" HeaderText="ÊÇÑíÎ ÅäÊåÇÁ ÇáÃÌÇÒÉ" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÑÞã_ÇáÞÑÇÑ" HeaderText="ÑÞã ÇáÞÑÇÑ" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ÌåÉ ÇáÃÌÇÒÉ">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server"></asp:Label><asp:HiddenField ID="HiddenField2"
                        runat="server" Value='<%# Bind("ßæÏ_ÌåÉ_ÇáÇÌÇÒÉ") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Bind("ßæÏ_ÌåÉ_ÇáÇÌÇÒÉ") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ÇáÚÇã">
                <EditItemTemplate>
                    &nbsp;
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("code_year") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp;
                    <asp:Label ID="Label1" runat="server" OnDataBinding="Label1_DataBinding"></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("code_year") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>