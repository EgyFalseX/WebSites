<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Student_Default" %>

<%@ Register src="../UserControls/DoTheLogin.ascx" tagname="DoTheLogin" tagprefix="uc1" %>

<%@ Register src="../UserControls/ControlMenu.ascx" tagname="ControlMenu" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:DoTheLogin ID="DoTheLogin1" runat="server" />
    <br /><br /><br />
    <uc2:ControlMenu ID="ControlMenu1" runat="server" />
    <br /><br /><br /><br /><br /><br />
    
</asp:Content>

