<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="UC/Downloader.ascx" tagname="Downloader" tagprefix="uc1" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to My Download WebSite</h2>
    <p>
        <uc1:Downloader ID="Downloader1" runat="server" />
    </p>
    </asp:Content>
