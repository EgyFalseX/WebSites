<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorBillSerial.ascx.cs" Inherits="EditorBillSerial" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 300px;
    }
    .style2
    {
    }
    .style3
    {
        width: 295px;
        text-align: center;
    }
</style>
<div dir="rtl">
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" 
                    Font-Size="14px" ForeColor="Black" Text="الفواتير"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLBill" runat="server" AutoPostBack="True" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" 
                    Font-Size="14px" ForeColor="Black" Text="السريال"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtSerial" runat="server"></asp:TextBox>
                            <asp:ImageButton ID="BtnAddSerial" runat="server" Height="32px" 
                                ImageUrl="~/Images/Add.png" onclick="BtnAddSerial_Click" 
                    Width="32px" />
                            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Italic="False" 
                    Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>
    <p>
    </p>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td class="style3">
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
                <telerik:RadGrid ID="RadGridEditor" runat="server" DataSourceID="SqlDataSourceCodez" 
                    GridLines="None" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" Width="600px" 
                    onitemdeleted="RadGridEditor_ItemDeleted">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

<ValidationSettings CommandsToValidate="Insert,Update"></ValidationSettings>

        <MasterTableView datakeynames="InnerSerial" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Size="14px" Font-Names="Arial" 
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
                <telerik:GridBoundColumn DataField="Material" 
                    HeaderText="الاسم" SortExpression="Material" 
                    UniqueName="Material">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="InvIDOut" DataType="System.Int32" 
                    HeaderText="رقم الفاتوره" SortExpression="InvIDOut" UniqueName="InvIDOut">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="InnerSerial" HeaderText="سريال" 
                    ReadOnly="True" SortExpression="InnerSerial" UniqueName="InnerSerial">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" />
            </Columns>

        <EditFormSettings>
            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertText="اضافه" UpdateText="حفظ التعديل">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
            </EditColumn>
            <FormStyle ForeColor="Black" />
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" />
            <FormTableAlternatingItemStyle ForeColor="Black" />
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
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [TblSerOut] WHERE [InnerSerial] = @original_InnerSerial AND [InvIDOut] = @original_InvIDOut" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    
                    SelectCommand="SELECT InnerSerial, InvIDOut, (SELECT Material FROM TblMaterialDetiels WHERE (MaterialId = (SELECT MaterialId FROM TblWaredSerial WHERE (InnerSerial = TblSerOut.InnerSerial)))) AS Material FROM TblSerOut WHERE (InvIDOut = @InvIDOut)" 
                    ConflictDetection="CompareAllValues">
                    <DeleteParameters>
                        <asp:Parameter Name="original_InnerSerial" Type="String" />
                        <asp:Parameter Name="original_InvIDOut" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DDLBill" Name="InvIDOut" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
</div>