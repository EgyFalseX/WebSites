<%@ Page Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="SelectLagna.aspx.cs" Inherits="SelectLagna" Title="محرر الصفحات" %>

<%@ Register src="UC/SelectLagna.ascx" tagname="SelectLagna" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:SelectLagna ID="SelectLagna1" runat="server" />
    
</asp:Content>

