<%@ Page Language="C#" MasterPageFile="~/EmpInterface/HWMasterPage.master" AutoEventWireup="true" CodeFile="EmpshowHWforAstudentToday.aspx.cs" Inherits="EmpInterface_EmpshowHWforAstudentToday" Title="Today Homework Page" %>

<%@ Register Src="../UserControls/EmpshowHWforAstudentToday.ascx" TagName="EmpshowHWforAstudentToday"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EmpshowHWforAstudentToday ID="EmpshowHWforAstudentToday1" runat="server" />
    <a href="../EmpInterface/EmpshowHWforAstudentToday.aspx"></a>
</asp:Content>

