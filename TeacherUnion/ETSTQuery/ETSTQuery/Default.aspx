<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<div style="text-align: center">
                
    <table align="center" class="style1">
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink7" runat="server" 
                    NavigateUrl="meber_monyViewer.aspx">مبالغ الاعضاء</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink8" runat="server" 
                    NavigateUrl="tabea_monyViewer.aspx"> مبالغ التابعين</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink9" runat="server" 
                    NavigateUrl="member_no_monyViewer.aspx">اعضاء غير مستحقين</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink10" runat="server" 
                    NavigateUrl="tabea_no_monyViewer.aspx">استعلام تابعين غير مستحقين</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="member_no_rplyViewer.aspx">اعضاء لم ياتي ردها</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1">

                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="teabea_no_rplyViewer.aspx">تابعين لم ياتي رد</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="#999999">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">

                &nbsp;</td>
        </tr>
    </table>

    <br />
    <asp:Label ID="Label1" runat="server" Font-Size="14pt" ForeColor="Red" 
        Height="101px" 
        Text="ملحوظة يقوم مندوب الفرعية بالسؤال عن الذين وردت مبالغهم بقسم الحسابات بالنقابة العامة وليس بادارة المعلومات" 
        Width="262px"></asp:Label>

</div>
</asp:Content>

