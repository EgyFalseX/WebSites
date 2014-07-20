<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="SelectMedicalChanges.aspx.cs" Inherits="SelectMedicalChanges" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 463px;
        }
        .auto-style2
        {
            direction: rtl;
        }
        .auto-style3
        {
            direction: rtl;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td bgcolor="Gray" colspan="2" style="text-align: center">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="14pt" ForeColor="White" Text="تحويلات الاعضاء">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbSyndicateIdMem" runat="server" AutoPostBack="True" DataSourceID="dsSyndicateIdMem" Font-Size="12pt" TextField="Syndicate" ValueField="SyndicateId" Width="250px" DropDownStyle="DropDown">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="Syndicate" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsSyndicateIdMem" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]"></asp:AccessDataSource>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="12pt" Text="فرعية (الكارنية)">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <dx:ASPxComboBox ID="cbMemberMem" runat="server" DataSourceID="dsMemberIdMem" Font-Size="12pt" TextField="MemberName" ValueField="MemberId" Width="250px" DropDownStyle="DropDown">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="MemberName" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsMemberIdMem" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [MemberId], [MemberName] FROM [TBLMembers] WHERE ([SyndicateId] = ?) ORDER BY [MemberName]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbSyndicateIdMem" DefaultValue="-1" Name="SyndicateId" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
            <td class="auto-style3" valign="top">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="12pt" Text="اسم العضو">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxButton ID="btnMem" runat="server" OnClick="btnMem_Click" Text="الي صفحة تحويلات الاعضاء" Width="200px">
                </dx:ASPxButton>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
    </table>
    <p>
    </p>
    <table align="center" class="auto-style1">
        <tr>
            <td bgcolor="Gray" colspan="2" style="text-align: center">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="14pt" ForeColor="White" Text="تحويلات التابعين">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbSyndicateIdMem2" runat="server" AutoPostBack="True" DataSourceID="dsSyndicateIdMem" Font-Size="12pt" TextField="Syndicate" ValueField="SyndicateId" Width="250px" DropDownStyle="DropDown">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="Syndicate" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="12pt" Text="فرعية (الكارنية)">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbMemberMem2" runat="server" AutoPostBack="True" DataSourceID="dsMemberIdMem2" Font-Size="12pt" TextField="MemberName" ValueField="MemberId" Width="250px" DropDownStyle="DropDown">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="MemberName" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsMemberIdMem2" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT MemberId, MemberName FROM TBLMembers WHERE (SyndicateId = ?) ORDER BY MemberName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbSyndicateIdMem2" DefaultValue="-1" Name="SyndicateId" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="12pt" Text="اسم العضو">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbMemberMem3" runat="server" datasourceid="dsMemberIdMemCom" Font-Size="12pt" TextField="CompanionName" ValueField="CompanionId" Width="250px" DropDownStyle="DropDown">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="CompanionName" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsMemberIdMemCom" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [CompanionId], [CompanionName] FROM [TBLCompanion] WHERE ([MemberId] = ?) ORDER BY [CompanionName]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbMemberMem2" DefaultValue="0" Name="MemberId" PropertyName="Value" Type="Decimal" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Size="12pt" Text="اسم التابع">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxButton ID="btnMem2" runat="server" OnClick="btnMem2_Click" Text="الي صفحة تحويلات التابعين" Width="200px">
                </dx:ASPxButton>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>

