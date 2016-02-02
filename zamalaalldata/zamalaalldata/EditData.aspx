<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="EditData.aspx.cs" Inherits="EditData" %>

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
                        <dx:ASPxLabel ID="tbGov" runat="server" Font-Bold="True" ForeColor="Red" Visible="False">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxLabel ID="tbID" runat="server" Font-Bold="True" ForeColor="Red" Visible="False">
                        </dx:ASPxLabel>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الادارة">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxComboBox ID="lueEdaraId" runat="server" DataSourceID="dsEdaraId" TextField="Edara" ValueField="EdaraId" Width="250px">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="Edara" />
                            </Columns>
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="الادارة" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:AccessDataSource ID="dsEdaraId" runat="server" DataFile="~/App_Data/datacontact.mdb" SelectCommand="SELECT EdaraId, Edara FROM CdEdara WHERE (ModereaId = ?)">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="Gov" QueryStringField="id" />
                            </SelectParameters>
                        </asp:AccessDataSource>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الاسم">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="tbmembername" runat="server" Width="250px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="الاسم" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="تاريخ التعيين">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxDateEdit ID="detaeendate" runat="server" Width="250px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="تاريخ التعيين" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxDateEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الحالة">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxComboBox ID="luestateid" runat="server" DataSourceID="dsstateid" TextField="stataename" ValueField="stataid" Width="250px">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="stataename" />
                            </Columns>
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="الحالة" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:AccessDataSource ID="dsstateid" runat="server" DataFile="~/App_Data/datacontact.mdb" SelectCommand="SELECT [stataid], [stataename] FROM [cdstatae]"></asp:AccessDataSource>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="جهة العمل">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="tbgeha" runat="server" Width="250px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="جهة العمل" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="المرتب الأساسي">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="tbsalary" runat="server" Width="250px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="المرتب" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الايميل">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="tbmail" runat="server" Width="250px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="الايميل" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الموبيل">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="tbmobile" runat="server" Width="250px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="الموبيل" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings HorizontalAlign="Right" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <layoutitemnestedcontrolcollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ" ValidationGroup="gv" Width="200px">
                        </dx:ASPxButton>
                    </dx:LayoutItemNestedControlContainer>
                </layoutitemnestedcontrolcollection>
            </dx:LayoutItem>
        </Items>
        <settingsitemcaptions location="Top" />
    </dx:ASPxFormLayout>
</asp:Content>

