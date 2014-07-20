<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPLogin.ascx.cs" Inherits="UserControls_DoTheLogin" %>
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
   <center> <table style="width: 100%;">
        <tr>
            <td class="style1" style="width: 84px">
                
                <asp:Label ID="Label1" runat="server" Text="اسم المستخدم" Font-Bold="True"></asp:Label>
            </td>
            <td class="style2">
                
                <asp:TextBox ID="txtUserName" runat="server" Width="144px"></asp:TextBox>
            </td>
            <td>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" style="height: 26px; width: 84px;">
                
                <asp:Label ID="Label2" runat="server" Text="كلمة المرور" Font-Bold="True"></asp:Label>
            </td>
            <td class="style2" style="height: 26px">
                <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" Width="144px"></asp:TextBox></td>
            <td style="height: 26px">
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtPassWord" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" style="width: 84px">
                &nbsp;
            </td>
            <td class="style2">
                &nbsp;
            <asp:Button ID="btnLogin" runat="server" Text="دخول" 
                    onclick="btnLogin_Click" BackColor="LightSteelBlue" BorderColor="Navy" BorderStyle="Groove" Font-Bold="True" Font-Size="Smaller" Width="104px" />
            </td>
            <td>
                &nbsp;&nbsp;<asp:Label ID="lblRong" runat="server" ForeColor="Red" 
                    Text="اسم المستخدم او كلمة المرور غير صحيحة" Visible="False"></asp:Label>
            </td>
        </tr>
    </table></center>
</div>
<div id="logined" dir="rtl" runat="server" visible="false">
    &nbsp;</div>