<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ControlMenu.ascx.cs" Inherits="ControlMenu" %>
   <link href="jquery-ui.css" rel="stylesheet" type="text/css" />
     <script src="jquery-1.4.min.js" type="text/javascript"></script>

    <script src="jquery.min.js" type="text/javascript"></script>
    <script src="jquery-ui.min.js" type="text/javascript"></script>
      <script>
  $(document).ready(function() {
    $("#accordion").accordion();
  });
  </script>
    
   <div style="width:630px"><div id="accordion">
     <asp:Repeater ID="Repeater1" runat="server" 
    onitemcommand="Repeater1_ItemCommand" onprerender="Repeater1_PreRender" >
<ItemTemplate >
    
	<h3><a style="text-align:center" href="#"><asp:Label ID="Label1" runat="server" Text='<%# Bind("PairntName") %>' ></asp:Label></a></h3>
	<div>
		<p style="text-align:center">
		  <asp:HiddenField ID="HiddenField1" Value='<%# Bind("PairntID") %>' runat="server" />
<asp:DataList ID="DataList1" runat="server"  
    RepeatColumns="5" 
    RepeatDirection="Horizontal" EnableTheming="True" >
    <ItemStyle 
        Wrap="False" />
<ItemTemplate>
   <table style=" height: 105px; width: 112px;">
                            <tr>
                                <td style="text-align: center" >
                                    
                                    <asp:ImageButton ID="Image1" runat="server" AlternateText="لا يوجد صورة" 
                                        DescriptionUrl="" Height="64px" PostBackUrl='<%# Bind("PageLink") %>'  ImageUrl='<%# Bind("PicPath") %>' 
                                        ToolTip='<%# Bind("ItemName") %>' Width="70px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Label ID="LinkButton1" runat="server"  Text='<%# Bind("ItemName") %>' 
                                         ForeColor="#1D1D1D" Font-Underline="False" style="font-weight: 700"></asp:Label>
                                </td>
                            </tr>
                        </table>
     
</ItemTemplate>
</asp:DataList>
		</p>
	</div>
	
	</ItemTemplate>
</asp:Repeater>

</div>
    </div>


