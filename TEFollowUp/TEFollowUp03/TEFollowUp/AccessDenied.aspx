<%@ page title="" language="C#" masterpagefile="master.master" autoeventwireup="true" codefile="AccessDenied.aspx.cs" inherits="AccessDenied" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 210px;
        }
        .auto-style2 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolderMain" runat="Server">
    

    
    <table class="auto-style1" align="center">
        <tr>
            <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="30pt" 
        ForeColor="Red" Text="ليس لديك صلاحية الدخول" BorderStyle="Solid" style="text-align: center" Width="370px"></asp:Label>
            </td>
        </tr>
    </table>
    
</asp:content>
