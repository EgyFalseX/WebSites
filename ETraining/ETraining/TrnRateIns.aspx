<%@ Page Title="" Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="TrnRateIns.aspx.cs" Inherits="TrnRateIns" %>

<%@ Register src="UC/TrnInstructorRating.ascx" tagname="TrnInstructorRating" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:TrnInstructorRating ID="TrnInstructorRating1" runat="server" />
</asp:Content>

