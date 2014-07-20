<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true"
    CodeFile="TreeViewer.aspx.cs" Inherits="TreeViewer" %>

<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td align="left" valign="top">
                <dx:ASPxTreeList ID="treeList" runat="server" AutoGenerateColumns="False" DataSourceID="DSData"
                    KeyFieldName="ID" ParentFieldName="ParentID" CssFilePath="App_Themes/PlasticBlue/{0}/styles.css"
                    CssPostfix="PlasticBlue" EnableCallbacks="False">
                    <Columns>
                        <dx:TreeListDataColumn FieldName="ItemName" VisibleIndex="0" >
                            <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                        </dx:TreeListDataColumn>
                        <dx:TreeListTextColumn Caption="Details" VisibleIndex="2" FieldName="Contains" 
                            Visible="False">
                            <EditFormSettings CaptionLocation="Top" ColumnSpan="2" Visible="True" />
                            <EditCellTemplate>
                            <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Language="ar" 
                                     Width="" Text='<%# Bind("Contains") %>'></CKEditor:CKEditorControl>
                            </EditCellTemplate>
                        </dx:TreeListTextColumn>
                        <dx:TreeListDataColumn FieldName="ID" VisibleIndex="5" Visible="False">
                            <EditFormSettings Visible="False" />
                            <CellStyle BackColor="#FFEBB1">
                            </CellStyle>
                        </dx:TreeListDataColumn>
                        <dx:TreeListDataColumn FieldName="ParentID" VisibleIndex="6" Visible="False">
                            <EditFormSettings Visible="False" />
                            <CellStyle BackColor="#FFEBB1">
                            </CellStyle>
                        </dx:TreeListDataColumn>
                    </Columns>
                    <Settings GridLines="Both" />
                    <SettingsBehavior ExpandCollapseAction="NodeDblClick" AllowFocusedNode="True" 
                        ProcessFocusedNodeChangedOnServer="True" 
                        ProcessSelectionChangedOnServer="True" />
                    <SettingsPager ShowDefaultImages="False">
                        <AllButton Text="All">
                        </AllButton>
                        <NextPageButton Text="Next &gt;">
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Prev">
                        </PrevPageButton>
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm" />
                    <SettingsPopupEditForm AllowResize="True" />
                    <Images SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanel Url="App_Themes/PlasticBlue/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <Styles CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                        <CustomizationWindowContent VerticalAlign="Top">
                        </CustomizationWindowContent>
                    </Styles>
                </dx:ASPxTreeList>
                <asp:AccessDataSource ID="DSData" runat="server" DataFile="App_Data/Data.mdb" DeleteCommand="DELETE FROM [TreeData] WHERE (([ID] = ?) OR ([ID] IS NULL AND ? IS NULL))"
                    InsertCommand="INSERT INTO [TreeData] ( [ItemName], [ParentID], [Contains]) VALUES ( ?, ?, ?)"
                    SelectCommand="SELECT [ID], [ItemName],  [ParentID], [Contains] FROM [TreeData]"
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TreeData] SET [ItemName] = ?, [ParentID] = ?, [Contains] = ? WHERE [ID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ParentID" Type="Int32" />
                        <asp:Parameter Name="Contains" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ParentID" Type="Int32" />
                        <asp:Parameter Name="Contains" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
            </td>
            <td valign="top">
            <%= LoadData() %>
                </td>
        </tr>
    </table>
    
</asp:Content>
