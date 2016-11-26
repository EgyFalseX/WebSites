<%@ Page Title="" Language="C#" MasterPageFile="~/stgate/masterst.master" AutoEventWireup="true" CodeFile="medterm13.aspx.cs" Inherits="medterm13" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        .auto-style2 {
            width: 242px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td class="auto-style2">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsData" EnableTheming="True" Theme="iOS">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Mid Term" FieldName="manth_code" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Arabic" FieldName="arabic" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mathematics" FieldName="math" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="English" FieldName="english" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="English Level" FieldName="englishe" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Frensh" FieldName="frensh" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Religion" FieldName="deen" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:AccessDataSource ID="dsData" runat="server" DataFile="data/2/Datanet.mdb" SelectCommand="SELECT TOP 1 20 AS [manth_code], 20 AS [arabic], 20 AS [math], 20 AS [english], 20 AS [englishe], 20 AS [frensh], 20 AS [deen] FROM [month_net]
UNION 
SELECT [manth_code], [arabic], [math], [english], [englishe], [frensh], [deen] FROM [month_net] WHERE ([stu_code] = ?) AND (perm = TRUE)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="stu_code" SessionField="UserIDst" Type="Int32" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr><td>
            &nbsp;</td></tr>
        <tr><td>
            <dx:ASPxLabel ID="lblMsg" runat="server" Font-Bold="False" Font-Size="15pt" Font-Underline="True" ForeColor="Red">
            </dx:ASPxLabel>
            </td></tr>
    </table>
    </asp:Content>

