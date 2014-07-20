<%@ Page Title="" Language="C#" MasterPageFile="Achievements.master" AutoEventWireup="true" CodeFile="AchievementsUser.aspx.cs" Inherits="AchievementsUser" %>

<%@ Register src="UC/AchievementsUser.ascx" tagname="AchievementsUser" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AchievementsUser ID="AchievementsUser1" runat="server" />
</asp:Content>

