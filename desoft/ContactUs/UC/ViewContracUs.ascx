<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewContracUs.ascx.cs"
    Inherits="ViewContracUs" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<style type="text/css">
    .style1
    {
        width: 476px;
        height: 210px;
    }
    .style2
    {
        width: 127px;
        direction: rtl;
        height: 28px;
    }
    .style3
    {
        width: 146px;
        height: 28px;
    }
    .style4
    {
        height: 28px;
        direction: rtl;
    }
    .style5
    {
        height: 82px;
        direction: rtl;
    }
    .style6
    {
        height: 81px;
        direction: rtl;
    }
    .style7
    {
        height: 23px;
    }
</style>
<table align="center">
    <tr>
        <td>
            <asp:Repeater ID="RepeaterViewer" runat="server" DataSourceID="DSData">
                <ItemTemplate>
                    <table class="style1" border="3">
                        <tr>
                            <td align="right" class="style3" style="direction: rtl">
                                <dx:ASPxLabel ID="Lblsefa" runat="server" Text='<% # bind("sefa") %>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style4">
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="الصفه : " ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" class="style2">
                                <dx:ASPxLabel ID="Lblconame" runat="server" Text='<% # bind("coname") %>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style4">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="الاسم : " ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" class="style4">
                                <dx:ASPxLabel ID="Lblcontype" runat="server" Text='<% # bind("contype") %>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="style4">
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="نوع الرساله : " ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" class="style5" valign="top">
                                <dx:ASPxMemo ID="tbmassage" runat="server" Height="80px" ReadOnly="True" Text='<% # bind("massage") %>'
                                    Width="360px">
                                </dx:ASPxMemo>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" valign="top"
                                bgcolor="Gray" class="style5">
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="الرساله : " ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" class="style6" valign="top">
                                <dx:ASPxMemo ID="tbrply" runat="server" Height="80px" ReadOnly="True" Text='<% # bind("rply") %>'
                                    Width="360px">
                                </dx:ASPxMemo>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" valign="top"
                                bgcolor="Gray" class="style6">
                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="الرد : " ForeColor="White">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="4" class="style7" valign="top" bgcolor="Gray">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
        </td>
    </tr>
</table>
<asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT addno, coname, sefaid, contypeid, massage, rply,
(Select sefa From sefa Where sefaid = contact.sefaid) AS sefa,
(Select contype From contype Where contypeid = contact.contypeid) AS contype
 FROM contact WHERE (adminagree = true)"></asp:AccessDataSource>
