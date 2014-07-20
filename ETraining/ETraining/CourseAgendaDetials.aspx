<%@ Page Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="CourseAgendaDetials.aspx.cs" Inherits="CourseAgendaDetials" %>
<%@ Register src="UC/TrnCourseAgendaViewerUC.ascx" tagname="TrnCourseAgendaViewerUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>تفاصي اجندة الدوره</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <uc1:TrnCourseAgendaViewerUC ID="TrnCourseAgendaViewerUC2" runat="server" />
    </div>
</asp:Content>