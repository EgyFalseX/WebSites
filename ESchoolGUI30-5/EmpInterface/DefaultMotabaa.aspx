<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MMasterPage.master" AutoEventWireup="true" CodeFile="DefaultMotabaa.aspx.cs" Inherits="EmpInterface_DefaultMotabaa" Title="Untitled Page" %>

<%@ Register Src="../UserControls/emgPerviousPage.ascx" TagName="emgPerviousPage"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:emgPerviousPage ID="EmgPerviousPage1" runat="server" FirstSession="EMPID" IndexUrl ="../EmpLogin.aspx" />
</asp:Content>

