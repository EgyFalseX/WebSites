﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true"
    CodeFile="TreeEditor.aspx.cs" Inherits="TreeEditor" %>

<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
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
                    KeyFieldName="ID" ParentFieldName="ParentID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                    CssPostfix="PlasticBlue" EnableCallbacks="False" KeyboardSupport="True">
                    <Columns>
                        <dx:TreeListCommandColumn ButtonType="Image" Caption="Commands" 
                            VisibleIndex="0" ShowNewButtonInHeader="True">
                            <EditButton Visible="True">
                                <Image Url="images/edit.png" Width="26px">
                                </Image>
                            </EditButton>
                            <NewButton Visible="True">
                                <Image Url="images/insert.png" Width="26px">
                                </Image>
                            </NewButton>
                            <DeleteButton Visible="True" Text="حذف">
                                <Image Url="images/delete.png" Width="26px">
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
                        </dx:TreeListCommandColumn>
                        <dx:TreeListDataColumn FieldName="ItemName" VisibleIndex="1" >
                            <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                        </dx:TreeListDataColumn>
                        <dx:TreeListTextColumn Caption="Details" VisibleIndex="2" FieldName="Contains" 
                            Visible="False">
                            <EditFormSettings CaptionLocation="Top" ColumnSpan="2" Visible="True" />
                            <EditCellTemplate>

                                <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1"  runat="server" 
                                    Html="<%# Bind('Contains') %>" 
                                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                    Width="745px">
                                    <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                                        CssPostfix="PlasticBlue">
                                        <ViewArea>
                                            <Border BorderColor="#CCCCCC" />
                                        </ViewArea>
                                    </Styles>
                                    <SettingsImageUpload>
                                        <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" MultiSelectionErrorText="Attention! 

The following {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}">
                                        </ValidationSettings>
                                    </SettingsImageUpload>
                                    <SettingsImageSelector>
                                        <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" />
                                    </SettingsImageSelector>
                                    <SettingsDocumentSelector>
                                        <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp" />
                                    </SettingsDocumentSelector>
                                    <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                                        <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                                        </LoadingPanel>
                                    </Images>
                                    <ImagesFileManager>
                                        <FolderContainerNodeLoadingPanel Url="~/App_Themes/PlasticBlue/Web/tvNodeLoading.gif">
                                        </FolderContainerNodeLoadingPanel>
                                        <LoadingPanel Url="~/App_Themes/PlasticBlue/Web/Loading.gif">
                                        </LoadingPanel>
                                    </ImagesFileManager>
                                </dx:ASPxHtmlEditor>
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
                    <SettingsEditing Mode="PopupEditForm" AllowRecursiveDelete="True" />
                    <SettingsPopupEditForm AllowResize="True" HorizontalAlign="WindowCenter" 
                        Modal="True" />
                    <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                        <CustomizationWindowContent VerticalAlign="Top">
                        </CustomizationWindowContent>
                    </Styles>
                </dx:ASPxTreeList>
                <asp:AccessDataSource ID="DSData" runat="server" DataFile="App_Data/Data.mdb" DeleteCommand="DELETE FROM [TreeData] WHERE [ID] = ?"
                    InsertCommand="INSERT INTO [TreeData] ( [ItemName], [ParentID], [Contains]) VALUES ( ?, ?, ?)"
                    SelectCommand="SELECT [ID], [ItemName], [ParentID], [Contains] FROM [TreeData]"
                    
                    
                    
                    
                    
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
                &nbsp;</td>
        </tr>
    </table>
    
</asp:Content>
