<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPHolidays.aspx.cs" Inherits="EmpInterface_EMPHolidays" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPHolidays.ascx" TagName="EMPHolidays" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPHolidays ID="EMPHolidays1" runat="server" />
</asp:Content>

