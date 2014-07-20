<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SelectMagazine.ascx.cs" Inherits="SelectMagazine" %>
<style type="text/css">
    .style1
    {
        width: 681px;
    }
    .style2
    {
        text-align: center;
    }
    </style>

<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
   <table align="center" class="style1">
       <tr>
           <td bgcolor="#336600" class="style2">
               <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" 
                   ForeColor="White" Text="Modern Magazine"></asp:Label>
           </td>
       </tr>
       <tr>
           <td class="style2">
               <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Italic="True" 
                   Font-Names="Andalus" Font-Overline="False" Font-Size="Large" 
                   Font-Strikeout="False" Font-Underline="False" 
                   Text="Modern Magazine: online magazine is published in the school site Under the supervision of school teachers We aim to be the magazine section of the sections referred to Mendez Forum and to be gifted in school, and have a footprint in the soul , And we welcome the contributions of all magazine.  We hope to have the satisfaction, Greetings to you and May God help you. Editor" 
                   Width="502px"></asp:Label>
           </td>
       </tr>
       <tr>
           <td style="text-align: center">
               <table style="width: 664px">
                   <tr>
                       <td>
                           
                           <br />
                           
                       </td>
                       <td>
                           <telerik:RadComboBox ID="RCB" Runat="server" Height="20px" Skin="Default" 
                               Width="200px" DataSourceID="IssueAccessDataSource" DataTextField="addd" 
                               DataValueField="addno">
                           </telerik:RadComboBox>
                           
                           <br />
                           
                           <asp:CheckBox ID="CBAll" runat="server" Text="View all topics" />
                           
                       </td>
                       <td>
                           &nbsp;</td>
                   </tr>
               </table>
           </td>
       </tr>
       <tr>
           <td class="style2">
               <telerik:RadButton ID="RBtnView" runat="server" Skin="Forest" 
                   Text="View" onclick="RBtnView_Click" Width="100px">
               </telerik:RadButton>
                           
                           <asp:AccessDataSource ID="IssueAccessDataSource" runat="server" 
                               DataFile="../App_Data/magazine.mdb" 
                               SelectCommand="SELECT [addno], [addd] FROM [addno]"></asp:AccessDataSource>
                           
           </td>
       </tr>
</table>

