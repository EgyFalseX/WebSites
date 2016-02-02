<%@ Page Title="" Language="C#" MasterPageFile="~/RetirementWeb/master.master" AutoEventWireup="true" CodeFile="NIDGeneralEdit.aspx.cs" Inherits="NIDGeneralEdit" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" RightToLeft="True" style="direction: rtl; text-align: center" Width="438px">
        <Items>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxValidationSummary ID="ASPxFormLayout1_E1" runat="server" ValidationGroup="gv" Width="358px">
                        </dx:ASPxValidationSummary>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxLabel ID="ASPxFormLayout1_E3" runat="server" Font-Bold="True" ForeColor="Red" Text="من فضلك ادخال 14 رقم الخاص بالرقم القومي">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الرقم القومي">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="tbNID" runat="server" MaxLength="14" Width="250px">
                            <validationsettings>
                                <requiredfield errortext="يجب ادخال الرقم القومي" isrequired="True" />
                            </validationsettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ الرقم القومي" ValidationGroup="gv" Width="200px">
                        </dx:ASPxButton>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxLabel ID="lblStatus" runat="server">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
        <settingsitemcaptions location="Top" />
    </dx:ASPxFormLayout>
</asp:Content>

