<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ViewHomework.aspx.cs" Inherits="ViewHomework" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="App_Data/home_work.mdb"
                DeleteCommand="DELETE FROM [home_work] WHERE [id] = ?" InsertCommand="INSERT INTO [home_work] ([id], [alsofof_code], [fasl_code], [add_date],  [Data_Path]) VALUES (?, ?, ?, ?,  ?)"
                SelectCommand="SELECT home_work.id, home_work.add_date, fasl.fasl_name, alsofof.alsofof_name, home_work.Data_Path, home_work.read_code FROM ((home_work INNER JOIN fasl ON home_work.fasl_code = fasl.fasl_code) INNER JOIN alsofof ON home_work.alsofof_code = alsofof.alsofof_code) WHERE (home_work.alsofof_code = ?) AND (home_work.fasl_code = ?)"
                
                UpdateCommand="UPDATE [home_work] SET [alsofof_code] = ?, [fasl_code] = ?, [add_date] = ?, [read_code] = ?, [Data_Path] = ? WHERE [id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="alsofof_code" Type="Byte" />
                    <asp:Parameter Name="fasl_code" Type="Byte" />
                    <asp:Parameter Name="add_date" Type="DateTime" />
                    <asp:Parameter Name="read_code" Type="Byte" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="alsofof_code" SessionField="UserSaf" />
                    <asp:SessionParameter DefaultValue="0" Name="fasl_code" SessionField="UserFasl" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="alsofof_code" Type="Byte" />
                    <asp:Parameter Name="fasl_code" Type="Byte" />
                    <asp:Parameter Name="add_date" Type="DateTime" />
                    <asp:Parameter Name="read_code" Type="Byte" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DSData" EnableTheming="True" Theme="PlasticBlue" Font-Size="12pt">
        <Columns>
            <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="add_date" SortIndex="0" SortOrder="Descending" VisibleIndex="1">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="الصف" FieldName="fasl_name" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="الفصل" FieldName="alsofof_name" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="الرابط" FieldName="id" VisibleIndex="5">
                <PropertiesHyperLinkEdit NavigateUrlFormatString="ViewDetails.aspx?id={0}" TextFormatString="عرض">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataCheckColumn Caption="قرأ " FieldName="read_code" VisibleIndex="0">
            </dx:GridViewDataCheckColumn>
        </Columns>
    </dx:ASPxGridView>
            </td>
        </tr>
    </table>
            </asp:Content>

