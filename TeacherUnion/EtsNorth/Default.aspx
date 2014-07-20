<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<div>
                
    <table align="center" class="style1">
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ViewMemberOptions.aspx">عرض و تعديل</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/ExportTblMembers.aspx">تصدير</asp:HyperLink>

            </td>
        </tr>
        </table>

</div>
</asp:Content>

