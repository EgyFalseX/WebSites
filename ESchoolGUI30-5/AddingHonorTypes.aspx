<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddingHonorTypes.aspx.cs" Inherits="AddingHonorTypes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            direction: rtl;
        }
        .style2
        {
            width: 102px;
        }
        .style3
        {
            width: 195px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="style1">
            <tr>
                <td class="style2">
                    انواع لوحة التميز</td>
                <td class="style3">
                    <asp:DropDownList ID="DDLAllHonorTypes" runat="server" Width="190px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="BtnDeleteType" runat="server" onclick="BtnDeleteType_Click" 
                        Text="حــذف" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" Text="اسم النوع"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TxtHonorTypeName" runat="server" Width="190px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label3" runat="server" Text="خاص بــ"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DDLDependent" runat="server" Height="16px" Width="190px">
                        <asp:ListItem Value="1">الطالب</asp:ListItem>
                        <asp:ListItem Value="2">المعلم</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="BtnAddHonorType" runat="server" onclick="BtnAddHonorType_Click" 
                        Text="اضافــه" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
<p style="direction: rtl">
    &nbsp;</p>
</body>
</html>
