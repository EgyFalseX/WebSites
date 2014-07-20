<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="UserSelection.aspx.cs" Inherits="UserSelection" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 316px;
        }
        .style2
        {
            direction: ltr;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
        <tr>
            <td class="style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Grade">
                </dx:ASPxLabel>
            </td>
            <td class="style2" valign="top">
                <dx:ASPxComboBox ID="cbalsofof" runat="server" AutoPostBack="True" 
                    DataSourceID="dsalsofof" TextField="alsofof_name_e" ValueField="alsofof_code">
                    <Columns>
                        <dx:ListBoxColumn FieldName="alsofof_name_e" Caption="Grade" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsalsofof" runat="server" 
                    DataFile="App_Data/home_work.mdb" 
                    SelectCommand="SELECT [alsofof_code], [alsofof_name_e] FROM [alsofof]">
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Class">
                </dx:ASPxLabel>
            </td>
            <td class="style2" valign="top">
                <dx:ASPxComboBox ID="cbfasl" runat="server" AutoPostBack="True" 
                    DataSourceID="dsfasl" TextField="fasl_name_e" ValueField="fasl_code">
                    <Columns>
                        <dx:ListBoxColumn FieldName="fasl_name_e" Caption="Class" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsfasl" runat="server" 
                    DataFile="App_Data/home_work.mdb" 
                    SelectCommand="SELECT [fasl_code], [fasl_name_e] FROM [fasl]">
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Date">
                </dx:ASPxLabel>
            </td>
            <td class="style2" valign="top">
                <dx:ASPxComboBox ID="cbadd_date" runat="server" AutoPostBack="True" 
                    DataSourceID="dsData" onselectedindexchanged="cbadd_date_SelectedIndexChanged" 
                    TextField="add_date" ValueField="id">
                    <Columns>
                        <dx:ListBoxColumn FieldName="add_date" Caption="Date" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsData" runat="server" 
                    DataFile="App_Data/home_work.mdb" 
                    
                    
                    SelectCommand="SELECT [id], Format([add_date],&quot;YYYY/MM/DD&quot;) AS [add_date] FROM [home_work] WHERE (([alsofof_code] = ?) AND ([fasl_code] = ?))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbalsofof" DefaultValue="0" 
                            Name="alsofof_code" PropertyName="Value" Type="Byte" />
                        <asp:ControlParameter ControlID="cbfasl" DefaultValue="0" Name="fasl_code" 
                            PropertyName="Value" Type="Byte" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                &nbsp;</td>
            <td class="style2" valign="top">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

