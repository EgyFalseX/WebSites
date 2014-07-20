<%@ Page Title="" Language="C#" validateRequest="false" MasterPageFile="~/Master.master" AutoEventWireup="true"
    CodeFile="TreeEditor.aspx.cs" Inherits="TreeEditor" %>

    
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .style11
        {
            width: 847px;
        }
        .style1
        {
            width: 700px;
        }
    </style><script type="text/javascript" src="ckeditor/ckeditor.js"></script><div>
        <table class="style11">
            <tr>
                <td align="left" valign="top">
                <dx:ASPxTreeList ID="treeList" runat="server" AutoGenerateColumns="False" DataSourceID="DSData"
                    KeyFieldName="ID" ParentFieldName="ParentID" CssFilePath="App_Themes/PlasticBlue/{0}/styles.css"
                    CssPostfix="PlasticBlue" EnableCallbacks="False" 
                        onfocusednodechanged="treeList_FocusedNodeChanged">
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
                <asp:AccessDataSource ID="DSData" runat="server" DataFile="App_Data/Data.mdb" DeleteCommand="DELETE FROM [TreeData] WHERE [ID] = ?"
                    InsertCommand="INSERT INTO [TreeData] ( [ItemName], [ParentID]) VALUES ( ?, ?)"
                    SelectCommand="SELECT [ID], [ItemName], [ParentID], [Contains] FROM [TreeData]"
                    
                    
                    
                    
                    
                    
                        UpdateCommand="UPDATE [TreeData] SET [ItemName] = ?, [ParentID] = ? WHERE [ID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ParentID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ItemName" Type="String" />
                        <asp:Parameter Name="ParentID" Type="Int32" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                </td>
                <td dir="ltr" style="text-align: left" class="style1">
                    <textarea name="editor1" cols="20" rows="1">&lt;p&gt;<%=LoadPage() %>&lt;/p&gt;</textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('editor1');
                    </script>
                    <br />
                    <asp:Button ID="BtnSave" runat="server" OnClick="BtnSave_Click" Text="Save Details"
                        Width="103px" />
                    <br />
                    <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                <asp:AccessDataSource ID="DSDataContains" runat="server" 
                        DataFile="App_Data/Data.mdb" DeleteCommand="DELETE FROM [TreeData] WHERE [ID] = ?"
                    InsertCommand="INSERT INTO [TreeData] ([ID], [Contains]) VALUES (?, ?)"
                    SelectCommand="SELECT [ID], [Contains] FROM [TreeData] WHERE ([ID] = ?)"
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TreeData] SET [Contains] = ? WHERE [ID] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="Int32" />
                        <asp:Parameter Name="Contains" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="ID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Contains" Type="String" />
                        <asp:Parameter Name="ID" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
