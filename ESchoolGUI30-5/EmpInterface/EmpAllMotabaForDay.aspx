<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MMasterPage.master" AutoEventWireup="true" CodeFile="EmpAllMotabaForDay.aspx.cs" Inherits="EmpInterface_EmpAllMotabaForDay" Title="AllMotabaForDay Page" %>

<%@ Register Src="../UserControls/EmpAllMotabaForDay.ascx" TagName="EmpAllMotabaForDay"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EmpAllMotabaForDay ID="EmpAllMotabaForDay1" runat="server" />
</asp:Content>

