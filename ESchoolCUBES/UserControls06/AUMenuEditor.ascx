<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AUMenuEditor.ascx.cs" Inherits="AUMenuEditor" %>
<style type="text/css">
    .style1
    {
        width: 19%;
    }
</style>
<div dir="rtl">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="C1" runat="server" AutoPostBack="True" Text="عن المدرسه" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="C2" runat="server" AutoPostBack="True" 
                    Text="الهيكل التنظيمي" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="C3" runat="server" AutoPostBack="True" 
                    Text="التقدم للمدرسه" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="C4" runat="server" AutoPostBack="True" 
                    Text="المصروفات المدرسيه" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="C5" runat="server" AutoPostBack="True" 
                    Text="خطوط سير الباص" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="C6" runat="server" AutoPostBack="True" Text="كيف تصل الينا" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBox ID="C7" runat="server" AutoPostBack="True" Text="اتصل بنا" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</div>