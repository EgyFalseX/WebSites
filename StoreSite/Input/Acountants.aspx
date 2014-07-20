<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="Acountants.aspx.cs" Inherits="Student_Acountants" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="UC/stPayments.ascx" tagname="stPayments" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 758px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table cellpadding="0" cellspacing="0" class="style3">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style4">
                <uc3:stPayments ID="stPayments1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    
    </asp:Content>

