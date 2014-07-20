<%@ Page Title="" Language="C#" MasterPageFile="~/regdata/MasterPage.master" AutoEventWireup="true" CodeFile="RegDone.aspx.cs" Inherits="RegDone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 333px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Green" NavigateUrl="Default.aspx">Registration Completed ...</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

