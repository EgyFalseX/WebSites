<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CDAlhasas_time.ascx.cs" Inherits="CDAlhasas_time" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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
<table align="center" class="style1" dir="rtl">
        <tr>
            <td class="style2">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
                <telerik:RadGrid ID="RadGridEditor" runat="server" DataSourceID="SqlDataSourceCodez" 
                    GridLines="None" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Hay" Width="600px" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

<ValidationSettings CommandsToValidate="Insert,Update"></ValidationSettings>

        <MasterTableView datakeynames="daycode,hasa_code" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Size="16px" Font-Names="Arial" 
                        Font-Bold="True">
<CommandItemSettings AddNewRecordText="اضافه" RefreshText="تجديد البيانات"></CommandItemSettings>

<GroupHeaderItemStyle ForeColor="Black"></GroupHeaderItemStyle>

<CommandItemStyle Font-Bold="False"></CommandItemStyle>
         <CommandItemSettings AddNewRecordText="اضافه" 
                RefreshText="تجديد البيانات" />

        <RowIndicatorColumn Visible="False">
        <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>
        <ExpandCollapseColumn Visible="False" Resizable="False" ButtonType="ImageButton">
        <HeaderStyle Width="20px" ForeColor="Black"></HeaderStyle>
            <ItemStyle ForeColor="Black" />
        </ExpandCollapseColumn>

            <Columns>
                <telerik:GridDropDownColumn DataField="daycode" 
                    DataSourceID="SqlDataSourceCDDayname" DropDownControlType="DropDownList" 
                    HeaderText="اليوم" ListTextField="dayname" ListValueField="daycode" 
                    SortExpression="daycode" UniqueName="daycode">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="hasa_code" 
                    DropDownControlType="DropDownList" HeaderText="اسم الحصه" 
                    ListValueField="hasa_code" SortExpression="hasa_code" 
                    UniqueName="hasa_code" DataSourceID="SqlDataSourceHesas" 
                    ListTextField="hasa_name">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridTemplateColumn DataField="tiem_be" DataType="System.DateTime" 
                    HeaderText="وقت البدايه" SortExpression="tiem_be" UniqueName="tiem_be">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtStart" runat="server" Text='<%# Bind("tiem_be") %>' 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtStart_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtStart">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="tiem_beLabel" runat="server" Text='<%# Eval("tiem_be") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="tiem_en" DataType="System.DateTime" 
                    HeaderText="وقت النهايه" SortExpression="tiem_en" UniqueName="tiem_en">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtEnd" runat="server" Text='<%# Bind("tiem_en") %>' 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtEnd_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtEnd">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="tiem_enLabel" runat="server" Text='<%# Eval("tiem_en") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" Text="تعديل" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" 
                    Text="حذف" />
            </Columns>

        <EditFormSettings>
            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertImageUrl="~/Images/AddTGrid.png" InsertText="اضافه" UpdateText="حفظ التعديل">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
            </EditColumn>
            <FormStyle ForeColor="Black" />
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" HorizontalAlign="Center" />
            <FormTableAlternatingItemStyle ForeColor="Black" Font-Bold="True" 
                Font-Size="16px" />
            <FormTableButtonRowStyle ForeColor="Black" />

<FormStyle ForeColor="Black"></FormStyle>

<FormTableStyle ForeColor="Black"></FormTableStyle>

<FormMainTableStyle ForeColor="Black"></FormMainTableStyle>

<FormTableItemStyle ForeColor="Black" Font-Size="18px"></FormTableItemStyle>

<FormTableAlternatingItemStyle ForeColor="Black"></FormTableAlternatingItemStyle>

<FormTableButtonRowStyle ForeColor="Black"></FormTableButtonRowStyle>

        <PopUpSettings ScrollBars="None"></PopUpSettings>
            
        </EditFormSettings>
            <ItemStyle ForeColor="Black" />
            <GroupHeaderItemStyle ForeColor="Black" />

            <EditItemStyle ForeColor="Black" />
            <PagerStyle NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" />
            <HeaderStyle ForeColor="Black" />
            <CommandItemStyle Font-Bold="False" />

        </MasterTableView>
                    <EditItemStyle Font-Bold="True" ForeColor="Black" />
                    <CommandItemStyle Font-Bold="False" ForeColor="Black" />

<CommandItemStyle Font-Bold="False" ForeColor="Black"></CommandItemStyle>

                    <ItemStyle ForeColor="Black" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />

<StatusBarSettings ReadyText="جاهز" LoadingText="تحميل....."></StatusBarSettings>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [CDAlhasas_time] WHERE [daycode] = @original_daycode AND [hasa_code] = @original_hasa_code" 
                    InsertCommand="INSERT INTO [CDAlhasas_time] ([daycode], [hasa_code], [tiem_be], [tiem_en]) VALUES
                                   (@daycode, @hasa_code, Convert(datetime, @tiem_be, 103), Convert(datetime, @tiem_en, 103))" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [daycode], [hasa_code], Convert(nvarchar, tiem_be, 103) AS tiem_be, Convert(nvarchar, tiem_en, 103) AS tiem_en,
                                   (Select hasa_name From CDAlhasas Where hasa_code = CDAlhasas_time.hasa_code) AS hasa_name 
                                   FROM [CDAlhasas_time]" 
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [CDAlhasas_time] SET [tiem_be] = Convert(datetime, @tiem_be, 103), [tiem_en] = Convert(datetime, @tiem_en, 103), hasa_code = @hasa_code,
daycode = @daycode WHERE [daycode] = @original_daycode And hasa_code = @original_hasa_code">
                    <DeleteParameters>
                        <asp:Parameter Name="original_daycode" Type="Int32" />
                        <asp:Parameter Name="original_hasa_code" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="hasa_code" Type="Int32" />
                        <asp:Parameter Name="daycode" />
                        <asp:Parameter Name="tiem_be" Type="String" />
                        <asp:Parameter Name="tiem_en" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tiem_be" Type="String" />
                        <asp:Parameter Name="tiem_en" Type="String" />
                        <asp:Parameter Name="hasa_code" Type="Int32" />
                        <asp:Parameter Name="original_daycode" Type="Int32" />
                        <asp:Parameter Name="original_hasa_code" />
                        <asp:Parameter Name="daycode" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceHesas" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [CDAlhasas] WHERE [hasa_code] = @original_hasa_code" 
                    InsertCommand="INSERT INTO [CDAlhasas] ([hasa_code], [hasa_name], [hasa_name_e]) Select (Select ISNULL(MAX(hasa_code) + 1, 1) From CDAlhasas), @hasa_name, @hasa_name_e" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [hasa_code], [hasa_name], [hasa_name_e] FROM [CDAlhasas]" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [CDAlhasas] SET [hasa_name] = @hasa_name, [hasa_name_e] = @hasa_name_e WHERE [hasa_code] = @original_hasa_code">
                    <DeleteParameters>
                        <asp:Parameter Name="original_hasa_code" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="hasa_name" Type="String" />
                        <asp:Parameter Name="hasa_name_e" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="hasa_name" Type="String" />
                        <asp:Parameter Name="hasa_name_e" Type="String" />
                        <asp:Parameter Name="original_hasa_code" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCDDayname" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [daycode], [dayname], [dayname_e] FROM [CDDayname]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>

