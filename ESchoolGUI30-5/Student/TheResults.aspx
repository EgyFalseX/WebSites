<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="FirstTerm.aspx.cs" Inherits="Student_FirstTerm" %>

<%@ Register src="../UserControls/StudentResult.ascx" tagname="StudentResult" tagprefix="uc1" %>

<%@ Register src="../UserControls/emgPerviousPage.ascx" tagname="emgPerviousPage" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <uc2:emgPerviousPage ID ="prev" runat="server" FirstSession="STID" IndexUrl="Default.aspx" />
    <uc1:StudentResult ID="StudentResult1" runat="server" />
</asp:Content>

