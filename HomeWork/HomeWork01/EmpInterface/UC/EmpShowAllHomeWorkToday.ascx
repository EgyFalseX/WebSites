<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpShowAllHomeWorkToday.ascx.cs" Inherits="UserControls_EmpShowHomeWork" %>
<div id="hw" runat="server" dir="rtl">
    <table>
        <tr>
            <td style="width: 229px">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ÇÎÊÑ Çáíæã"
                    Width="122px" Font-Bold="True" Font-Underline="True" />
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC"
                    BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
                    Font-Size="8pt" ForeColor="#003399" Height="68px" OnSelectionChanged="Calendar1_SelectionChanged"
                    Width="130px" Visible="False">
                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                    <WeekendDayStyle BackColor="#CCCCFF" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                    <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True"
                        Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="width: 229px">
<asp:GridView ID="gr_HomeW" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Caption="ÚÑÖ ÇáæÇÌÈÇÊ" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" Width="556px" Font-Bold="True" OnPageIndexChanging="gr_HomeW_PageIndexChanging">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="ÇáÕÝ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("alsofof_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblElsaf" runat="server" OnDataBinding="lblElsaf_DataBinding" Text='<%# Bind("alsofof_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ÇáÝÕá">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("fasl_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblElfasl" runat="server" OnDataBinding="lblElfasl_DataBinding" Text='<%# Bind("fasl_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ÇáÍÕÉ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("hasa_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblAlhesa" runat="server" OnDataBinding="lblAlhesa_DataBinding" Text='<%# Bind("hasa_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ÇáãÇÏÉ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("mawad_no") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblMada" runat="server" OnDataBinding="lblMada_DataBinding" Text='<%# Bind("mawad_no") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Çáíæã">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("daycode") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblDayname" runat="server" OnDataBinding="lblDayname_DataBinding"
                    Text='<%# Bind("daycode") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="add_date" HeaderText="ÇáÊÇÑíÎ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="ÇáÍÇáÉ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("read_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" OnDataBinding="lblStatus_DataBinding" Text='<%# Bind("read_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <RowStyle BackColor="#EFF3FB" />
    <EditRowStyle BackColor="#2461BF" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 229px">
            </td>
        </tr>
    </table>
</div>
