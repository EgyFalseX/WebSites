<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPAnnualReports.aspx.cs" Inherits="EmpInterface_EMPAnnualReports" Title="AnnualReports Page" %>

<%@ Register Src="../UserControls/EMPAnnualReports.ascx" TagName="EMPAnnualReports"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPAnnualReports ID="EMPAnnualReports1" runat="server" />
</asp:Content>

