<%@ Page Title="" Language="C#" MasterPageFile="masterVideo.master" AutoEventWireup="true" CodeFile="MainVideoEditor.aspx.cs" Inherits="MainVideoEditor" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" RightToLeft="True" Theme="DevEx" Width="250px">
                    <Items>
                        <dx:LayoutItem Caption="رابط الفيديو">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="txtLink" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/GallaryData.mdb" 
                SelectCommand="SELECT [Id], [VideoFolder] FROM [VideoFolder]">
            </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

