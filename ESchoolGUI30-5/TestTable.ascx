<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TestTable.ascx.cs" Inherits="TestTable" %>
<style type="text/css">
    .style1
    {
        width: 37%;
    }
    .style2
    {
        width: 38px;
    }
    .style3
    {
        width: 20%;
    }
    .style4
    {
        width: 45px;
    }
    .style13
    {
        width: 103%;
    }
    .style14
    {
        color: #FFFFFF;
    }
    .style15
    {
        color: #FFFFFF;
        font-weight: bold;
    }
</style>
<body style="text-align: center">
    <table class="style1" dir="rtl">
        <tr>
            <td colspan="5" style="text-align: center">
                <asp:Label ID="Label3" runat="server" 
                    style="font-weight: 700; font-size: large" Text="جدول الامتحانات"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="الترم"></asp:Label>
            </td>
            <td class="style4">
                <asp:DropDownList ID="dropTerm" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="dropTerm_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" style="font-weight: 700" Text="التقويم"></asp:Label>
            </td>
            <td style="text-align: right">
                <asp:DropDownList ID="dropteqym" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" style="font-weight: 700" Text="الصف"></asp:Label>
            </td>
            <td class="style4">
                <asp:DropDownList ID="dropClass" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btntestTable" runat="server" onclick="btntestTable_Click" 
                    style="font-weight: 700" Text="عرض الجدول" />
            </td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <p>
        <br />
        
</p>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    style="direction: rtl" CellPadding="4" ForeColor="#333333" 
    GridLines="None" onprerender="GridView1_PreRender">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:BoundField DataField="mawad_no" HeaderText="المادة" />
        <asp:TemplateField HeaderText="اليوم">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("daycode") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:HiddenField ID="HiddenField1" Value='<% #Bind("daycode")%>' runat="server" />
                <asp:Label ID="Label1" runat="server" Text=''></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="testdate" HeaderText="التاريخ" />
        <asp:TemplateField HeaderText="صباحى">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("men_s") %>'></asp:TextBox>
            </EditItemTemplate>
            <HeaderTemplate>
                <table class="style13" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="text-align: center; font-weight: 700;" 
                            colspan="2" class="style14">
                            صباحى</td>
                    </tr>
                    <tr>
                        <td style="text-align: center;" class="style15">
                            من</td>
                        <td style="font-weight: 700; text-align: center; " class="style14">
                            الى</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
            
                 <table cellpadding="0" cellspacing="0" class="style13">
                                <tr>
                                    <td style="text-align: center;">
                                          <asp:Label ID="Label5" runat="server" Text='<%# Bind("men_s") %>'></asp:Label>
                                    </td>
                                    <td style="text-align: center;">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                    <td style="  text-align: center;">
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("ela_s") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
               
            </ItemTemplate>
            <ItemStyle BorderStyle="Solid" Width="50px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="مسائي">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("men_m") %>'></asp:TextBox>
            </EditItemTemplate>
            <HeaderTemplate>
                <table cellpadding="0" cellspacing="0" class="style13">
                    <tr>
                        <td colspan="2" 
                            style="text-align: center; font-weight: 700; " class="style14">
                            مسائي</td>
                    </tr>
                    <tr>
                        <td style=" text-align: center; font-weight: 700;" class="style14">
                            من</td>
                        <td style="font-weight: 700; text-align: center;" class="style14">
                            الى</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                
                            <table cellpadding="0" cellspacing="0" class="style13">
                                <tr>
                                    <td style="text-align: center;">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("men_m") %>'></asp:Label>
                                    </td>
                                    <td style="text-align: center;">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                                    <td style="  text-align: center;">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ela_m") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        
                
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="time_ans" HeaderText="زمن الاجابة" />
        <asp:BoundField DataField="nots1" HeaderText="ملاحظات" />
    </Columns>
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
  
    
<p>
    &nbsp;</p>
   
    
