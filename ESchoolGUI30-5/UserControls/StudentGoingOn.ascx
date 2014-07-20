<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentGoingOn.ascx.cs" Inherits="UserControls_StudentGoingOn" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 487px;
        text-align: right;
    }
    .style2
    {
        width: 280px;
    }
    .style3
    {
        width: 559px;
    }
</style>
<div id="goon" runat="server" dir="rtl">
    <br />
&nbsp;&nbsp;&nbsp;
    <br />
    <table style="width:83%;">
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    RepeatDirection="Horizontal" Width="642px">
                    <asp:ListItem Value="0">الكل</asp:ListItem>
                    <asp:ListItem Value="1">حسب حالة الرد</asp:ListItem>
                    <asp:ListItem Value="2">ملاحظات اليوم</asp:ListItem>
                    <asp:ListItem Value="3">ملاحظات الأمس</asp:ListItem>
                    <asp:ListItem Value="4">ملاحظات هذا الشهر</asp:ListItem>
                    <asp:ListItem Value="5">ملاحظات في الفترة</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="style1">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" Visible="false" 
                    AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:Panel ID="Panel1" runat="server" Visible = "false" 
                    style="text-align: left" Width="604px">
                    <table style="width: 97%;">
                        <tr>
                            <td class="style2">
                                <asp:Label ID="Label2" runat="server" Text="التاريخ الأول"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="gr"></asp:TextBox>
                            </td>
                            <td class="style3">
                                <asp:Label ID="Label3" runat="server" Text="التاريخ الثاني"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" ValidationGroup="gr"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                    ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="ادخل تاريخا صحيحا" 
                                    MaximumValue="1/1/2100" MinimumValue="1/1/1980" Type="Date" 
                                    ValidationGroup="gr"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox2" Display="Dynamic" 
                                    ErrorMessage="*" ValidationGroup="gr"></asp:RequiredFieldValidator>
                            </td>
                            <td class="style3">
                                &nbsp;</td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ErrorMessage="*" ControlToValidate="TextBox3" ValidationGroup="gr"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" Display="Dynamic" 
                                    ErrorMessage="ادخل تاريخا صحيحا" ControlToValidate="TextBox3" 
                                    MaximumValue="1/1/2100" MinimumValue="1/1/1980" Type="Date" 
                                    ValidationGroup="gr"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                &nbsp;</td>
                            <td>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Animated="true" 
                                    TargetControlID="TextBox2" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                            </td>
                            <td class="style3">
                                <asp:Button ID="Button1" runat="server" Text="عرض" onclick="Button1_Click" 
                                    ValidationGroup="gr" />
                            </td>
                            <td>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Animated="true" 
                                    TargetControlID="TextBox3" Format="dd/MM/yyyy">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                    </table>
                    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataKeyNames="id" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="عنوان الملاحظة" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text='<%# Bind("title") %>' 
                        CommandArgument='<%# Bind("id") %>' onclick="LinkButton1_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="add_date" 
                HeaderText="تاريخ وضع الملاحظة" />
            <asp:TemplateField HeaderText="حالة الرد">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("reply_code") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ondatabinding="Label1_DataBinding" 
                        Text='<%# Bind("reply_code") %>'></asp:Label>
                </ItemTemplate>
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