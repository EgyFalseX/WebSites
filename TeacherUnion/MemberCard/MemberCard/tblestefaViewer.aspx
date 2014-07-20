<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tblestefaViewer.aspx.cs" Inherits="tblestefaViewer" %>

<%@ Register src="UC/tblestefaViewer.ascx" tagname="tblestefaViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:tblestefaViewer ID="tblestefaViewer1" runat="server" />
    
</asp:Content>

