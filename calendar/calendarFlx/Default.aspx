<%@ Page Title="" Language="C#" MasterPageFile="Default.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 427px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
    <table class="style3" align="center">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="Andalus" 
                    Font-Size="Larger" Font-Underline="True" ForeColor="Gray" Text="User"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Andalus" 
                    Font-Size="Larger" Font-Underline="True" ForeColor="Gray" Text="Admin"></asp:Label>
                </td>
        </tr>
        <tr>
            <td>
                <a href="calendarEng.aspx">calendarEng.aspx</a><br />
                <a href="SchoolInBriefUser.aspx">SchoolInBriefUser.aspx</a><br />
                <a href="SelectMagazine.aspx">SelectMagazine.aspx</a><br />
                <a href="AchievementsUser.aspx">AchievementsUser.aspx</a></td>
            <td>
                <a href="calendarEngAdmin.aspx">calendarEngAdmin.aspx</a><br />
                <a href="MagazinesAdmin.aspx">MagazinesAdmin.aspx</a><br />
                <a href="MagazineDetailsAdmin.aspx">MagazineDetailsAdmin.aspx</a><br />
                <a href="SchoolInBriefAdmin.aspx">SchoolInBriefAdmin.aspx</a><br />
                <a href="AchievementsAdmin.aspx">AchievementsAdmin.aspx</a><br />
                </td>
        </tr>
    </table>
    <br />
</div>
</asp:Content>

