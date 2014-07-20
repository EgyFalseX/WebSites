<%@ Page Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="EmpLogin.aspx.cs" Inherits="EmpLogin" %>
<%@ Register src="UC/UserLogin.ascx" tagname="UserLogin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>تسجيل الدخول</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserLogin ID="UserLogin" runat="server" />
</asp:Content>