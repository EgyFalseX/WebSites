<%@ Page Title="" Language="C#" MasterPageFile="MasterUploader.master" AutoEventWireup="true" CodeFile="Uploader.aspx.cs" Inherits="Uploader" %>

<%@ Register src="Uploader.ascx" tagname="Uploader" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Uploader ID="Uploader1" runat="server" />
</asp:Content>

