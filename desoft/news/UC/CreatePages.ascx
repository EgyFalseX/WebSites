﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreatePages.ascx.cs" Inherits="CreatePages" %>
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
                <asp:Label ID="Label2" runat="server" Text="المسار 1"></asp:Label>
                <br />
            <textarea name="editor1" cols="20" rows="1">&lt;p&gt;<%=LoadPage(true) %>&lt;/p&gt;</textarea>
			<script type="text/javascript">
			    CKEDITOR.replace('editor1');
			</script>
            <br />
                <br />
                </td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td dir="ltr" style="text-align: right" class="style1">
                <asp:Label ID="Label1" runat="server" Text="المسار 2"></asp:Label>
                <br />
                <textarea name="editor2" cols="20" rows="1">&lt;p&gt;<%=LoadPage(false) %>&lt;/p&gt;</textarea><br />
                <br />
                &nbsp;<script type="text/javascript">
			    CKEDITOR.replace('editor2');
			</script></td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td dir="ltr" style="text-align: right" class="style1">
            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>

