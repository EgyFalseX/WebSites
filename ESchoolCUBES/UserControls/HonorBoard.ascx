<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HonorBoard.ascx.cs" Inherits="NewUserControl_HonorBoard" %>
 <style type="text/css">
        .style1
        {
            width: 287px;
            height: 104px;
        }
    </style>

    <div dir="rtl">
 
     <asp:DataList ID="DataList1" runat="server" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" EnableTheming="True" GridLines="Both" RepeatColumns="1" 
            Width="445px">
            <ItemTemplate>
               <div dir="rtl">
    <table border="0" cellpadding="0" cellspacing="0" width="478" dir="ltr">
<!-- fwtable fwsrc="Untitled-2.png" fwpage="Page 1" fwbase="HonorBoard.gif" fwstyle="Dreamweaver" fwdocid = "788091433" fwnested="0" -->
  <tr>
   <td><img src="~/images/spacer.gif" width="21" height="1" border="0" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="114" height="1" border="0" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="7" height="1" border="0" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="289" height="1" border="0" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="47" height="1" border="0" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>

  <tr>
   <td colspan="5"><img name="HonorBoard_r1_c1" src="~/images/HonorBoard_r1_c1.gif" width="478" height="21" border="0" id="HonorBoard_r1_c1" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="1" height="21" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="6"><img name="HonorBoard_r2_c1" src="~/images/HonorBoard_r2_c1.gif" width="21" height="202" border="0" id="HonorBoard_r2_c1" alt="" /></td>
   <td rowspan="3">
       <asp:Image ID="Image1" runat="server" Height="142" 
           ImageUrl='<% # bind("pic") %>' Width="114" />
      </td>
   <td colspan="3"><img name="HonorBoard_r2_c3" src="~/images/HonorBoard_r2_c3.gif" width="343" height="35" border="0" id="HonorBoard_r2_c3" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="1" height="35" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="5"><img name="HonorBoard_r3_c3" src="~/images/HonorBoard_r3_c3.gif" width="7" height="167" border="0" id="HonorBoard_r3_c3" alt="" /></td>
   <td style="direction: rtl">
   <table class="style1">
           <tr bgcolor="#D9DEE4" >
               <td bgcolor="#D9DEE4">
                   <asp:Label ID="Label1" runat="server" Text="العام :" style="font-weight: 700"></asp:Label>
               </td>
               <td bgcolor="#D9DEE4">
                   <asp:Label ID="Label4" runat="server" Text='<% # bind("yy") %>'></asp:Label>
               </td>
           </tr>
           <tr>
               <td bgcolor="#D9DEE4">
                  <asp:Label ID="Label2" runat="server" Text="التاريخ :" style="font-weight: 700"></asp:Label>
               </td>
               <td bgcolor="#D9DEE4">
                   <asp:Label ID="Label5" runat="server" Text='<% # bind("FalseX") %>'></asp:Label>
               </td>
           </tr>
           <tr>
               <td bgcolor="#D9DEE4">
                   <asp:Label ID="Label3" runat="server" Text="الشرف:" style="font-weight: 700"></asp:Label>
               </td>
               <td bgcolor="#D9DEE4">
                   <asp:Label ID="Label6" runat="server" Text='<% # bind("name_Honor_board") %>'></asp:Label>
               </td>
           </tr>
       </table></td>
   <td rowspan="5"><img name="HonorBoard_r3_c5" src="~/images/HonorBoard_r3_c5.gif" width="47" height="167" border="0" id="HonorBoard_r3_c5" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="1" height="106" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="2"><img name="HonorBoard_r4_c4" src="~/images/HonorBoard_r4_c4.gif" width="289" height="9" border="0" id="HonorBoard_r4_c4" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
  </tr>
  <tr>
   <td rowspan="3"><img name="HonorBoard_r5_c2" src="~/images/HonorBoard_r5_c2.gif" width="114" height="60" border="0" id="HonorBoard_r5_c2" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="1" height="8" border="0" alt="" /></td>
  </tr>
  <tr>
   <td bgcolor="#D9DEE4" style="direction: rtl; text-align: center">
   <asp:Label ID="Label8" runat="server" Text='<%# bind("stu_name") %>'></asp:Label>
   </td>
   <td><img src="~/images/spacer.gif" width="1" height="33" border="0" alt="" /></td>
  </tr>
  <tr>
   <td><img name="HonorBoard_r7_c4" src="~/images/HonorBoard_r7_c4.gif" width="289" height="19" border="0" id="HonorBoard_r7_c4" alt="" /></td>
   <td><img src="~/images/spacer.gif" width="1" height="19" border="0" alt="" /></td>
  </tr>
</table>
    </div> 
                
            </ItemTemplate>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <ItemStyle BackColor="White" ForeColor="#003399" />
            <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <FooterTemplate>
            </FooterTemplate>
        </asp:DataList>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" onprerender="Repeater1_PreRender">
        <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" Text='<% # bind("viewpage") %>' onclick="LinkButton1_Click" runat="server">LinkButton</asp:LinkButton></ItemTemplate>
            <SeparatorTemplate> &nbsp; | &nbsp;</SeparatorTemplate>
     </asp:Repeater>
     
    </div>