<%@ Page Title="" Language="C#" MasterPageFile="~/zamalaalldata/master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="zamalaalldata_Default" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td>
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" style="direction: rtl" Theme="DevEx">
    <Items>
        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxValidationSummary ID="validator" runat="server" ValidationGroup="vg">
                    </dx:ASPxValidationSummary>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
        <dx:LayoutItem Caption="المحافظة">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxComboBox ID="lueGov" runat="server" DataSourceID="dsData" DropDownStyle="DropDown" TextField="GOV" ValueField="GovId" Width="250px">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسم" FieldName="GOV" />
                        </Columns>
                        <ValidationSettings ValidationGroup="vg">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
            <CaptionSettings HorizontalAlign="Right" Location="Top" />
        </dx:LayoutItem>
        <dx:LayoutItem Caption="الرقم القومي">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxTextBox ID="tbNID" runat="server" Width="250px">
                        <ValidationSettings ValidationGroup="vg">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
            <CaptionSettings HorizontalAlign="Right" Location="Top" />
        </dx:LayoutItem>
        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
            <LayoutItemNestedControlCollection>
                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                    <asp:AccessDataSource ID="dsData" runat="server" DataFile="~/App_Data/logindata.mdb" SelectCommand="SELECT [GovId], [GOV] FROM [CDGov]"></asp:AccessDataSource>
                    <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="استمرار" ValidationGroup="vg">
                    </dx:ASPxButton>
                </dx:LayoutItemNestedControlContainer>
            </LayoutItemNestedControlCollection>
        </dx:LayoutItem>
    </Items>
</dx:ASPxFormLayout>
            </td>
        </tr>
    </table>
</asp:Content>

