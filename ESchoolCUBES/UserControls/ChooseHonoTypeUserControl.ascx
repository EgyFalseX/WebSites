<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChooseHonoTypeUserControl.ascx.cs" Inherits="NewUserControl_ChooseHonoTypeUserControl" %>
<body style="direction: rtl">
<div>
    
        <table class="style1">
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Text="عرض لوحة الشرف للطلبة"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style2" rowspan="2">
                    <asp:RadioButtonList ID="RBLHonorTypes" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="RBLHonorTypes_SelectedIndexChanged">
                        <asp:ListItem Value="1">عرض التميز في</asp:ListItem>
                        <asp:ListItem Value="2">عرض الكل</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:DropDownList ID="DDLAllHonorTypes" runat="server" Enabled="False" 
                        Height="21px" Width="207px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnShow" runat="server" onclick="btnShow_Click" Text="عرض" 
                        Width="84px" />
                </td>
            </tr>
        </table>
    
    </div>