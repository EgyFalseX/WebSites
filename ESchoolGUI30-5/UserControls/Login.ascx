<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="UserControls_Login" %>
<div id="dv" runat="server" dir="rtl">
    <table style="width: 100%;">
        <tr>
            <td class="style1" style="width: 94px">
                &nbsp;
                <asp:Label ID="Label1" runat="server" Text="ÇÓã ÇáãÓÊÎÏã"></asp:Label>
            </td>
            <td class="style2" style="width: 180px">
                &nbsp;
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" style="width: 94px">
                &nbsp;
                <asp:Label ID="Label2" runat="server" Text="ßáãÉ ÇáãÑæÑ"></asp:Label>
            </td>
            <td class="style2" style="width: 180px">
                &nbsp;<asp:TextBox ID="txt_PassWord" runat="server" TextMode="Password"></asp:TextBox></td>
            <td>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txt_PassWord" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1" style="width: 94px">
                &nbsp;
            </td>
            <td class="style2" style="width: 180px">
                &nbsp;
            <asp:Button ID="btnLogin" runat="server" Text="ÏÎæá" 
                    onclick="btnLogin_Click" />
            </td>
            <td>
                &nbsp;&nbsp;<asp:Label ID="lblRong" runat="server" ForeColor="Red" 
                    Text="ÇÓã ÇáãÓÊÎÏã Çæ ßáãÉ ÇáãÑæÑ ÛíÑ ÕÍíÍÉ" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</div>
<div id="logined" dir="rtl" runat="server" visible="false">
    <table>
        <tr>
            <td style="width: 48px">
                <asp:Label ID="Label3" runat="server" Text="ãÑÍÈÇ"></asp:Label></td>
            <td style="width: 165px">
                <asp:Label ID="lblname" runat="server"></asp:Label></td>
            <td style="width: 56px">
                <asp:LinkButton ID="lbtnlogout" runat="server" OnClick="lbtnlogout_Click">Logout</asp:LinkButton></td>
        </tr>
    </table>
</div>