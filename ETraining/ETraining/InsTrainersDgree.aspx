<%@ Page Title="" Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="InsTrainersDgree.aspx.cs" Inherits="InsTrainersDgree" %>

<%@ Register src="UC/InsTrainersDgreesUC.ascx" tagname="InsTrainersDgreesUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:InsTrainersDgreesUC ID="InsTrainersDgreesUC1" runat="server" />

</asp:Content>

