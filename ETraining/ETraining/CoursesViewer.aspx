<%@ Page Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="CoursesViewer.aspx.cs" Inherits="CoursesViewer" %>
<%@ Register src="UC/InsCoursesViewerUC.ascx" tagname="InsCoursesViewerUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>دورات المــــدرب</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <uc1:InsCoursesViewerUC ID="InsCoursesViewerUC1" runat="server" />
    </div>
</asp:Content>