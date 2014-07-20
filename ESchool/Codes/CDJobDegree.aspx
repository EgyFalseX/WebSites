<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDJobDegree.aspx.cs" Inherits="CDJobDegree" %>



<%@ Register src="UC/CDJobDegree.ascx" tagname="CDJobDegree" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDJobDegree ID="CDJobDegree1" runat="server" />
    
</asp:Content>

