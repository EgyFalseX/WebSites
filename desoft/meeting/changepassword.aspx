<%@ Page Title="" Language="C#" MasterPageFile="~/ContactUs/Master.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="ContactUs_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 367px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
        <tr>
            <td style="direction: rtl">
                <asp:TextBox ID="TxtUName" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td style="direction: rtl">
                <asp:Label ID="Label1" runat="server" Text="تغير اسم المستخدم : "></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="direction: rtl">
                <asp:TextBox ID="TxtCPass" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td style="direction: rtl">
                <asp:Label ID="Label2" runat="server" Text="كلمة المرور الحاليه : "></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="direction: rtl">
                <asp:TextBox ID="TxtPass1" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td style="direction: rtl">
                <asp:Label ID="Label3" runat="server" Text="كلمة المرور الجديده : "></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="direction: rtl">
                <asp:TextBox ID="TxtPass2" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td style="direction: rtl">
                <asp:Label ID="Label4" runat="server" Text="اعادة كلمة المرور الجديده : "></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnupdate" runat="server" onclick="btnupdate_Click" 
                    Text="تعديـــــــــــل" Width="150px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="lblstate" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

