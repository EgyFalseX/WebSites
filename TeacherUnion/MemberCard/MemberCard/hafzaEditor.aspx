<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="hafzaEditor.aspx.cs" Inherits="hafzaEditor" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 362px;
        }
        .style2
        {
            direction: rtl;
            text-align: right;
        }
        .style3
        {
            direction: rtl;
            text-align: left;
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    ;7<table align="center" class="style1">
        <tr>
            <td class="style2">
                <dx:ASPxDateEdit ID="deDate" runat="server" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Font-Size="12pt" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                    Width="200px">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td style="direction: rtl">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="12pt" 
                    Text="تاريخ الحافظة">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="lblMemberCount" runat="server" Font-Names="10" Text="0">
                </dx:ASPxLabel>
            </td>
            <td style="direction: rtl">
                <dx:ASPxLabel ID="lblState0" runat="server" Font-Names="10" Text="عدد الاعضاء">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <dx:ASPxButton ID="btnCreate" runat="server" Font-Size="10pt" 
                    onclick="btnCreate_Click" Text="اعداد الحافظة" Width="120px">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right">
                <dx:ASPxLabel ID="lblState" runat="server" Font-Names="10">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                    <asp:AccessDataSource ID="DSMembers" runat="server" 
                    DataFile="~/App_Data/MemberCard.mdb" 
                    
                        SelectCommand="SELECT [MemberId] FROM [TBLAllMember] WHERE (([userin] = ?) AND ([closed] = false))">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="userin" 
                                SessionField="MemberCardUserID" />
                        </SelectParameters>
                    </asp:AccessDataSource>
                    <asp:AccessDataSource ID="DSData" runat="server" 
                    DataFile="~/App_Data/MemberCard.mdb" 
                    SelectCommand="SELECT [hafzaid], [SyndicateId], [MemberId], [hafzadate] FROM [hafza]" 
                    DeleteCommand="DELETE FROM [hafza] WHERE [hafzaid] = ?" 
                    InsertCommand="INSERT INTO [hafza] ([SyndicateId], [MemberId], [hafzadate], [userid]) VALUES (?, ?, ?, ?)" 
                    
                        UpdateCommand="UPDATE [hafza] SET [SyndicateId] = ?, [MemberId] = ?, [hafzadate] = ? WHERE [hafzaid] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="hafzaid" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SyndicateId" Type="Int16" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter Name="hafzadate" Type="String" />
                            <asp:SessionParameter DefaultValue="0" Name="userid" SessionField="MemberCardUserID" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SyndicateId" Type="Int16" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter Name="hafzadate" Type="String" />
                            <asp:Parameter Name="hafzaid" Type="Int32" />
                        </UpdateParameters>
                    </asp:AccessDataSource>
                </td>
        </tr>
    </table>
</asp:Content>

