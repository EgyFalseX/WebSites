﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="AddTrainee.aspx.cs" Inherits="AddTrainee" %>

<%@ Register src="UC/AddTrainee.ascx" tagname="AddTrainee" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AddTrainee ID="AddTrainee1" runat="server" />
</asp:Content>

