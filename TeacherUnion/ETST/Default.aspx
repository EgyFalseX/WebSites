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

                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="CDCompanionType.aspx">فئات التابعين  </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="CDGov.aspx">المحافظات </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="CDIdType.aspx">نوع مستند الاثبات</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="CDMaritalStatus.aspx">الحالات الاجتماعية</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="CDSyndicate.aspx">النقابات الفرعية</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="CDSubCommitte.aspx">اللجان النقابية</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="TBLMembers.aspx">بيانات الاعضاء </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="TBLMembersEditor.aspx">تعديل بيانات الاعضاء </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="TBLMembersClosedField.aspx">اغلاق تعديل بيانات الاعضاء </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="#999999">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="ExportTBLMembers.aspx">تصدير الاعضاء</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="ExportTBLCompanion.aspx">تصدير التابعين  </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink14" runat="server" 
                    NavigateUrl="ViewTBLMembers.aspx">عرض الاعضاء</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink15" runat="server" 
                    NavigateUrl="ViewTBLCompanion.aspx">عرض التابعين  </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="#999999">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="MemCardEditor.aspx">تسليم كارنيهات الاعضاء</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="CompanionCardEditor.aspx">تسليم كارنيهات التابعين</asp:HyperLink>

            </td>
        </tr>
    </table>

</div>
</asp:Content>

