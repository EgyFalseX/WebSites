﻿<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="StLogin.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 306px;
        }
        .style3
        {
        }
        .style4
        {
            width: 137px;
        }
        .auto-style1 {
            text-align: center;
        }
        .style5
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <asp:Panel ID="PnlLogin" runat="server" Visible="True">
        <p class="style5">
            <font color="#000080"><b style="text-align: center">You can show the
            <span ID="result_box" class="short_text" lang="en"><span class="hps">the exam</span>
            <span class="hps">grades by using seat number</span></span><span lang="en-us">.</span></b></font></p>
        <table align="center" border="1" class="style2" dir="rtl">
            <tr>
                <td class="auto-style1">
                    <asp:Image ID="Image2" runat="server" Height="78px" Width="86px" 
                        ImageUrl="~/stgate/images/HU_student.png" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="ResultXViewer.aspx" 
                        Font-Bold="True">Results With seat number</asp:HyperLink>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
