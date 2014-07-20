<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="RotatorDataUser.aspx.cs" Inherits="RotatorDataUser" %>


<%@ Register src="UC/RotatorDataUser.ascx" tagname="RotatorDataUser" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   
    <uc1:RotatorDataUser ID="RotatorDataUser1" runat="server" />
   
   
</asp:Content>

