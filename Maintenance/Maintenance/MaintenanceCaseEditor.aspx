<%@ Page Title="" Language="C#" MasterPageFile="~/Maintenance/master.master" AutoEventWireup="true" CodeFile="MaintenanceCaseEditor.aspx.cs" Inherits="MaintenanceCaseEditor" %>

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
                <dx:ASPxFormLayout ID="ASPxFormLayoutMain" runat="server" EnableTheming="True" RightToLeft="True" style="text-align: center" Theme="PlasticBlue" Width="600px" Font-Bold="False">
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
                                    <dx:ASPxDateEdit ID="deMaintenanceDate" runat="server" Enabled="False" TabIndex="10" Width="250px" Font-Bold="True">
                                        <DropDownButton Visible="False">
                                        </DropDownButton>
                                        <Border BorderStyle="None" />
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="المرسل">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbrealname" runat="server" Enabled="False" TabIndex="10" Width="250px" Font-Bold="True">
                                        <Border BorderStyle="None" />
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="المرسل الية">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cbtodeptId" runat="server" DataSourceID="dsDep" TextField="deptName" ValueField="deptId" Width="250px" ReadOnly="True" TabIndex="10" Font-Bold="True">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="الاسم" FieldName="deptName" />
                                        </Columns>
                                        <DropDownButton Visible="False">
                                        </DropDownButton>
                                        <Border BorderStyle="None" />
                                    </dx:ASPxComboBox>
                                    <asp:AccessDataSource ID="dsDep" runat="server" DataFile="~/App_Data/Maintenance.mdb" SelectCommand="SELECT [deptId], [deptName] FROM [CDdept]"></asp:AccessDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="العنوان">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="tbmaddres" runat="server" TabIndex="10" Width="250px" ReadOnly="True" Font-Bold="True">
                                        <Border BorderStyle="None" />
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="نص الرسالة" RowSpan="2">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxMemo ID="tbmassage" runat="server" Height="150px" TabIndex="10" Width="400px" ReadOnly="True" Font-Bold="True">
                                        <Border BorderStyle="None" />
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="اضافة رد">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxMemo ID="tbtodepreply" runat="server" Height="150px" Width="400px" Font-Bold="True">
                                        <ValidationSettings>
                                            <RequiredField ErrorText="يجب ادخال رد" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="اغلاق">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxCheckBox ID="cemclosed" runat="server" CheckState="Unchecked" Font-Bold="True">
                                    </dx:ASPxCheckBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="تاريخ الاغلاق">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxLabel ID="lbldateclosed" runat="server" Font-Bold="True">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="مسئول الاغلاق">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxLabel ID="lblclosename" runat="server" Font-Bold="True">
                                    </dx:ASPxLabel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="حفظ" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" TabIndex="1" Text="حفظ" ValidationGroup="vg" Width="120px" Font-Bold="True">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings VerticalAlign="Middle" />
                            <CaptionStyle Font-Bold="True">
                            </CaptionStyle>
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

