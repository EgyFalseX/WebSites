<%@ Page Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="tatemat.aspx.cs" Inherits="Student_tatemat" Title="Untitled Page" %>

<%@ Register src="../UserControls/TataematGrid.ascx" tagname="TataematGrid" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:TataematGrid ID="TataematGrid1" runat="server" />
</asp:Content>

