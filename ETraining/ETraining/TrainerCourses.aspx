<%@ Page Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="TrainerCourses.aspx.cs" Inherits="TrainerCourses" %>
<%@ Register src="UC/TrnUserCourseViewerUC.ascx" tagname="TrnUserCourseViewerUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>دورات المتدربيـــن</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <uc1:TrnUserCourseViewerUC ID="TrnUserCourseViewerUC1" runat="server" />
    </div>
</asp:Content>