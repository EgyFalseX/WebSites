<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPSalary.aspx.cs" Inherits="EmpInterface_Salary" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPSalary.ascx" TagName="EMPSalary" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPSalary ID="EMPSalary1" runat="server" />
</asp:Content>

