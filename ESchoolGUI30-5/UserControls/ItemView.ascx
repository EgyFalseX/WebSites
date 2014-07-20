<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ItemView.ascx.cs" Inherits="userconrol_ItemView" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<p>
    <asp:DataList ID="DataList1" runat="server"  
    onselectedindexchanged="DataList1_SelectedIndexChanged" RepeatColumns="3" 
    RepeatDirection="Horizontal" EnableTheming="True" 
        onprerender="DataList1_PreRender" >
    <ItemStyle  
        Wrap="False" />
<ItemTemplate >
<table  border="0" height="183" style="width: 170px">
    <tr>
        <td background="image/1item.jpg" height="179"  width="166" 
            >
           <table style="background-image: url('../image/1item.jpg'); background-repeat: no-repeat; background-attachment: fixed; height: 140px;"><tr><td>
<asp:Image ID="Image1" runat="server"  ToolTip='<%# Bind("ItemName") %>' AlternateText="لا يوجد صورة"  DescriptionUrl=""  ImageUrl='<%# Bind("PicPath") %>' Height="80px" Width="87px" /></td>
</tr>
<tr >
<td>
<asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label></td>
</tr>
</table>
            </td>

    </tr>
</table>
</ItemTemplate>
</asp:DataList>
</p>
