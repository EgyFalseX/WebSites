<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="hafzaDelete.aspx.cs" Inherits="hafzaDelete" %>

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
            text-align: center;
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
    <table align="center" class="style1">
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="12pt" 
                    Text="سوف يتم خذف جميع الحوافظ اضغط حذف لبداء الحذف" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <dx:ASPxButton ID="btnDelete" runat="server" Font-Size="10pt" 
                    onclick="btnDelete_Click" Text="حذف" Width="120px">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: right">
                <dx:ASPxLabel ID="lblState" runat="server" Font-Names="10">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style2">
                    <asp:AccessDataSource ID="DSData" runat="server" 
                    DataFile="~/App_Data/MemberCard.mdb" 
                    SelectCommand="SELECT [hafzaid], [SyndicateId], [MemberId], [hafzadate] FROM [hafza]" 
                    DeleteCommand="DELETE FROM [hafza]" 
                    InsertCommand="INSERT INTO [hafza] ([hafzaid], [SyndicateId], [MemberId], [hafzadate]) VALUES (?, ?, ?, ?)" 
                    UpdateCommand="UPDATE [hafza] SET [SyndicateId] = ? WHERE [hafzaid] = ? AND (([MemberId] = ?) OR ([MemberId] IS NULL AND ? IS NULL)) AND (([hafzadate] = ?) OR ([hafzadate] IS NULL AND ? IS NULL))">
                        <InsertParameters>
                            <asp:Parameter Name="hafzaid" Type="Int32" />
                            <asp:Parameter Name="SyndicateId" Type="Int16" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter Name="hafzadate" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SyndicateId" Type="Int16" />
                            <asp:Parameter Name="hafzaid" Type="Int32" />
                            <asp:Parameter Name="MemberId" Type="Int32" />
                            <asp:Parameter Name="hafzadate" Type="DateTime" />
                        </UpdateParameters>
                    </asp:AccessDataSource>
                </td>
        </tr>
    </table>
</asp:Content>

