<%@ Page Title="" Language="C#" MasterPageFile="~/ContactUs/Master.master" AutoEventWireup="true" CodeFile="newcontact.aspx.cs" Inherits="newcontact" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        .auto-style2 {
            width: 144px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td class="auto-style2" style="text-align: center">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Height="270px" RightToLeft="True" Width="352px">
                    <Items>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxValidationSummary ID="vs" runat="server" ShowErrorsInEditors="True" ValidationGroup="vg">
                                    </dx:ASPxValidationSummary>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="الاسم">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbvistorname" runat="server" Width="250px">
                                        <ValidationSettings ValidationGroup="vg">
                                            <RequiredField IsRequired="True" ErrorText="الاسم" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="الدولة">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbcountry" runat="server" Width="250px">
                                        <ValidationSettings ValidationGroup="vg">
                                            <RequiredField IsRequired="True" ErrorText="الدولة" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="جوال">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbmobile" runat="server" Width="250px">
                                        <ValidationSettings ValidationGroup="vg">
                                            <RequiredField IsRequired="True" ErrorText="الجوال" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="ايميل">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbmail" runat="server" Width="250px">
                                        <ValidationSettings ValidationGroup="vg">
                                            <RequiredField IsRequired="True" ErrorText="الايميل" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="الدورات التي ترغب بها">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxMemo ID="tbcourses" runat="server" Height="100px" Width="300px">
                                        <ValidationSettings ValidationGroup="vg">
                                            <RequiredField ErrorText="الدورات" />
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings Location="Top" />
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxCaptcha ID="captcha" runat="server">
                                        <ValidationSettings ErrorText="الحروف غير صحيحه" ValidationGroup="vg">
                                            <RequiredField ErrorText="ادخل الحروف من الصورة" IsRequired="True" />
                                        </ValidationSettings>
                                        <RefreshButton Text="تغير الصورة">
                                        </RefreshButton>
                                        <TextBox LabelText="ادخل الحروف من الصورة" />
                                        <ChallengeImage ForegroundColor="#000000">
                                        </ChallengeImage>
                                    </dx:ASPxCaptcha>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ" ValidationGroup="vg">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxLabel ID="lblResult" runat="server" Font-Bold="True">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </td>
        </tr>
    </table>
</asp:Content>

