<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MMasterPage.master" AutoEventWireup="true" CodeFile="EmpAllUnReadMotabaa.aspx.cs" Inherits="EmpInterface_EmpAllMotabaa" Title="AllUnReadMotabaa Page" %>

<%@ Register Src="../UserControls/EmpAllUnReadMotabaa.ascx" TagName="EmpAllUnReadMotabaa"
    TagPrefix="uc4" %>


<%@ Register Src="../UserControls/EmpAllMotabaa.ascx" TagName="EmpAllMotabaa" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc4:EmpAllUnReadMotabaa ID="EmpAllUnReadMotabaa1" runat="server" />
  
    
</asp:Content>

