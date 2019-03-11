<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChooseFasl.ascx.cs"
    Inherits="ChooseFasl" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<style type="text/css">
    .style1 {
        width: 597px;
        height: 179px;
    }

    .style2 {
        width: 127px;
        direction: rtl;
        height: 28px;
    }

    .style3 {
    }

    .style4 {
        height: 28px;
        direction: rtl;
    }

    .style9 {
        height: 28px;
        direction: rtl;
        width: 65px;
    }

    .style12 {
        height: 39px;
        direction: rtl;
    }

    .style13 {
        height: 39px;
        direction: rtl;
        width: 65px;
    }

    .style14 {
        height: 31px;
        direction: rtl;
    }

    .style15 {
        height: 31px;
        direction: rtl;
        width: 65px;
    }

    .style16 {
        height: 17px;
    }

    .auto-style1 {
        height: 33px;
        direction: rtl;
    }

    .auto-style2 {
        height: 33px;
        direction: rtl;
        width: 65px;
    }

    .auto-style3 {
        height: 32px;
    }

    .auto-style4 {
        height: 32px;
        direction: rtl;
        width: 65px;
    }
</style>

<table align="center">
    <tr>
        <td>
            <asp:Repeater ID="RepeaterViewer" runat="server" DataSourceID="DSData">
                <ItemTemplate>
                    <table class="style1" border="3">
                        <tr>
                            <td align="right" class="style3" style="direction: rtl; text-align: center;" rowspan="3">
                                <dx:ASPxHyperLink ID="lblGoToEdit" runat="server" Text="ادخال الدرجات" NavigateUrl='<% # Bind("link")%>' Font-Bold="True">
                                </dx:ASPxHyperLink>
                            </td>
                            <td align="right" class="auto-style3" style="direction: rtl">
                                <dx:ASPxLabel ID="lblSaf" runat="server" Text='<% # Bind("alsofof_name")%>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="auto-style4">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="الصف : " ForeColor="White"></dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="auto-style1">
                                <dx:ASPxLabel ID="lblFasl" runat="server" Text='<% # Bind("fasl_name")%>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" bgcolor="Gray"
                                class="auto-style2">
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="الفصل : " ForeColor="White"></dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style12" valign="top">
                                <dx:ASPxLabel ID="lblSubject" runat="server" Text='<% # Bind("subject")%>'>
                                </dx:ASPxLabel>
                            </td>
                            <td align="right" style="border: thin solid #CCCCCC; direction: rtl" valign="top"
                                bgcolor="Gray" class="style13">
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="المادة : " ForeColor="White"></dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3" class="style16" valign="top" bgcolor="Gray"></td>
                        </tr>

                    </table>
                </ItemTemplate>
            </asp:Repeater>
        </td>
    </tr>
</table>
<asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/datarsd.mdb"
    SelectCommand="SELECT teachersfof.userid, teachersfof.subjectid, teachersfof.safid, teachersfof.faslid, subjects.subject, fasl.fasl_name, alsofof.alsofof_name, '../DgreeEditor.aspx?saf=' &amp; teachersfof.safid &amp; '&amp;fasl=' &amp; teachersfof.faslid &amp; '&amp;sub=' &amp; teachersfof.subjectid AS link FROM (((teachersfof INNER JOIN subjects ON teachersfof.subjectid = subjects.subjectid) INNER JOIN alsofof ON teachersfof.safid = alsofof.alsofof_code) INNER JOIN fasl ON teachersfof.faslid = fasl.fasl_code) WHERE (teachersfof.userid = ?)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="user" SessionField="MD_uID" DbType="Int32" />
    </SelectParameters>
</asp:AccessDataSource>
