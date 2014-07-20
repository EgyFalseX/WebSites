<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLUserManager.ascx.cs" Inherits="UserControl_SLUserManager" %>
<style type="text/css">
    .styleSLUserManager1
    {
        width: auto;
    }
    .styleSLUserManager2
    {
        width: auto;
    }
</style>
<div dir="rtl">
    <table class="styleSLUserManager1" dir="rtl">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="Label4" runat="server" 
                    style="text-align: justify; font-weight: 700" 
                    Text="تغيــــــر اسم المستخدم و كلمة السر"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="styleSLUserManager2">
                <asp:Label ID="Label1" runat="server" Text="اسم المستخدم"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtUID" runat="server" AutoPostBack="True" 
                    ontextchanged="Txt_TextChanged" Width="238px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="styleSLUserManager2">
                <asp:Label ID="Label2" runat="server" Text="كلمة السر"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtPass1" runat="server" AutoPostBack="True" Width="238px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="styleSLUserManager2">
                <asp:Label ID="Label3" runat="server" Text="تأكيد كلمة السر"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtPass2" runat="server" AutoPostBack="True" Width="238px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="styleSLUserManager2">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" Text="حفظ" 
                    Width="105px" />
                <asp:Label ID="LblStatus" runat="server" Text="Status" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</div>