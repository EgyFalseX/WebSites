<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="SelectSyn_Sarf.aspx.cs" Inherits="SelectSyn_Sarf" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" RightToLeft="True" Width="349px">
        <Items>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxValidationSummary ID="ASPxFormLayout1_E1" runat="server" ValidationGroup="gv" Width="298px">
                        </dx:ASPxValidationSummary>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الفرعية">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxComboBox ID="lueSyn" runat="server" DataSourceID="dsData" TextField="Syndicate" ValueField="SyndicateId" Width="250px">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="Syndicate" />
                            </Columns>
                            <validationsettings validationgroup="gv">
                                <requiredfield errortext="يجب ادخال الفرعية" isrequired="True" />
                            </validationsettings>
                        </dx:ASPxComboBox>
                        <asp:AccessDataSource ID="dsData" runat="server" DataFile="~/App_Data/retdatalogin.mdb" SelectCommand="SELECT [SyndicateId], [Syndicate] FROM [cdSyndicate]"></asp:AccessDataSource>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="رقم الصرف">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="tbSarf" runat="server" Width="250px">
                            <validationsettings validationgroup="gv">
                                <requiredfield errortext="يجب ادخال رقم الصرف" isrequired="True" />
                            </validationsettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="بحث" Width="182px">
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

