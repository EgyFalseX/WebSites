<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPLoans.aspx.cs" Inherits="EmpInterface_EMPLoans" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPLoans.ascx" TagName="EMPLoans" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPLoans ID="EMPLoans1" runat="server" />
   
</asp:Content>

