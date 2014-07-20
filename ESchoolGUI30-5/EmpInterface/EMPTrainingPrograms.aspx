<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPTrainingPrograms.aspx.cs" Inherits="EmpInterface_EMPTrainingProgramst" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPTrainingPrograms.ascx" TagName="EMPTrainingPrograms"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPTrainingPrograms ID="EMPTrainingPrograms1" runat="server" />
   
</asp:Content>

