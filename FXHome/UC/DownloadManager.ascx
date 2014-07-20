<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DownloadManager.ascx.cs" Inherits="DownloadManager" %>
<style type="text/css">
    .style1
    {
        width: 464px;
    }
</style>

<table align="center" class="style1">
    <tr>
        <td>
            <asp:Label ID="Label4" runat="server" Text="Download Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TxtAddName" runat="server" Width="200px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" Text="Download FileName"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TxtAddFileName" runat="server" Width="200px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:ImageButton ID="BtnAdd" runat="server" ImageUrl="~/images/add.png" 
                onclick="BtnAdd_Click" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Downloads"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label3" runat="server" Text="Downloads"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DDLDownloads" runat="server" DataTextField="LinkName" 
                DataValueField="LinkID" Width="200px" AutoPostBack="True" 
                onselectedindexchanged="DDLDownloads_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
        <td>
            <asp:ImageButton ID="BtnDel" runat="server" ImageUrl="~/images/delete.png" 
                onclientclick="javascript: return confirm('Are You Sure ?')"
                onclick="BtnDel_Click" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label6" runat="server" Text="Download Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TxtEditName" runat="server" Width="200px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label5" runat="server" Text="Download FileName"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TxtEditFileName" runat="server" Width="200px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:ImageButton ID="BtnUpdate" runat="server" ImageUrl="~/images/edit.png" 
                onclick="BtnUpdate_Click" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td bgcolor="Yellow" colspan="3" style="text-align: center">
            <asp:Label ID="LblResult" runat="server"></asp:Label>
        </td>
    </tr>
</table>

