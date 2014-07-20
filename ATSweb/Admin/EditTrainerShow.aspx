<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="EditTrainerShow.aspx.cs" Inherits="EditTrainerShow" %>

<%@ Register src="UC/EditTrainerShow.ascx" tagname="EditTrainerShow" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditTrainerShow ID="EditTrainerShow1" runat="server" />
</asp:Content>

