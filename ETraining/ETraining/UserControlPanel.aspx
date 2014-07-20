<%@ Page Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="UserControlPanel.aspx.cs" Inherits="UserControlPanel" %>

<%@ Register src="UC/UserInformationUC.ascx" tagname="UserInformationUC" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>لوحة التحكم</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <uc1:UserInformationUC ID="UserInformationUC1" runat="server" />
    </div>
</asp:Content>

