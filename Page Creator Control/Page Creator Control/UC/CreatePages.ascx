<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreatePages.ascx.cs" Inherits="CreatePages" %>
<style type="text/css">

    .style11
    {
        width: 847px;
    }
    .style1
    {
        width: 645px;
    }
    </style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
 
<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td class="style12">
                <asp:Menu ID="MainMenu" runat="server" style="direction: rtl" 
                Width="194px" 
                onmenuitemclick="MainMenu_MenuItemClick">
            </asp:Menu>
                </td>
            <td dir="ltr" style="text-align: right" class="style1">
            <textarea name="editor1" cols="20" rows="1">&lt;p&gt;<%=LoadPage() %>&lt;/p&gt;</textarea>
			<script type="text/javascript">
			    CKEDITOR.replace('editor1');
			</script>
            <br />
            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>


