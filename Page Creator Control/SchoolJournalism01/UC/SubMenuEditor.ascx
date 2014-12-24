<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SubMenuEditor.ascx.cs" Inherits="SubMenuEditor" %>
<style type="text/css">
    .style1
    {
        width: 600px;
        height: 200px;
    }
    .style2
    {
        width: 144px;
    }
    .style3
    {
        width: 144px;
        height: 36px;
    }
    .style4
    {
        height: 36px;
    }
</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td bgcolor="#33CC33" colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" style="font-size: x-large" 
                    Text="ادخال قائمه فرعيه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="الاسم"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAdd" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:ImageButton ID="IBAdd" runat="server" Height="32px" 
                    ImageUrl="../images/add.png" onclick="IBAdd_Click" ToolTip="ادخال" 
                    Width="32px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#33CC33" colspan="2" style="text-align: center">
                <asp:Label ID="Label3" runat="server" style="font-size: x-large" 
                    Text="تعديل قائمه فرعيه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label4" runat="server" Text="اختار قائمه للتعديل"></asp:Label>
            </td>
            <td class="style4">
                <asp:DropDownList ID="DDLItems" runat="server" DataTextField="SubMenuTitle" 
                    DataValueField="SubMenuID" Width="300px" AutoPostBack="True" 
                    onselectedindexchanged="DDLItems_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:ImageButton ID="IBDelete" runat="server" Height="32px" 
                    ImageUrl="../images/delete.png"
                    onclientclick="javascript: return confirm('هل انت متاكد ؟')"
                    onclick="IBDelete_Click" ToolTip="حذف" 
                    Width="32px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="تعديل الاسم"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEdit" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:ImageButton ID="IBEdit" runat="server" Height="32px" 
                    ImageUrl="../images/edit.png" onclick="IBEdit_Click" ToolTip="تعديل" 
                    Width="32px" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblMsg" runat="server" style="font-size: x-large"></asp:Label>
            </td>
        </tr>
    </table>
</div>