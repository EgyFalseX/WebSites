<%@ Page Language="C#" MasterPageFile="~/EmpInterface/Teacher.master" AutoEventWireup="true" CodeFile="EmpShowAllHomeWorkToday.aspx.cs" Inherits="EmpInterface_EmpShowAllHomeWorkToday" Title="HomeWork Today Page" %>

<%@ Register Src="UC/EmpShowAllHomeWorkToday.ascx" TagName="EmpShowAllHomeWorkToday"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EmpShowAllHomeWorkToday ID="EmpShowAllHomeWorkToday1" runat="server" />
</asp:Content>
