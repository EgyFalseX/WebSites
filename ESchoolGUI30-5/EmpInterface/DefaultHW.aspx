<%@ Page Language="C#" MasterPageFile="~/EmpInterface/HWMasterPage.master" AutoEventWireup="true" CodeFile="DefaultHW.aspx.cs" Inherits="EmpInterface_Default" Title="Untitled Page" %>

<%@ Register Src="../UserControls/emgPerviousPage.ascx" TagName="emgPerviousPage"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:emgPerviousPage ID="EmgPerviousPage1" runat="server" FirstSession="EMPID" IndexUrl ="../EmpLogin.aspx" />
</asp:Content>

