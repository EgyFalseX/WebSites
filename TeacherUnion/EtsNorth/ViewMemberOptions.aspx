<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="ViewMemberOptions.aspx.cs" Inherits="Default2" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 504px;
        }
        .auto-style2
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1" dir="rtl">
        <tr>
            <td>
                &nbsp;</td>
            <td class="auto-style2">
                <dx:ASPxValidationSummary ID="ASPxVS" runat="server" RightToLeft="True" ShowErrorsInEditors="True" ValidationGroup="VG" Visible="False">
                </dx:ASPxValidationSummary>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="12pt" Text="المديرية">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbModereaId" runat="server" Font-Size="12pt" Width="250px" DataSourceID="DSCDModerea" TextField="Moderea" ValueField="ModereaId" ValueType="System.Int32" AutoPostBack="True">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="Moderea" />
                    </Columns>
                    <ValidationSettings ValidationGroup="VG">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="12pt" Text="الادارة">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cdEdaraId" runat="server" Font-Size="12pt" Width="250px" AutoPostBack="True" DataSourceID="DSCDEDARET" TextField="EDARET" ValueField="EdaraId" ValueType="System.Int32">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="EDARET" />
                    </Columns>
                    <ValidationSettings ValidationGroup="VG">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="12pt" Text="المدرسة">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cdGehaId" runat="server" Font-Size="12pt" Width="250px" DataSourceID="DSCDGeha" TextField="GehaName" ValueField="GehaId" ValueType="System.Int32">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="GehaName" />
                    </Columns>
                    <ValidationSettings ValidationGroup="VG">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <dx:ASPxButton ID="btnOk" runat="server" Font-Size="12pt" Text="عرض" Width="150px" OnClick="btnOk_Click" ValidationGroup="VG">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
            <asp:SqlDataSource ID="DSCDModerea" runat="server" ConnectionString="<%$ ConnectionStrings:EtsNorthConnectionString %>" SelectCommand="SELECT [ModereaId], [Moderea], [GovId] FROM [CDModerea]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSCDEDARET" runat="server" ConnectionString="<%$ ConnectionStrings:EtsNorthConnectionString %>" SelectCommand="SELECT [EdaraId], [EDARET], [ModereaId] FROM [CDEDARET] WHERE ([ModereaId] = @ModereaId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbModereaId" DefaultValue="0" Name="ModereaId" PropertyName="Value" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSCDGeha" runat="server" ConnectionString="<%$ ConnectionStrings:EtsNorthConnectionString %>" SelectCommand="SELECT [GehaId], [GehaName] FROM [CDGeha] WHERE ([EdaraId] = @EdaraId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cdEdaraId" DefaultValue="0" Name="EdaraId" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

