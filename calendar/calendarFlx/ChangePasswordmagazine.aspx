<%@ Page Title="" Language="C#" MasterPageFile="Magazine.master" AutoEventWireup="true" CodeFile="ChangePasswordmagazine.aspx.cs" Inherits="ChangePasswordmagazine" %>

<%@ Register src="UC/ChangePasswordmagazineUC.ascx" tagname="ChangePasswordmagazineUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ChangePasswordmagazineUC ID="ChangePasswordmagazineUC1" runat="server" />
</asp:Content>

