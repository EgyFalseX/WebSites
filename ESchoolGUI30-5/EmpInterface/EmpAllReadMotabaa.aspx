<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MMasterPage.master" AutoEventWireup="true" CodeFile="EmpAllReadMotabaa.aspx.cs" Inherits="EmpInterface_EmpAllMotabaa" Title="AllReadMotabaa Page" %>

<%@ Register Src="../UserControls/EmpAllReadMotabaa.ascx" TagName="EmpAllReadMotabaa"
    TagPrefix="uc3" %>

<%@ Register Src="../UserControls/EmpAllReadMotabaa.ascx" TagName="EmpAllReadMotabaa"
    TagPrefix="uc2" %>

<%@ Register Src="../UserControls/EmpAllMotabaa.ascx" TagName="EmpAllMotabaa" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc3:EmpAllReadMotabaa ID="EmpAllReadMotabaa1" runat="server" />
    
</asp:Content>

