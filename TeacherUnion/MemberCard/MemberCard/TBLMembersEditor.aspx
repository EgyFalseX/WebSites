<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="TBLMembersEditor.aspx.cs" Inherits="TBLMembersEditor" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
        .style1
        {
            width: 411px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <div>

        <table align="center" class="style1">
            <tr>
                <td class="auto-style1">

                    <dx:ASPxComboBox ID="cbSyndicateId" runat="server" DataSourceID="DSCDSyndicate" TextField="Syndicate" ValueField="SyndicateId" CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" AutoPostBack="True" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" EnableIncrementalFiltering="True" Font-Size="12pt">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسماء" FieldName="Syndicate" />
                        </Columns>
                        <LoadingPanelImage Url="App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanelImage>
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
                <td class="auto-style1">

                    <asp:Label ID="Label1" runat="server" Text="النقابة الفرعية" Font-Bold="True" Font-Size="12pt"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxComboBox ID="cb" runat="server" DataSourceID="DSData" TextField="MemberName" ValueField="MemberId" ValueType="System.Int32" CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" EnableCallbackMode="True" EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith" Font-Size="12pt">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسماء" FieldName="MemberName" />
                        </Columns>
                        <LoadingPanelImage Url="App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanelImage>
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
                <td class="auto-style1">

                    <asp:Label ID="Label2" runat="server" Text="الاسماء" Font-Bold="True" Font-Size="12pt"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    &nbsp;</td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxButton ID="btnEdit" runat="server" CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" OnClick="btnEdit_Click" SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css" Text="تعديل">
                    </dx:ASPxButton>

                </td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:AccessDataSource ID="DSCDSyndicate" runat="server" DataFile="~/App_Data/MemberCard.mdb" OnSelecting="DSCDSyndicate_Selecting" SelectCommand="SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]"></asp:AccessDataSource>
                    <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/MemberCard.mdb" OnSelecting="DSData_Selecting" SelectCommand="SELECT [MemberId], [MemberName] FROM [TBLAllMember] WHERE ([SyndicateId] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cbSyndicateId" DefaultValue="0" Name="SyndicateId" PropertyName="Value" Type="Int16" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>

