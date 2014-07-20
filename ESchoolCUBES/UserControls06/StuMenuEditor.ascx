<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StuMenuEditor.ascx.cs" Inherits="UserControls_StuMenuEditor" %>
<style type="text/css">
    .style1
    {
        width: 39%;
    }
    .style2
    {
    }
    .style3
    {
        height: 98px;
        text-align: center;
    }
    .style4
    {
        height: 23px;
    }
    .style7
    {
        height: 28px;
    }
</style>
<div dir="rtl">
    <table dir="rtl" class="style1">
        <tr>
            <td colspan="2" style="text-align: center" class="style4">
                <asp:Label ID="Label1" runat="server" style="font-weight: 700" 
                    Text="تعديل قائمه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label8" runat="server" Text="جميع القوائم"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLAllMenus" runat="server" Height="22px" Width="210px" 
                    AutoPostBack="True" onselectedindexchanged="DDLAllMenus_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Button ID="BtnDelMenu" runat="server" Text="حذف القائمه" 
                    onclick="BtnDelMenu_Click" TabIndex="2" Width="86px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label10" runat="server" Text="اسم جديد للقائمه"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtMenuEdit" runat="server" Width="210px" TabIndex="1"></asp:TextBox>
                <asp:Button ID="BtnEditMenu" runat="server" Text="تغير اسم القائمه" 
                    onclick="BtnEditMenu_Click" TabIndex="2" Width="86px" />
            </td>
        </tr>
        <tr>
            <td valign="bottom" class="style7" colspan="2" style="text-align: center">
                <asp:Label ID="Label12" runat="server" style="font-weight: 700" 
                    Text="اضافة قائمه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="اسم القائمه"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtMenu" runat="server" Width="210px" TabIndex="1"></asp:TextBox>
                <br />
                <asp:Button ID="BtnAddMenu" runat="server" Text="اضافة قائمه" 
                    onclick="BtnAddMenu_Click" TabIndex="2" Width="86px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Label ID="LblError1" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="bottom" class="style3" colspan="2">
                <asp:Label ID="Label3" runat="server" style="font-weight: 700" 
                    Text="تعديل عنصر"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label9" runat="server" Text="جميع العناصر"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLAllElements" runat="server" Height="22px" 
                    Width="210px" AutoPostBack="True" 
                    onselectedindexchanged="DDLAllElements_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Button ID="BtnDelElement" runat="server" Text="حذف العنصر" TabIndex="2" 
                    Width="86px" onclick="BtnDelElement_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label11" runat="server" Text="اسم جديد للعنصر"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtElementEdit" runat="server" Width="210px" TabIndex="1"></asp:TextBox>
                <asp:Button ID="BtnEditElement" runat="server" Text="تغير اسم العنصر" 
                    onclick="BtnEditElement_Click" TabIndex="2" Width="86px" />
            </td>
        </tr>
        <tr>
            <td valign="bottom" colspan="2" style="text-align: center" class="style7">
                <asp:Label ID="Label13" runat="server" style="font-weight: 700" 
                    Text="اضافة عنصر"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="اسم العنصر"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtElementName" runat="server" TabIndex="3" Width="210px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="صورة العنصر"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadImage" runat="server" TabIndex="4" 
                    Width="210px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="رابط العنصر"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtElementLink" runat="server" TabIndex="5" Width="208px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label7" runat="server" Text="تحت قائمة"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLAllMenus2" runat="server" Height="22px" Width="210px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnAddElement" runat="server" Text="اضافة عنصر" TabIndex="6" 
                    Width="86px" onclick="BtnAddElement_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Label ID="LblError2" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        </table>
</div>