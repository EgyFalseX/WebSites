<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CatCreator.aspx.cs" Inherits="CatCreator" %>

<%@ Register src="UC/CatCreator.ascx" tagname="CatCreator" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>&#1605;&#1581;&#1585;&#1585; &#1575;&#1604;&#1593;&#1606;&#1575;&#1589;&#1585;</title>
    <style type="text/css">
        .style3
        {
            width: 100%;
        }
        .style4
        {
            width: 532px;
        }
        .style5
        {
            height: 19px;
        }
        .style6
        {
            width: 532px;
            height: 19px;
        }
        .style7
        {
            height: 19px;
            width: 252px;
        }
        .style8
        {
            width: 252px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table cellpadding="0" cellspacing="0" class="style3">
        <tr>
            <td class="style7">
            </td>
            <td class="style6">
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style4">

    <uc1:CatCreator ID="CatCreator1" runat="server" />

            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

