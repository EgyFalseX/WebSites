<%@ Page Title="" Language="C#" MasterPageFile="~/Zamala/master.master" AutoEventWireup="true" CodeFile="zdataNew.aspx.cs" Inherits="zdataNew" %>

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
            <td style="text-align: center">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" Theme="Default" ShowItemCaptionColon="False">
                    <Items>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxValidationSummary ID="valid" runat="server" ValidationGroup="gv">
                                    </dx:ASPxValidationSummary>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="الاسم">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbNAME" runat="server" Width="200px">
                                        <ValidationSettings ValidationGroup="gv">
                                            <RequiredField ErrorText="يجب ادخال الاسم" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption=" تاريخ الميلاد">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxDateEdit ID="debdate" runat="server" Width="200px">
                                        <ValidationSettings ValidationGroup="gv">
                                            <RequiredField ErrorText="يجب ادخال تاريخ الميلاد" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="تاريخ التعيين">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxDateEdit ID="detaeendate" runat="server" Width="200px">
                                        <ValidationSettings ValidationGroup="gv">
                                            <RequiredField ErrorText="يجب ادخال تاريخ التعيين" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="المرتب">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbsalary" runat="server" Width="200px">
                                        <ValidationSettings ValidationGroup="gv">
                                            <RequiredField ErrorText="يجب ادخال الراتب" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="حفظ" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ" ValidationGroup="gv" Width="120px">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxLabel ID="lblState" runat="server" Font-Bold="True">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                    <SettingsItemCaptions Location="Right" VerticalAlign="Middle" />
                </dx:ASPxFormLayout>
                <asp:AccessDataSource ID="dsData" runat="server" DataFile="~/App_Data/41.mdb" DeleteCommand="DELETE FROM [zdata] WHERE (([memberid] = ?) OR ([memberid] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [zdata] ([memberid], [NAME], [bdate], [taeendate], [salary], [userin], [datein]) VALUES (?, ?, ?, ?, ?, ?, DATE())" SelectCommand="SELECT [memberid], [NAME], [bdate], [taeendate], [salary], [userin], [datein] FROM [zdata]" UpdateCommand="UPDATE [zdata] SET [NAME] = ?, [bdate] = ?, [taeendate] = ?, [salary] = ?, [userin] = ?, [datein] = ? WHERE (([memberid] = ?) OR ([memberid] IS NULL AND ? IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="memberid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="memberid" Type="Int32" />
                        <asp:Parameter Name="NAME" Type="String" />
                        <asp:Parameter Name="bdate" Type="DateTime" />
                        <asp:Parameter Name="taeendate" Type="DateTime" />
                        <asp:Parameter Name="salary" Type="Double" />
                        <asp:SessionParameter DefaultValue="-1" Name="userin" SessionField="UserIDZamala" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="NAME" Type="String" />
                        <asp:Parameter Name="bdate" Type="DateTime" />
                        <asp:Parameter Name="taeendate" Type="DateTime" />
                        <asp:Parameter Name="salary" Type="Double" />
                        <asp:Parameter Name="userin" Type="Int32" />
                        <asp:Parameter Name="datein" Type="DateTime" />
                        <asp:Parameter Name="memberid" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

