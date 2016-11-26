<%@ Page Language="C#" MasterPageFile="~/EmpInterface/Teacher.master" AutoEventWireup="true" CodeFile="EmpAllUnReadMotabaa.aspx.cs" Inherits="EmpInterface_EmpAllMotabaa" Title="AllUnReadMotabaa Page" %>

<%@ Register Src="UC/EmpAllUnReadMotabaa.ascx" TagName="EmpAllUnReadMotabaa"
    TagPrefix="uc4" %>


<%@ Register Src="UC/EmpAllMotabaa.ascx" TagName="EmpAllMotabaa" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc4:EmpAllUnReadMotabaa ID="EmpAllUnReadMotabaa1" runat="server" />
  
    
</asp:Content>

