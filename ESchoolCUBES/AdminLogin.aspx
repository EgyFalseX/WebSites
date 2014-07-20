<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<%@ Register src="UserControls/SLDoTheLogin.ascx" tagname="SLDoTheLogin" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <title>صفحة الدخـــول</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    
        <uc1:SLDoTheLogin ID="SLDoTheLogin1" runat="server" />
    
    </div>

</asp:Content>

