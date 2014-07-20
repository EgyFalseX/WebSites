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

                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="TBLAllMember.aspx">بيانات الاعضاء </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="TBLMembersEditor.aspx">تعديل بيانات الاعضاء </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="hafzaEditor.aspx">الحافظة</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="hafzaReport.aspx">تقرير الحافظة</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="#999999">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="tblestefaViewer.aspx">الاستيفاء</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                &nbsp;</td>
        </tr>
    </table>

</div>
</asp:Content>

