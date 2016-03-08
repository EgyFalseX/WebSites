<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="EditTrainee.aspx.cs" Inherits="EditTrainee" %>

<%@ Register src="UC/EditTrainee.ascx" tagname="EditTrainee" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditTrainee ID="EditTrainee1" runat="server" />
</asp:Content>

