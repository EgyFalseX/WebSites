<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPMainInformations.ascx.cs" Inherits="MInformationl" %>
<div dir ="rtl" id="anydiv" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" Height="50px" Width="379px" 
        AutoGenerateRows="False" AllowPaging="True" EmptyDataText="��� �� ������ �� ���  �����" EnableViewState="False" FooterText="Main Information" HeaderText="�������� ��������" HorizontalAlign="Right" OnPageIndexChanging="DetailsView1_PageIndexChanging">
<FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></FooterStyle>

<CommandRowStyle BackColor="#D1DDF1" Font-Bold="True"></CommandRowStyle>

<EditRowStyle BackColor="#2461BF"></EditRowStyle>

<RowStyle BackColor="#EFF3FB"></RowStyle>

<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center"></PagerStyle>
<Fields>
<asp:TemplateField HeaderText="�������"><EditItemTemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("edara") %>'></asp:TextBox> 
</EditItemTemplate>
<InsertItemTemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("edara") %>'></asp:TextBox> 
</InsertItemTemplate>
<ItemTemplate>
    <asp:Label ID="lbl_Edara" runat="server" OnDataBinding="lbl_Edara_DataBinding" Text='<%# Bind("NOEDARET") %>'></asp:Label>
</ItemTemplate>
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="�������"><EditItemTemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("����������") %>'></asp:TextBox> 
</EditItemTemplate>
<InsertItemTemplate>
<asp:TextBox id="TextBox2" runat="server" Text='<%# Bind("����������") %>'></asp:TextBox> 
</InsertItemTemplate>
<ItemTemplate>
<asp:Label id="lbl_Elmarhla" runat="server" Text='<%# Bind("����������") %>' OnDataBinding="lbl_Elmarhla_DataBinding"></asp:Label> 
</ItemTemplate>
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
<asp:TemplateField HeaderText="�������"><EditItemTemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("NOSCHOOL") %>'></asp:TextBox> 
</EditItemTemplate>
<InsertItemTemplate>
<asp:TextBox id="TextBox4" runat="server" Text='<%# Bind("NOSCHOOL") %>'></asp:TextBox> 
</InsertItemTemplate>
<ItemTemplate>
<asp:Label id="lbl_School" runat="server" Text='<%# Bind("NOSCHOOL") %>' OnDataBinding="lbl_School_DataBinding"></asp:Label> 
</ItemTemplate>
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
    <asp:BoundField DataField="�������" HeaderText="�������" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:BoundField>
<asp:TemplateField HeaderText="�������"><EditItemTemplate>
<asp:TextBox id="TextBox5" runat="server" Text='<%# Bind("�������") %>'></asp:TextBox> 
</EditItemTemplate>
<InsertItemTemplate>
<asp:TextBox id="TextBox5" runat="server" Text='<%# Bind("�������") %>'></asp:TextBox> 
</InsertItemTemplate>
<ItemTemplate>
<asp:Label id="lbl_Nationality" runat="server" Text='<%# Bind("�������") %>' OnDataBinding="lbl_Nationality_DataBinding"></asp:Label> 
</ItemTemplate>
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
    <asp:BoundField DataField="SEX" HeaderText="�����" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:BoundField>
<asp:BoundField DataField="BIRTHD" HeaderText="����� �������" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}">
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundField>
<asp:TemplateField HeaderText="������ ����������"><EditItemTemplate>
<asp:TextBox id="TextBox8" runat="server" Text='<%# Bind("STAT") %>'></asp:TextBox> 
</EditItemTemplate>
<InsertItemTemplate>
<asp:TextBox id="TextBox8" runat="server" Text='<%# Bind("STAT") %>'></asp:TextBox> 
</InsertItemTemplate>
<ItemTemplate>
<asp:Label id="lbl_MStatus" runat="server" Text='<%# Bind("STAT") %>' OnDataBinding="lbl_MStatus_DataBinding"></asp:Label> 
</ItemTemplate>
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
<asp:BoundField DataField="���_��������" HeaderText="� ������">
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundField>
<asp:BoundField DataField="�������" HeaderText="�������">
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundField>
    <asp:TemplateField HeaderText="������">
        <EditItemTemplate>
            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CERT1") %>'></asp:TextBox>
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("CERT1") %>'></asp:TextBox>
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Label ID="lbl_Qualifieds" runat="server" OnDataBinding="lbl_Qualifieds_DataBinding"
                Text='<%# Bind("CERT1") %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
    </asp:TemplateField>
<asp:BoundField DataField="TAT" HeaderText="������� ">
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundField>
<asp:TemplateField HeaderText="������ ���� ������"><EditItemTemplate>
<asp:TextBox id="TextBox7" runat="server" Text='<%# Bind("���������") %>'></asp:TextBox> 
</EditItemTemplate>
<InsertItemTemplate>
<asp:TextBox id="TextBox7" runat="server" Text='<%# Bind("���������") %>'></asp:TextBox> 
</InsertItemTemplate>
<ItemTemplate>
<asp:Label id="lbl_Almadah" runat="server" Text='<%# Bind("���������") %>' OnDataBinding="lbl_Almadah_DataBinding"></asp:Label> 
</ItemTemplate>
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:TemplateField>
<asp:BoundField DataField="ADDRESS" HeaderText="�������">
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundField>
<asp:BoundField DataField="������_����������" HeaderText="������ ����������">
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
</asp:BoundField>
</Fields>

<FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True"></FieldHeaderStyle>

<HeaderStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>

<AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
</asp:DetailsView>
    </div>