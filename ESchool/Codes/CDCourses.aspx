<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDCourses.aspx.cs" Inherits="CDCourses" %>


<%@ Register src="UC/CDCourses.ascx" tagname="CDCourses" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDCourses ID="CDCourses1" runat="server" />
    
</asp:Content>

