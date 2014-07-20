<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorPricingpolicy.ascx.cs" Inherits="EditorPricingpolicy" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }
</style>
<div dir="rtl" style="text-align: center">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
    <asp:GridView ID="GridViewData" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" 
        ForeColor="#333333" GridLines="None" 
        onpageindexchanging="GridViewData_PageIndexChanging" Width="600px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Material" HeaderText="اسم الصنف" />
            <asp:TemplateField HeaderText="حد الطلب">
                <ItemTemplate>
                    <asp:TextBox ID="TxtRestorePoint" runat="server" 
                        Text='<%# Bind("RestorePoint") %>' Width="80px"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="TxtRestorePoint_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Custom, Numbers" ValidChars="." 
                        TargetControlID="TxtRestorePoint">
                    </cc1:FilteredTextBoxExtender>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RestorePoint") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="السعر">
                <ItemTemplate>
                    <asp:TextBox ID="TxtOutPrice" runat="server" Text='<%# Bind("OutPrice") %>' 
                        Width="80px"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="TxtOutPrice_FilteredTextBoxExtender" 
                        runat="server" Enabled="True" FilterType="Custom, Numbers" ValidChars="." 
                        TargetControlID="TxtOutPrice">
                    </cc1:FilteredTextBoxExtender>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("OutPrice") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="حفظ">
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenFieldEditMaterialId" runat="server" 
                        Value='<%# Bind("MaterialId") %>' />
                    <asp:ImageButton ID="ImageButtonEdit" runat="server" Height="26px" 
                        ImageUrl="~/Images/Edit.png" onclick="ImageButtonEdit_Click" 
                        onclientclick="javascript: return confirm('هل انت متاكد ؟')" Width="33px" />
                </ItemTemplate>
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