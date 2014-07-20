<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="UserMeeting.aspx.cs" Inherits="UserMeeting" %>


<%@ Register src="UC/UserMeeting.ascx" tagname="UserMeeting" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <uc1:UserMeeting ID="UserMeeting1" runat="server" />
   
</asp:Content>

