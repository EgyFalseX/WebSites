<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="TBLMembersEditor.aspx.cs" Inherits="TBLMembersEditor" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

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

                    <dx:ASPxComboBox ID="cbSyndicateId" runat="server" DataSourceID="DSCDSyndicate" TextField="Syndicate" ValueField="SyndicateId" ValueType="System.Int32" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" AutoPostBack="True" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" EnableIncrementalFiltering="True">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسماء" FieldName="Syndicate" />
                        </Columns>
                        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanelImage>
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
                <td class="auto-style1">

                    <asp:Label ID="Label1" runat="server" Text="النقابة الفرعية"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <dx:ASPxComboBox ID="cb" runat="server" DataSourceID="DSData" TextField="MemberName" ValueField="MemberId" ValueType="System.Int32" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" EnableCallbackMode="True" EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                        <Columns>
                            <dx:ListBoxColumn Caption="الاسماء" FieldName="MemberName" />
                        </Columns>
                        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanelImage>
                        <ValidationSettings>
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
                <td class="auto-style1">

                    <asp:Label ID="Label2" runat="server" Text="الاسماء"></asp:Label>

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

                    <dx:ASPxButton ID="btnEdit" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" OnClick="btnEdit_Click" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="تعديل">
                    </dx:ASPxButton>

                </td>
                <td class="auto-style1">

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:AccessDataSource ID="DSCDSyndicate" runat="server" DataFile="~/App_Data/ETST.mdb"
                        SelectCommand="SELECT [SyndicateId], [Syndicate]
 FROM [CDSyndicate]
WHERE EXISTS
(SELECT * FROM TBLMembers WHERE MemberSyndicateId = CDSyndicate.SyndicateId and userin = ?)" OnSelecting="DSCDSyndicate_Selecting">
                        <SelectParameters>
                            <asp:SessionParameter Name="?" SessionField="UserID" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/ETST.mdb"
                        SelectCommand="SELECT [MemberId], [MemberName] FROM [TBLMembers] WHERE ([MemberSyndicateId] = ?)
order by MemberName" OnSelecting="DSData_Selecting">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cbSyndicateId" DefaultValue="0" Name="SyndicateId" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>

