<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <div>
                
    <table align="center" class="style1">
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="Login.aspx">تسجيل الدخول</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="changepassword.aspx">تعير بيانات المستخدم</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="VideoCategoryEditor.aspx">محرر الفيديو</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="MainVideoEditor.aspx">فيديو الرئيسية</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink13" runat="server" 
                    NavigateUrl="VideoViewer.aspx">مكتبة الفيديو</asp:HyperLink>

            </td>
        </tr>
        </table>

</div>
</asp:Content>

