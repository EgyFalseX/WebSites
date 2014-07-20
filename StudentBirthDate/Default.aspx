<%@ Page Title="" Language="C#" MasterPageFile="~/desoft/Birth/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="BirthDate.ascx" tagname="BirthDate" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:BirthDate ID="BirthDate1" runat="server" />

</asp:Content>

