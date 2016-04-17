<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="StLogin.aspx.cs" Inherits="StLogin_" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 306px;
        }
        .style3
        {            direction: ltr;
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
    <asp:Panel ID="PnlLogin" runat="server" Visible="False">
        <table class="style2" dir="rtl" align="center" border="1">
            <tr>
                <td style="text-align: left" align="left" class="style3">
                    <asp:TextBox ID="TxtUserName" runat="server" Width="210px"></asp:TextBox>
                </td>
                <td style="text-align: right" class="style4">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" 
                        Font-Size="14px" Text="User Name" ForeColor="#0033CC"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left" align="left" class="style3">
                    <asp:TextBox ID="TxtPassword" runat="server" 
                TextMode="Password" Width="210px"></asp:TextBox>
                </td>
                <td style="text-align: right" class="style4">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" 
                        Font-Size="14px" Text="Password" ForeColor="#0033CC"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" class="style3">
                    <asp:Button ID="BtnLogin" runat="server" onclick="BtnLogin_Click" Text="Log in" 
                        Width="123px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style3">
                    <asp:Label ID="LblState" runat="server" BackColor="Yellow" Font-Bold="False" 
                        Font-Italic="False"></asp:Label>
                </td>
            </tr>
        </table>
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

