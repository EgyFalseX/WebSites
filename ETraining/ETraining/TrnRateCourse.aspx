<%@ Page Title="" Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="TrnRateCourse.aspx.cs" Inherits="TrnRateCourse" %>

<%@ Register src="UC/TrnCourseRating.ascx" tagname="TrnCourseRating" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:TrnCourseRating ID="TrnCourseRating1" runat="server" />

</asp:Content>

