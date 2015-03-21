<%@ Page Title="" Language="C#" MasterPageFile="~/TEFollowUp/master.master" AutoEventWireup="true" CodeFile="XRepViewer09.aspx.cs" Inherits="XRepViewer09" %>

<%@ Register assembly="DevExpress.XtraReports.v12.2.Web, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>


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
            <asp:AccessDataSource ID="DSYear" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [yearid], [yearname] FROM [cdyear]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSemp" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT empname, empid FROM tblempdata
 WHERE 
((SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true)
 OR 
(userin = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                </SelectParameters>
            </asp:AccessDataSource>
                </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" 
                    RightToLeft="True" Theme="PlasticBlue">
                    <Items>
                        <dx:LayoutItem Caption="السنة">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cbyear" runat="server" DataSourceID="DSYear" DropDownStyle="DropDown" EnableCallbackMode="True" EnableIncrementalFiltering="True" Font-Size="Small" IncrementalFilteringMode="StartsWith" OnSelectedIndexChanged="cbMoshref_SelectedIndexChanged" RightToLeft="True" TextField="yearname" ValueField="yearid" Width="250px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="الاسم" FieldName="yearname" />
                                        </Columns>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="المعلم">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cbMoshref" runat="server" DataSourceID="DSemp" DropDownStyle="DropDown" EnableCallbackMode="True" EnableIncrementalFiltering="True" Font-Size="Small" IncrementalFilteringMode="StartsWith" OnSelectedIndexChanged="cbMoshref_SelectedIndexChanged" RightToLeft="True" TextField="empname" ValueField="empid" Width="250px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="الاسم" FieldName="empname" />
                                        </Columns>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxButton ID="btnView" runat="server" OnClick="btnView_Click" Text="عرض">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                    <SettingsItemCaptions Location="Top" />
                </dx:ASPxFormLayout>
            </td>
        </tr>
        </table>
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="rtl">
                <dx:ReportToolbar ID="ReportToolbar1" runat="server" 
                    ReportViewerID="ReportViewer1" ShowDefaultButtons="False" Theme="PlasticBlue" 
                    Visible="False">
                    <Items>
                        <dx:ReportToolbarButton ItemKind="Search" />
                        <dx:ReportToolbarSeparator />
                        <dx:ReportToolbarButton ItemKind="PrintReport" />
                        <dx:ReportToolbarButton ItemKind="PrintPage" />
                        <dx:ReportToolbarSeparator />
                        <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
                        <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
                        <dx:ReportToolbarLabel ItemKind="PageLabel" />
                        <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
                        </dx:ReportToolbarComboBox>
                        <dx:ReportToolbarLabel ItemKind="OfLabel" />
                        <dx:ReportToolbarTextBox ItemKind="PageCount" />
                        <dx:ReportToolbarButton ItemKind="NextPage" />
                        <dx:ReportToolbarButton ItemKind="LastPage" />
                        <dx:ReportToolbarSeparator />
                        <dx:ReportToolbarButton ItemKind="SaveToDisk" />
                        <dx:ReportToolbarButton ItemKind="SaveToWindow" />
                        <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                            <Elements>
                                <dx:ListElement Value="pdf" />
                                <dx:ListElement Value="xls" />
                                <dx:ListElement Value="xlsx" />
                                <dx:ListElement Value="rtf" />
                                <dx:ListElement Value="mht" />
                                <dx:ListElement Value="html" />
                                <dx:ListElement Value="txt" />
                                <dx:ListElement Value="csv" />
                                <dx:ListElement Value="png" />
                            </Elements>
                        </dx:ReportToolbarComboBox>
                    </Items>
                    <Styles>
                        <LabelStyle>
                        <Margins MarginLeft="3px" MarginRight="3px" />
                        </LabelStyle>
                    </Styles>
                </dx:ReportToolbar>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ReportViewer ID="ReportViewer1" runat="server" Report="<%# new XtraReport09() %>" ReportName="XtraReport09" Theme="BlackGlass" Visible="False">
                </dx:ReportViewer>
            </td>
        </tr>
    </table>
    </asp:Content>

