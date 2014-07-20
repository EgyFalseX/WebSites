<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Admin.ascx.cs" Inherits="Admin" %>
<style type="text/css">
    .style1
    {
        width: 600px;
    }
    .style2
    {
    }
    .style3
    {
        width: 221px;
    }
</style>
<div dir="rtl">
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="العنوان"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="TxtNewsTitle" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <asp:Label ID="Label2" runat="server" Text="التفاصيل"></asp:Label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="TxtNewsContain" runat="server" Height="136px" 
                    TextMode="MultiLine" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Label ID="Label3" runat="server" Text="من"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Text="الي"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Calendar ID="CNewsStartDate" runat="server" BackColor="White" 
                    BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
                    Font-Size="9pt" ForeColor="Black" Height="100px" NextPrevFormat="ShortMonth" 
                    Width="150px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                        Height="8pt" />
                    <DayStyle BackColor="#CCCCCC" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                        Font-Size="12pt" ForeColor="White" Height="12pt" />
                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                </asp:Calendar>
            </td>
            <td>
                <asp:Calendar ID="CNewsEndDate" runat="server" BackColor="White" 
                    BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
                    Font-Size="9pt" ForeColor="Black" Height="100px" NextPrevFormat="ShortMonth" 
                    Width="150px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                        Height="8pt" />
                    <DayStyle BackColor="#CCCCCC" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
                        Font-Size="12pt" ForeColor="White" Height="12pt" />
                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <asp:Label ID="Label5" runat="server" Text="اللغه"></asp:Label>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="DDLLangID" runat="server" Width="100px">
                    <asp:ListItem Selected="True" Value="1">عربي</asp:ListItem>
                    <asp:ListItem Value="2">انجليزي</asp:ListItem>
                    <asp:ListItem Value="3">روسي</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td colspan="2">
                <asp:Button ID="btnsave" runat="server" onclick="btnsave_Click" Text="حفظ" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="3" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>
    <p>
    </p>
    <table align="center" dir="rtl">
        <tr>
            <td>
                <asp:GridView ID="GridViewNews" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" 
                    ForeColor="#333333" GridLines="None" Width="600px" 
                    onpageindexchanging="GridViewNews_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="NewsTitle" HeaderText="العنوان">
                        <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NewsStartDate" HeaderText="من">
                        <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NewsEndDate" HeaderText="الي">
                        <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LangName" HeaderText="اللغه">
                        <HeaderStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:Button ID="BtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="" Font-Bold="True" Font-Size="14px" onclick="BtnDelete_Click" onclientclick="javascript: return confirm('هل انت متاكد ؟')"
                                    Text="حذف" Width="80px" />
                                <asp:HiddenField ID="HiddenFieldNewsID" runat="server" 
                                    Value="<%# bind('NewsID') %>" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</div>