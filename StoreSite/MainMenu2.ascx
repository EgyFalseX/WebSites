<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainMenu2.ascx.cs" Inherits="MainMenu2" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<style type="text/css">
    .style1
    {
        width: 100px;
    }
</style>
<telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
</telerik:RadScriptManager>
<table align="center" class="style1">
    <tr>
        <td>

            <telerik:RadComboBox ID="RadComboBox1" Runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="GOV" DataValueField="GOVId" 
                MarkFirstMatch="True" Skin="Vista">
            </telerik:RadComboBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT [GOVId], [GOV] FROM [CdGov]"></asp:SqlDataSource>
        </td>
    </tr>
</table>


