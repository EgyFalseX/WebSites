<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MagazinesAdminUC.ascx.cs" Inherits="MagazinesAdminUC" %>


<style type="text/css">

    .style1
    {
        width: 100px;
    }
    .style2
    {
        height: 30px;
    }
</style>
<table align="center" class="style1" dir="ltr">
        <tr>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
                <telerik:RadGrid ID="RadGridEditor" runat="server" DataSourceID="SqlDataSourceCodez" 
                    GridLines="None" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Hay" Width="800px" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated" CellSpacing="0">
<SortingSettings ></SortingSettings>

<ValidationSettings CommandsToValidate="Insert,Update"></ValidationSettings>

<CommandItemStyle Font-Bold="False" ForeColor="Black"></CommandItemStyle>

        <MasterTableView datakeynames="addno" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                         Font-Size="16px" Font-Names="Arial" 
                        Font-Bold="True">
<CommandItemSettings ></CommandItemSettings>

<GroupHeaderItemStyle ForeColor="Black"></GroupHeaderItemStyle>

<CommandItemStyle Font-Bold="False"></CommandItemStyle>

        <RowIndicatorColumn Visible="False">
        </RowIndicatorColumn>
        <ExpandCollapseColumn Visible="False" Resizable="False" ButtonType="ImageButton">
        </ExpandCollapseColumn>

            <Columns>
                <telerik:GridBoundColumn DataField="addd" 
                    HeaderText="Issue Title" SortExpression="addd" 
                    UniqueName="addd" FilterControlAltText="Filter addd column">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn DataField="Timeline" DataType="System.DateTime" 
                    FilterControlAltText="Filter Timeline column" HeaderText="Time line" 
                    SortExpression="Timeline" UniqueName="Timeline">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDateTimeColumn>
                <telerik:GridBoundColumn DataField="addmang" 
                    FilterControlAltText="Filter addmang column" HeaderText="Author" 
                    SortExpression="addmang" UniqueName="addmang">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="id_starting" 
                    DataSourceID="SqlDataSourceid_starting" DataType="System.Byte" 
                    FilterControlAltText="Filter id_starting column" HeaderText="Visible" 
                    ListTextField="name_starting" ListValueField="id_starting" 
                    SortExpression="id_starting" UniqueName="id_starting">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" Text="Edit" HeaderText="Edit" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="Are You Sure ?" ConfirmDialogType="RadWindow"
                ConfirmTitle="Confirmation" ButtonType="ImageButton" CommandName="Delete" 
                    Text="Delete" HeaderText="Delete" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
            </Columns>

        <EditFormSettings>

<FormStyle ForeColor="Black"></FormStyle>

<FormTableStyle ForeColor="Black"></FormTableStyle>

<FormMainTableStyle ForeColor="Black"></FormMainTableStyle>

<FormTableAlternatingItemStyle ForeColor="Black"></FormTableAlternatingItemStyle>

<FormTableButtonRowStyle ForeColor="Black"></FormTableButtonRowStyle>

            <EditColumn ButtonType="ImageButton">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
            </EditColumn>

<FormTableItemStyle ForeColor="Black" Font-Size="18px"></FormTableItemStyle>

        </EditFormSettings>
            <ItemStyle ForeColor="Black" />

            <EditItemStyle ForeColor="Black" />
            <PagerStyle />
            <HeaderStyle ForeColor="Black" />

        </MasterTableView>
                    <EditItemStyle Font-Bold="True" ForeColor="Black" />

                    <ItemStyle ForeColor="Black" />

<FilterMenu EnableImageSprites="False"></FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Hay"></HeaderContextMenu>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\magazine.mdb;Persist Security Info=True" 
                    DeleteCommand="DELETE FROM [addno] WHERE [addno] = ?" 
                    InsertCommand="INSERT INTO [addno] ([addd], [Timeline], [addmang], [id_starting]) VALUES (?, ?, ?, ?)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.OleDb" 
                    SelectCommand="SELECT [addno], [addd], [Timeline], [addmang], [id_starting] FROM [addno]" 
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [addno] SET [addd] = ?, [Timeline] = ?, [addmang] = ?, [id_starting] = ? WHERE [addno] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="original_addno" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="addd" Type="String" />
                        <asp:Parameter Name="Timeline" Type="DateTime" />
                        <asp:Parameter Name="addmang" Type="String" />
                        <asp:Parameter Name="id_starting" Type="Byte" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="addd" Type="String" />
                        <asp:Parameter Name="Timeline" Type="DateTime" />
                        <asp:Parameter Name="addmang" Type="String" />
                        <asp:Parameter Name="id_starting" Type="Byte" />
                        <asp:Parameter Name="original_addno" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceid_starting" runat="server" 
                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\magazine.mdb;Persist Security Info=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.OleDb" 
                    SelectCommand="SELECT [id_starting], [name_starting] FROM [td_starting]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>

