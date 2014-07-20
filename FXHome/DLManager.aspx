<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DLManager.aspx.cs" Inherits="DLManager" %>

<%@ Register src="UC/DownloadManager.ascx" tagname="DownloadManager" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:DownloadManager ID="DownloadManager1" runat="server" />
</asp:Content>

