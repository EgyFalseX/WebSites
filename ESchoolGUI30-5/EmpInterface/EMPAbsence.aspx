<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPAbsence.aspx.cs" Inherits="EmpInterface_EMPAbsence" Title="Absence Page" %>

<%@ Register Src="../UserControls/EMPAbsences.ascx" TagName="EMPAbsences" TagPrefix="uc1" %>

<%@ Register Src="../UserControls/emgPerviousPage.ascx" TagName="emgPerviousPage"
    TagPrefix="uc3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc3:emgPerviousPage ID="EmgPerviousPage1" runat="server" FirstSession="EMPID" IndexUrl ="../EmpLogin.aspx" />
    <uc1:EMPAbsences ID="EMPAbsences1" runat="server" />
  
   
    
</asp:Content>

