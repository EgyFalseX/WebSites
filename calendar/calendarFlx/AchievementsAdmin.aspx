<%@ Page Title="" Language="C#" MasterPageFile="Achievements.master" AutoEventWireup="true" CodeFile="AchievementsAdmin.aspx.cs" Inherits="AchievementsAdmin" %>

<%@ Register src="UC/AchievementsAdmin.ascx" tagname="AchievementsAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AchievementsAdmin ID="AchievementsAdmin1" runat="server" />
</asp:Content>

