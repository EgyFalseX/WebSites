<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ControlMenu.ascx.cs" Inherits="ControlMenu" %>
<%@ Register src="ItemView.ascx" tagname="ItemView" tagprefix="uc1" %>
<asp:Repeater ID="Repeater1" runat="server" 
    onitemcommand="Repeater1_ItemCommand" onprerender="Repeater1_PreRender" >
<ItemTemplate >
<div class="accordion"><h3>
<asp:Label ID="Label1" runat="server" Text='<%# Bind("PairntName") %>' ></asp:Label></h3>
<p>
    <asp:HiddenField ID="HiddenField1" Value='<%# Bind("PairntID") %>' runat="server" />
<asp:DataList ID="DataList1" runat="server"  
    RepeatColumns="5" 
    RepeatDirection="Horizontal" EnableTheming="True" >
    <ItemStyle 
        Wrap="False" />
<ItemTemplate  >
     <table style=" height: 101px;">
                            <tr>
                                <td >
                                    
                                    <asp:ImageButton ID="Image1" runat="server" AlternateText="لا يوجد صورة" 
                                        DescriptionUrl="" Height="64px" PostBackUrl='<%# Bind("PageLink") %>'  ImageUrl='<%# Bind("PicPath") %>' 
                                        ToolTip='<%# Bind("ItemName") %>' Width="70px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LinkButton1" runat="server"  Text='<%# Bind("ItemName") %>' 
                                        style="font-weight: 700" ForeColor="#1D1D1D" Font-Underline="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
     
</ItemTemplate>
</asp:DataList>
</p>
</div></ItemTemplate>
</asp:Repeater>
<script type="text/javascript" src="jquery.js"></script>

<script src="jquery.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$(".accordion h3:first").addClass("active");
	$(".accordion p:not(:first)").hide();

	$(".accordion h3").click(function(){
		$(this).next("p").slideToggle("slow")
		.siblings("p:visible").slideUp("slow");
		$(this).toggleClass("active");
		$(this).siblings("h3").removeClass("active");
	});

});
</script>

<style type="text/css">
body {
	
	
	font: 75%/120% tahoma,Arial, Helvetica, sans-serif;
}
.accordion {
	width: 480px;
	border-bottom: solid 1px #c4c4c4;
}
.accordion h3 {
	background: #e9e7e7 url(images/arrow-square.gif) no-repeat right -51px;
	padding: 7px 15px;
	margin: 0;
	font: bold 120%/100% Arial, Helvetica, sans-serif;
	border: solid 1px #c4c4c4;
	border-bottom: none;
	cursor: pointer;
	
}
.accordion h3:hover {
	background-color: #e3e2e2;
}
.accordion h3.active {
	background-position: right 5px;
}
.accordion p {
	background: #f7f7f7;
	margin: 0;
	padding: 10px 15px 20px;
	border-left: solid 1px #c4c4c4;
	border-right: solid 1px #c4c4c4;
	
}
</style>


