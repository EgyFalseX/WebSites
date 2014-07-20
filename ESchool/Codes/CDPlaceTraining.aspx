<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDPlaceTraining.aspx.cs" Inherits="CDPlaceTraining" %>



<%@ Register src="UC/CDPlaceTraining.ascx" tagname="CDPlaceTraining" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDPlaceTraining ID="CDPlaceTraining1" runat="server" />
    
</asp:Content>

