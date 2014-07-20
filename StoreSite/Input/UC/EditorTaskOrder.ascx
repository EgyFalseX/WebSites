<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorTaskOrder.ascx.cs" Inherits="EditorTaskOrder" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 700px;
    }
    .style2
    {
        width: 483px;
    }
    .style3
    {
        width: 454px;
    }
    .style5
    {
        width: 73px;
    }
</style>
<div dir="rtl" style="text-align: center">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1" dir="rtl">
        <tr>
            <td style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DDLFilter" runat="server" 
                    onselectedindexchanged="DDLFilter_SelectedIndexChanged" Width="200px" 
                    AutoPostBack="True" Visible="False">
                    <asp:ListItem Selected="True" Value="0">لم يتم التكليف</asp:ListItem>
                    <asp:ListItem Value="1">تم التكليف</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridViewCom" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
                    GridLines="None" onselectedindexchanged="GridViewCom_SelectedIndexChanged" 
                    AllowPaging="True" onpageindexchanging="GridViewCom_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField SelectText="التفاصيل" ShowSelectButton="True" >
                        <ItemStyle Font-Bold="True" Font-Size="14px" ForeColor="Blue" />
                        </asp:CommandField>
                        <asp:TemplateField HeaderText="اسم الشركة">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("HeadCompanyName") %>'></asp:Label>
                                <asp:HiddenField ID="HiddenFieldCommId" runat="server" 
                                    Value='<%# Bind("CommId") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HeadCompanyName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CommDate" HeaderText="تاريخ الابلاغ" 
                            DataFormatString="{0:D}" />
                        <asp:BoundField DataField="Customer" HeaderText="العميل" />
                        <asp:BoundField DataField="MaintenanceDate" 
                            HeaderText="التاريخ المحدد للزيارة" />
                        <asp:BoundField DataField="CommDes" HeaderText="ملاحظات" />
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
        <tr>
            <td bgcolor="Yellow">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <cc1:TabContainer ID="TabContainerDetails" runat="server" ActiveTabIndex="0" 
                    Width="499px" Font-Bold="True" Font-Size="14px" ForeColor="Black" 
                    Visible="False">
                    <cc1:TabPanel runat="server" HeaderText="نــوع الخــدمة" ID="TabPanel1">
                        <ContentTemplate>
                            <asp:Panel ID="PnlTask" runat="server">
                            <table align="center" class="style2" dir="rtl">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="نوع الخدمه" Font-Bold="True" 
                                            Font-Size="14px" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td style="text-align: right">
                                        <asp:DropDownList ID="DDLServiceTypeId" runat="server" Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="تاريخ التنفيذ" Font-Bold="True" 
                                            Font-Size="14px" ForeColor="Black"></asp:Label>
                                    </td>
                                    <td style="text-align: right; margin-right: 40px;">
                                        <asp:TextBox ID="TxtTaskOrderdate" runat="server" Width="200px"></asp:TextBox>
                                        <cc1:CalendarExtender ID="TxtTaskOrderdate_CalendarExtender" runat="server" 
                                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtTaskOrderdate">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td style="text-align: right">
                                        <asp:Button ID="BtnAddTask" runat="server" onclick="BtnAddTask_Click" 
                                            Text="اضافه" Width="100px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="GridViewTaskOrder" runat="server" AutoGenerateColumns="False" 
                                            CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
                                            GridLines="None" 
                                            onselectedindexchanged="GridViewTaskOrder_SelectedIndexChanged">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:BoundField DataField="ServiceTypeName" HeaderText="نوع الخدمه" />
                                                <asp:BoundField DataField="TaskOrderdate" HeaderText="تاريخ التنفيذ" 
                                                    DataFormatString="{0:D}" />
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                            CommandName="Select" Text="التفاصيل" Font-Bold="True" Font-Size="14px" 
                                                            ForeColor="Blue"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="حذف">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="BtnDelTask" runat="server" Height="26px" 
                                                            ImageUrl="~/Images/Delete.png" onclick="BtnDelTask_Click" 
                                                            onclientclick="javascript: return confirm('هل انت متاكد ؟')" 
                                                            Width="26px" />
                                                        <asp:HiddenField ID="HiddenFieldTaskOrderId" runat="server" 
                                                            Value='<%# Bind("TaskOrderId") %>' />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                    </EditItemTemplate>
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
                                <tr>
                                    <td colspan="2">
                                        
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            <asp:Panel ID="PnlWorker" runat="server" style="text-align: center" 
                                Visible="False">
                                            <table class="style3" dir="rtl">
                                                <tr>
                                                    <td class="style5" style="text-align: right">
                                                        <asp:Label ID="Label4" runat="server" Text="الفني" Font-Bold="True" 
                                                            Font-Size="14px" ForeColor="Black"></asp:Label>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:DropDownList ID="DDLWorker" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5" style="text-align: right">
                                                        <asp:Label ID="Label5" runat="server" Text="الفتره" Font-Bold="True" 
                                                            Font-Size="14px" ForeColor="Black"></asp:Label>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:DropDownList ID="DDLPeriod" runat="server" Width="200px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5" style="text-align: right">
                                                        <asp:Label ID="Label6" runat="server" Text="التاريخ الفعلي" Font-Bold="True" 
                                                            Font-Size="14px" ForeColor="Black"></asp:Label>
                                                    </td>
                                                    <td style="text-align: right">
                                                        <asp:TextBox ID="TxtEffectiveDate" runat="server" Width="200px"></asp:TextBox>
                                                        <cc1:CalendarExtender ID="TxtEffectiveDate_CalendarExtender" runat="server" 
                                                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtEffectiveDate">
                                                        </cc1:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5" style="text-align: right">
                                                        &nbsp;</td>
                                                    <td style="text-align: right">
                                                        <asp:CheckBox ID="CBClose" runat="server" Text="اغلاق" Font-Bold="True" 
                                                            Font-Size="14px" ForeColor="Black" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style5">
                                                        &nbsp;</td>
                                                    <td style="text-align: right">
                                                        <asp:Button ID="BtnAddWorker" runat="server" Text="اضافه" Width="100px" 
                                                            onclick="BtnAddWorker_Click" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:GridView ID="GridViewWorker" runat="server" AutoGenerateColumns="False" 
                                                            CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
                                                            GridLines="None">
                                                            <AlternatingRowStyle BackColor="White" />
                                                            <Columns>
                                                                <asp:BoundField DataField="worker_name" HeaderText="اسم الفني" />
                                                                <asp:BoundField DataField="PeriodName" HeaderText="الفتـــره" />
                                                                <asp:BoundField DataField="EffectiveDate" HeaderText="التاريخ الفعلي" 
                                                                    DataFormatString="{0:D}" />
                                                                <asp:CheckBoxField DataField="TaskClose" HeaderText="اغلاق" ReadOnly="True" />
                                                                <asp:TemplateField HeaderText="حذف">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="BtnDelWorker" runat="server" Height="26px" 
                                                                            ImageUrl="~/Images/Delete.png" 
                                                                            onclientclick="javascript: return confirm('هل انت متاكد ؟')" Width="26px" 
                                                                            onclick="BtnDelWorker_Click" />
                                                                        <asp:HiddenField ID="HiddenFieldworkerId" runat="server" 
                                                                            Value='<%# Bind("workerId") %>' />
                                                                        <asp:HiddenField ID="HiddenFieldTaskOrderId" runat="server" 
                                                                            Value='<%# Bind("TaskOrderId") %>' />
                                                                    </ItemTemplate>
                                                                    <EditItemTemplate>
                                                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                                    </EditItemTemplate>
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
                                        </asp:Panel>
                        </ContentTemplate>
                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
    </table>
</div>