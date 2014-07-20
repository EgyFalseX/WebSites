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
    .style13
    {
        width: 645px;
        height: 58px;
    }
    </style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
 
<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td>
                &nbsp;</td>
            <td dir="ltr" style="text-align: right" class="style1">
                <asp:DropDownList ID="DDLItems" runat="server" 
                    onselectedindexchanged="DDLItems_SelectedIndexChanged" Width="400px" 
                    AutoPostBack="True" DataTextField="Caption" DataValueField="ID" 
                    DataSourceID="DSItems">
                </asp:DropDownList>
                <asp:AccessDataSource ID="DSItems" runat="server" 
                    DataFile="App_Data/DataDB.mdb" 
                    SelectCommand="SELECT [ID], [Caption] FROM [RotatorData]">
                </asp:AccessDataSource>
                </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td dir="ltr" style="text-align: right" class="style1">
                <asp:Label ID="Label2" runat="server" Text="المسار 1"></asp:Label>
                <br />
            <textarea name="editor1" cols="20" rows="1">&lt;p&gt;<%=LoadPage() %>&lt;/p&gt;</textarea>
			<script type="text/javascript">
			    CKEDITOR.replace('editor1');
			</script>
            <br />
                <br />
                </td>
        </tr>
        <tr>
            <td>
                </td>
            <td dir="ltr" style="text-align: right" class="style13">
            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>


