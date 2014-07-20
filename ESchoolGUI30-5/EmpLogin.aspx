<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="EmpLogin.aspx.cs" Inherits="UserControls_EmpLogin" Title="Login Page" %>

<%@ Register Src="UserControls/Login.ascx" TagName="Login" TagPrefix="uc3" %>

<%@ Register Src="UserControls/EMPLogin.ascx" TagName="EMPLogin" TagPrefix="uc2" %>

<%@ Register Src="UserControls/DoTheLogin.ascx" TagName="DoTheLogin" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:EMPLogin ID="EMPLogin1" runat="server" />
  

</asp:Content>

