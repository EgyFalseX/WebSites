<%@ Page Language="C#" MasterPageFile="~/EmpInterface/HWMasterPage.master" AutoEventWireup="true" CodeFile="EmpShowHomeWork.aspx.cs" Inherits="EmpInterface_EmpShowHomeWork" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EmpShowHomeWork.ascx" TagName="EmpShowHomeWork"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EmpShowHomeWork id="EmpShowHomeWork1" runat="server">
    </uc1:EmpShowHomeWork>
</asp:Content>

