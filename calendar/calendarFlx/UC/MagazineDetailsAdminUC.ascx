<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MagazineDetailsAdminUC.ascx.cs" Inherits="MagazineDetailsAdminUC" %>


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

        <MasterTableView datakeynames="contid" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridDropDownColumn DataField="addno" DataSourceID="SqlDataSourceaddno" 
                    DataType="System.Int32" FilterControlAltText="Filter addno column" 
                    HeaderText="Issue" ListTextField="addd" ListValueField="addno" 
                    SortExpression="addno" UniqueName="addno">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="subject" 
                    FilterControlAltText="Filter subject column" HeaderText="Subject" 
                    SortExpression="subject" UniqueName="subject">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="subwrit" 
                    FilterControlAltText="Filter subwrit column" HeaderText="Writer" 
                    SortExpression="subwrit" UniqueName="subwrit">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="subjectdet" 
                    FilterControlAltText="Filter subjectdet column" HeaderText="Details" 
                    SortExpression="subjectdet" UniqueName="subjectdet">
                    <EditItemTemplate>
                        <asp:TextBox ID="subjectdetTextBox" runat="server" Height="200px" 
                            Text='<%# Bind("subjectdet") %>' TextMode="MultiLine" Width="400px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="subjectdetLabel" runat="server" Text='<%# Eval("subjectdet") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                </telerik:GridTemplateColumn>
                <telerik:GridImageColumn DataImageUrlFields="subimage" 
                    FilterControlAltText="Filter subimage column" HeaderImageUrl="subimage" 
                    ImageHeight="40px" ImageWidth="40px" UniqueName="subimage">
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                </telerik:GridImageColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" Text="Edit" HeaderText="Edit" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                </telerik:GridButtonColumn>
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="Are You Sure ?" ConfirmDialogType="RadWindow"
                ConfirmTitle="Confirmation" ButtonType="ImageButton" CommandName="Delete" 
                    Text="Delete" HeaderText="Delete" >
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
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
                    DeleteCommand="DELETE FROM [addcont] WHERE [contid] = ?" 
                    InsertCommand="INSERT INTO [addcont] ([addno], [subject], [subwrit], [subjectdet], [subimage]) VALUES (?, ?, ?, ?, NULL)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.OleDb" 
                    SelectCommand="SELECT [contid], [addno], [subject], [subwrit], [subjectdet], [subimage] FROM [addcont]" 
                    
                    UpdateCommand="UPDATE [addcont] SET [addno] = ?, [subject] = ?, [subwrit] = ?, [subjectdet] = ? WHERE [contid] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="original_contid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="addno" Type="Int32" />
                        <asp:Parameter Name="subject" Type="String" />
                        <asp:Parameter Name="subwrit" Type="String" />
                        <asp:Parameter Name="subjectdet" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="addno" Type="Int32" />
                        <asp:Parameter Name="subject" Type="String" />
                        <asp:Parameter Name="subwrit" Type="String" />
                        <asp:Parameter Name="subjectdet" Type="String" />
                        <asp:Parameter Name="original_contid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceaddno" runat="server" 
                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\magazine.mdb;Persist Security Info=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.OleDb" 
                    SelectCommand="SELECT [addno], [addd] FROM [addno]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                <telerik:RadComboBox ID="RCBaddcont" Runat="server" 
                    DataSourceID="SqlDataSourceCodez" DataTextField="subject" 
                    DataValueField="contid" 
                    onselectedindexchanged="RCBaddcont_SelectedIndexChanged" Skin="Forest" 
                    Width="300px" AutoPostBack="True">
                </telerik:RadComboBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                <asp:FileUpload ID="FUImage" runat="server"  />
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                <telerik:RadButton ID="RBtnUpdate" runat="server" onclick="RBtnUpdate_Click" 
                    Skin="Forest" Text="Upload" Width="100px">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>

