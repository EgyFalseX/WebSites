<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="MenuEditor.aspx.cs" Inherits="MenuEditor" Title="محرر محتواي الصفحات" %>



<%@ Register src="UC/MenuEditor.ascx" tagname="MenuEditor" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:MenuEditor ID="MenuEditor1" runat="server" />
    
</asp:Content>

