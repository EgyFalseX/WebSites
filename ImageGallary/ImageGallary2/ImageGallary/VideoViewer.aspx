<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="VideoViewer.aspx.cs" Inherits="VideoViewer" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="right" dir="rtl" width="100%">
        <tr>
            <td valign="top" align="center">
                <dx:ASPxTreeList ID="ASPxTreeListData" runat="server"  AutoGenerateColumns="False" DataSourceID="dsTree" KeyFieldName="Id" ParentFieldName="ParentId" EnableCallbacks="False" OnFocusedNodeChanged="ASPxTreeListData_FocusedNodeChanged" Font-Bold="True">
                    <Columns>
                        <dx:TreeListImageColumn Caption="." FieldName="Id" VisibleIndex="0">
                            <PropertiesImage ImageUrlFormatString="images/FolderIcon.png" IsPng="True">
                            </PropertiesImage>
                            <EditFormSettings Visible="False" />
                        </dx:TreeListImageColumn>
                        <dx:TreeListTextColumn Caption="مكتبة الفيديو" FieldName="VideoFolder" VisibleIndex="1">
                        </dx:TreeListTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedNode="True" FocusNodeOnLoad="False" ProcessSelectionChangedOnServer="True" ProcessFocusedNodeChangedOnServer="True" />
                    <Border BorderStyle="Solid" BorderWidth="1px" />
                </dx:ASPxTreeList>
                <asp:HiddenField runat="server" ID="HFId" />
                <asp:AccessDataSource ID="dsTree" runat="server" DataFile="~/App_Data/GallaryData.mdb" DeleteCommand="DELETE FROM [VideoFolder] WHERE [Id] = ?" InsertCommand="INSERT INTO [VideoFolder] ([VideoFolder], [ParentId]) VALUES (?, ?)" SelectCommand="SELECT [Id], [VideoFolder], [ParentId] FROM [VideoFolder]" UpdateCommand="UPDATE [VideoFolder] SET [VideoFolder] = ?, [ParentId] = ? WHERE [Id] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="VideoFolder" Type="String" />
                        <asp:Parameter Name="ParentId" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="VideoFolder" Type="String" />
                        <asp:Parameter Name="ParentId" Type="Int32" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                 <asp:AccessDataSource ID="dsData" runat="server" DataFile="~/App_Data/GallaryData.mdb" DeleteCommand="DELETE FROM [VideoLinks] WHERE [Id] = ?" InsertCommand="INSERT INTO [VideoLinks] ([Id], [VideoLinks], [VideoFolder], [VideoName]) VALUES (?, ?, ?, ?)" SelectCommand="SELECT [Id], [VideoLinks], [VideoFolder], [VideoName] FROM [VideoLinks]" UpdateCommand="UPDATE [VideoLinks] SET [VideoLinks] = ?, [VideoFolder] = ?, [VideoName] = ? WHERE [Id] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="VideoLinks" Type="String" />
                        <asp:Parameter Name="VideoFolder" Type="Int32" />
                        <asp:Parameter Name="VideoName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="VideoLinks" Type="String" />
                        <asp:Parameter Name="VideoFolder" Type="Int32" />
                        <asp:Parameter Name="VideoName" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>

        </tr>
    </table>
</asp:Content>

