<%@ Page Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="CreatePage.aspx.cs" Inherits="CreatePage" Title="محرر الصفحات" %>



<%@ Register src="UC/CreatePages.ascx" tagname="CreatePages" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CreatePages ID="CreatePages1" runat="server" />
    
</asp:Content>

