<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpAllMotabaForDay.ascx.cs" Inherits="UserControls_EmpshowHWforAstudent" %>
<div id="Smt" runat="server" dir="rtl">
   <center>
       <table>
           <tr>
               <td style="width: 2px">
                   &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ÇÎÊÑ Çáíæã" /></td>
               <td style="width: 3px">
   
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC"
    BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
    Font-Size="8pt" ForeColor="#003399" Height="77px" ShowGridLines="True" Visible="False"
    Width="137px" OnSelectionChanged="Calendar1_SelectionChanged">
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
               <td style="width: 2px">
               </td>
               <td style="width: 3px">
<asp:GridView ID="gr_StudentMotaba" runat="server" AllowPaging="True" dir="rtl"
    ForeColor="#333333" GridLines="None" HorizontalAlign="Center"  Caption="ÚÑÖ ÇáãÊÇÈÚÇÊ áåÐÇ Çáíæã" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" Width="686px" AutoGenerateColumns="False" CaptionAlign="Top" OnPageIndexChanging="gr_StudentMotaba_PageIndexChanging">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="ÇÓã ÇáØÇáÈ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stu_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblStudname" runat="server" OnDataBinding="lblStudname_DataBinding"
                    Text='<%# Bind("stu_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="add_date" HeaderText="ÇáÊÇÑíÎ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="title" HeaderText="ÚäæÇä ÇáãÊÇÈÚÉ" HtmlEncode="False">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="notice" HeaderText="ãáÇÍÙÉ ÇáãÚáã">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="ÇáÍÇáÉ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("read_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" OnDataBinding="lblStatus_DataBinding" Text='<%# Bind("reply_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="reply" HeaderText="ÑÏ æáí ÇáÃãÑ" />
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
       </table>
   
    </center>
</div>

