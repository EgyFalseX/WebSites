<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ViewMenu.aspx.cs" Inherits="ViewMenu" Title="بيانات ومعلومات" %>


<%@ Register src="UC/Viewer.ascx" tagname="Viewer" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:Viewer ID="Viewer1" runat="server" />
    </asp:Content>

