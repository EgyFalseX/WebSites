<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 647px;
        }
        .style4
        {
            font-weight: bold;
        }
        .style5
        {
            width: 400px;
            text-align: right;
        }
        .style7
        {
            text-align: center;
            width: 207px;
        }
        .style8
        {
            width: 348px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <asp:Panel ID="PnlLogin" runat="server" Visible="False">
        <table class="style2" dir="rtl" align="center" border="1">
            <tr>
                <td colspan="2" style="text-align: center">
                    <img src="images/user-group.png" style="text-align: center; height: 92px; width: 140px;" />
                </td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" 
                        Font-Size="14px" Text="اسم المستخدم"></asp:Label>
                </td>
                <td class="style8">
                    <asp:TextBox ID="TxtUserName" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                Font-Italic="False" Font-Size="14px" Text="كلمة المرور"></asp:Label>
                </td>
                <td class="style8">
                    <asp:TextBox ID="TxtPassword" runat="server" 
                TextMode="Password" Width="150px" style="text-align: right"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="BtnLogin" runat="server" onclick="BtnLogin_Click" Text="دخول" 
                        Width="200px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <b><font color="#800000" face="Tahoma" size="2">ملحوظة</font></b><font 
                        color="#111111" face="Tahoma" size="2"><b> : اسم المستخدم وكلمة المرور&nbsp; هما
                    </b><span class="style4" lang="ar-eg">نفس اسم المستخدم وكلمة المرور الخاصتين 
                    ببوابة الطالب </span><b>&nbsp;ويمكن الحصول عليها من </b><span class="style4" 
                        lang="ar-eg">مسئول شئون الطلاب بالمدرسة </span>&nbsp;. </font>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LblState" runat="server" BackColor="Yellow" Font-Bold="False" 
                        Font-Italic="False"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

