<%@ Page Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="CourseTrainerDetials.aspx.cs" Inherits="CourseTrainerViewer" %>
<%@ Register src="UC/TrnCourseTrainerViewerUC.ascx" tagname="TrnCourseTrainerViewerUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>تفاصيل الدوره</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <uc1:TrnCourseTrainerViewerUC ID="TrnCourseTrainerViewerUC2" runat="server" />
    </div>
</asp:Content>