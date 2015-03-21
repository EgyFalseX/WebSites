<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="VideoViewerEditor.aspx.cs" Inherits="VideoViewerEditor" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="right" dir="rtl">
        <tr>
            <td valign="top" align="center">
                <dx:ASPxTreeList ID="ASPxTreeListData" runat="server" AutoGenerateColumns="False" DataSourceID="dsTree" KeyFieldName="Id" ParentFieldName="ParentId" Font-Bold="True">
                    <Columns>
                        <dx:TreeListCommandColumn ButtonType="Image" ShowNewButtonInHeader="True" VisibleIndex="0">
                            <EditButton Visible="True">
                                <Image Url="images/edit.png">
                                </Image>
                            </EditButton>
                            <NewButton Visible="True">
                                <Image Url="images/insert.png">
                                </Image>
                            </NewButton>
                            <DeleteButton Visible="True">
                                <Image Url="images/delete.png">
                                </Image>
                            </DeleteButton>
                            <UpdateButton>
                                <Image Url="images/accept.png">
                                </Image>
                            </UpdateButton>
                            <CancelButton>
                                <Image Url="images/delete.png">
                                </Image>
                            </CancelButton>
                        </dx:TreeListCommandColumn>
                        <dx:TreeListTextColumn Caption="مكتبة الفيديو" FieldName="VideoFolder" VisibleIndex="1">
                        </dx:TreeListTextColumn>
                    </Columns>
                    <Settings GridLines="Both" ShowRoot="False" />
                    <SettingsBehavior AllowFocusedNode="True" AutoExpandAllNodes="True" />
                    <SettingsEditing AllowNodeDragDrop="True" />
                    <SettingsPopupEditForm Caption="تحرير" Modal="True" />
                    <ClientSideEvents FocusedNodeChanged="function(s, e) {
	CallbackPanel.PerformCallback();
}" />
                </dx:ASPxTreeList>
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
            </td>
            <td align="center" valign="top" style="text-align: right">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanelData" runat="server" ClientInstanceName="CallbackPanel" OnCallback="ASPxCallbackPanelData_Callback" Width="200px">
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxGridView ID="ASPxGridViewData" runat="server" AutoGenerateColumns="False" DataSourceID="dsData" KeyFieldName="Id" Width="400px">
                                <Columns>
                                    <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <EditButton Visible="True">
                                            <Image Url="images/edit.png">
                                            </Image>
                                        </EditButton>
                                        <NewButton Visible="True">
                                            <Image Url="images/insert.png">
                                            </Image>
                                        </NewButton>
                                        <DeleteButton Visible="True">
                                            <Image Url="images/delete.png">
                                            </Image>
                                        </DeleteButton>
                                        <CancelButton>
                                            <Image Url="images/delete.png">
                                            </Image>
                                        </CancelButton>
                                        <UpdateButton>
                                            <Image Url="images/accept.png">
                                            </Image>
                                        </UpdateButton>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="اسم الفيديو" FieldName="VideoName" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="مسار الفيديو" FieldName="VideoLinks" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataMemoColumn Caption="وصف" FieldName="Desc" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <EditFormSettings ColumnSpan="2" RowSpan="3" />
                                    </dx:GridViewDataMemoColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
                <asp:AccessDataSource ID="dsData" runat="server" DataFile="~/App_Data/GallaryData.mdb" DeleteCommand="DELETE FROM [VideoLinks] WHERE [Id] = ?" InsertCommand="INSERT INTO [VideoLinks] ( [VideoLinks], [VideoFolder], [VideoName], [Desc]) VALUES (?, ?, ?, ?)" SelectCommand="SELECT Id, VideoLinks, VideoFolder, VideoName, [Desc] FROM VideoLinks" UpdateCommand="UPDATE [VideoLinks] SET [VideoLinks] = ?, [VideoName] = ?, [Desc] = ? WHERE [Id] = ?" OnInserting="dsData_Inserting" OnSelecting="dsData_Selecting">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="VideoLinks" Type="String" />
                        <asp:Parameter Name="VideoFolder" Type="Int32" />
                        <asp:Parameter Name="VideoName" Type="String" />
                        <asp:Parameter Name="Desc" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="VideoLinks" Type="String" />
                        <asp:Parameter Name="VideoName" Type="String" />
                        <asp:Parameter Name="Desc" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

