<%@ Page Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="TrnApologizeDetials.aspx.cs" Inherits="TrnApologizeDetials" %>
<%@ Register src="UC/TrnApologizeViewerUC.ascx" tagname="TrnApologizeViewerUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>تفاصي الاعتزار</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <uc1:TrnApologizeViewerUC ID="TrnApologizeViewerUC1" runat="server" />
    </div>
</asp:Content>



