<%@ Page Title="" Language="C#" MasterPageFile="~/Maintenance/master.master" AutoEventWireup="true" CodeFile="MaintenanceOpenCase.aspx.cs" Inherits="MaintenanceOpenCase" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>


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
                <dx:ASPxFormLayout ID="ASPxFormLayoutMain" runat="server" EnableTheming="True" RightToLeft="True" style="text-align: center" Theme="PlasticBlue" Width="600px">
                    <Items>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxValidationSummary ID="AspxValidatorMain" runat="server" ValidationGroup="vg">
                                    </dx:ASPxValidationSummary>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="التاريخ">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxDateEdit ID="deMaintenanceDate" runat="server" Enabled="False" TabIndex="10" Width="250px">
                                        <DropDownButton Visible="False">
                                        </DropDownButton>
                                        <Border BorderStyle="None" />
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="المرسل">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbrealname" runat="server" Enabled="False" TabIndex="10" Width="250px">
                                        <Border BorderStyle="None" />
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="المرسل الية">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cbtodeptId" runat="server" DataSourceID="dsDep" TextField="deptName" ValueField="deptId" Width="250px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="الاسم" FieldName="deptName" />
                                        </Columns>
                                        <ValidationSettings>
                                            <RequiredField ErrorText="يجب اختيار المرسل ألية" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:AccessDataSource ID="dsDep" runat="server" DataFile="~/App_Data/Maintenance.mdb" SelectCommand="SELECT [deptId], [deptName] FROM [CDdept]"></asp:AccessDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="العنوان">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbmaddres" runat="server" TabIndex="1" Width="250px">
                                        <ValidationSettings>
                                            <RequiredField ErrorText="يجب ادحال العنوان" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="نص الرسالة" RowSpan="2">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxMemo ID="tbmassage" runat="server" Height="150px" TabIndex="2" Width="400px">
                                        <ValidationSettings>
                                            <RequiredField ErrorText="يجب ادحال نص الرسالة" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="حفظ" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" TabIndex="3" Text="حفظ" ValidationGroup="vg" Width="120px">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lblState" runat="server" Font-Bold="True" Font-Size="16pt" ForeColor="Green"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Content>

