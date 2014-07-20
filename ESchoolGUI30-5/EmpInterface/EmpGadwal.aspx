<%@ Page Language="C#" MasterPageFile="~/EmpInterface/GMasterPage.master" AutoEventWireup="true" CodeFile="EmpGadwal.aspx.cs" Inherits="EmpInterface_Default" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EmpGadwal.ascx" TagName="EmpGadwal" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EmpGadwal ID="EmpGadwal1" runat="server" />
</asp:Content>

