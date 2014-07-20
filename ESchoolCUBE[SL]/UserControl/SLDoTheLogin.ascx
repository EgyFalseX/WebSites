<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLDoTheLogin.ascx.cs" Inherits="UserControls_DoTheLogin" %>
<style type="text/css">
    .style1
    {
        width: 90px;
    }
    .style2
    {
        width: 154px;
    }
</style>
<div id="dv" runat="server" dir="rtl">
    <table style="width: 41%;">
        <tr>
            <td class="style1">
                &nbsp;
                <asp:Label ID="Label1" runat="server" Text="اسم المستخدم" Font-Bold="True"></asp:Label>
            </td>
            <td class="style2">
                &nbsp;
                <asp:TextBox ID="txtUserName" runat="server" Font-Bold="True" Width="143px"></asp:TextBox>
            </td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:LinkButton ID="lbtnlogout" runat="server" OnClick="lbtnlogout_Click">Logout</asp:LinkButton></td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
                <asp:Label ID="Label2" runat="server" Text="كلمة المرور" Font-Bold="True"></asp:Label>
            </td>
            <td class="style2">
                &nbsp;
                <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" Width="144px" 
                    TabIndex="1"></asp:TextBox>
            </td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPassWord" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                <asp:CheckBox ID="CBAdmin" runat="server" TabIndex="2" Text="مدير" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            <asp:Button ID="btnLogin" runat="server" Text="دخول" 
                    onclick="btnLogin_Click" 
                     Font-Bold="True" Width="105px" TabIndex="3" />
            </td>
            <td>
                &nbsp;&nbsp;<asp:Label ID="lblRong" runat="server" ForeColor="Red" 
                    Text="اسم المستخدم او كلمة المرور غير صحيحة" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</div>
<div id="logined" dir="rtl" runat="server" visible="false">
    &nbsp;</div>