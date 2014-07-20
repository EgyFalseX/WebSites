<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HonorBoardTypeSelection.aspx.cs" Inherits="HonorBoardTypeSelection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 38%;
            direction: rtl;
            height: 122px;
        }
        .style2
        {
            width: 144px;
        }
    </style>
</head>
<body style="direction: rtl">
    <form id="form1" runat="server">
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
    </form>
    <p style="direction: rtl">
        &nbsp;</p>
    <p style="direction: rtl">
        &nbsp;</p>
    <p style="direction: ltr">
        &nbsp;</p>
</body>
</html>
