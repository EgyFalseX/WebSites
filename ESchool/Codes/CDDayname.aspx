<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDDayname.aspx.cs" Inherits="CDDayname" %>


<%@ Register src="UC/CDDayname.ascx" tagname="CDDayname" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <uc1:CDDayname ID="CDDayname1" runat="server" />

</asp:Content>

