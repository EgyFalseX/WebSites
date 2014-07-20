<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorCheck.ascx.cs" Inherits="EditorCheck" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 312px;
    }
</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="عدد الشيكات"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtCount" runat="server" Width="150px">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="رقم بداية الترقيم"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtStart" runat="server" Width="150px">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="الحساب"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLAccount" runat="server" Width="150px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnCreateCheck" runat="server" Font-Bold="True" ForeColor="Red" 
                    onclick="BtnCreateCheck_Click" Text="بدء الترقيم" Width="100px" />
            </td>
        </tr>
        </table>
    <p>
    </p>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [TBLsheekno] WHERE [sheek_no] = @original_sheek_no AND [bankacountcode] = @original_bankacountcode" 
                    InsertCommand="INSERT INTO [TBLsheekno] ([sheek_no], [bankacountcode], [sheek_date], [eshkakdate], [del], [used], [mortd], [soref], [datesarf], [UserIn], [TimeIn]) VALUES (@sheek_no, @bankacountcode, Convert(Datetime, @sheek_date, 103), Convert(Datetime, @eshkakdate, 103), @del, @used, @mortd, @soref, Convert(Datetime, @datesarf, 103), @UserIn, @TimeIn)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [sheek_no], [bankacountcode], [sheek_date], [eshkakdate], [del], [used], [mortd], [soref], [datesarf], [UserIn], [TimeIn], (Select bankacountname From CDbank Where bankacountcode = TBLsheekno.bankacountcode) AS bankacountname FROM [TBLsheekno]" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TBLsheekno] SET [sheek_date] = Convert(Datetime, @sheek_date, 103), [eshkakdate] = Convert(Datetime, @eshkakdate, 103), [del] = @del, [used] = @used, [mortd] = @mortd, [soref] = @soref, [datesarf] = Convert(Datetime, @datesarf, 103), [UserIn] = @UserIn, [TimeIn] = @TimeIn WHERE [sheek_no] = @original_sheek_no AND [bankacountcode] = @original_bankacountcode">
                    <DeleteParameters>
                        <asp:Parameter Name="original_sheek_no" Type="Double" />
                        <asp:Parameter Name="original_bankacountcode" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="sheek_no" Type="Double" />
                        <asp:Parameter Name="bankacountcode" Type="Int32" />
                        <asp:Parameter Name="sheek_date" Type="String" />
                        <asp:Parameter Name="eshkakdate" Type="String" />
                        <asp:Parameter Name="del" Type="Boolean" />
                        <asp:Parameter Name="used" Type="Boolean" />
                        <asp:Parameter Name="mortd" Type="Boolean" />
                        <asp:Parameter Name="soref" Type="Boolean" />
                        <asp:Parameter Name="datesarf" Type="String" />
                        <asp:Parameter Name="UserIn" Type="Int32" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="sheek_date" Type="String" />
                        <asp:Parameter Name="eshkakdate" Type="String" />
                        <asp:Parameter Name="del" Type="Boolean" />
                        <asp:Parameter Name="used" Type="Boolean" />
                        <asp:Parameter Name="mortd" Type="Boolean" />
                        <asp:Parameter Name="soref" Type="Boolean" />
                        <asp:Parameter Name="datesarf" Type="String" />
                        <asp:Parameter Name="UserIn" Type="Int32" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                        <asp:Parameter Name="original_sheek_no" Type="Double" />
                        <asp:Parameter Name="original_bankacountcode" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <telerik:RadGrid ID="RadGridEditor" runat="server" DataSourceID="SqlDataSourceCodez" 
                    GridLines="None" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
        <MasterTableView datakeynames="sheek_no,bankacountcode" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Size="14pt" Font-Names="Arial">
         <CommandItemSettings AddNewRecordText="اضافه" 
                RefreshText="تجديد البيانات" />
        <RowIndicatorColumn Visible="False">
        <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>
        <ExpandCollapseColumn Visible="False" Resizable="False" ButtonType="ImageButton">
        <HeaderStyle Width="20px" ForeColor="Black"></HeaderStyle>
        </ExpandCollapseColumn>

            <Columns>
                <telerik:GridBoundColumn DataField="sheek_no" HeaderText="رقم الشيــــك" 
                    SortExpression="sheek_no" UniqueName="sheek_no">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="bankacountname" 
                    HeaderText="اسم الحساب" ReadOnly="True" SortExpression="bankacountname" 
                    UniqueName="bankacountname">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sheek_date" DataType="System.DateTime" 
                    HeaderText="تاريخ التحرير" SortExpression="sheek_date" UniqueName="sheek_date">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="eshkakdate" DataType="System.DateTime" 
                    HeaderText="تاريخ الاستحقاق" SortExpression="eshkakdate" 
                    UniqueName="eshkakdate">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="del" DataType="System.Boolean" 
                    HeaderText="ملغي" SortExpression="del" UniqueName="del">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="used" DataType="System.Boolean" 
                    HeaderText="مستخدم" SortExpression="used" UniqueName="used">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="mortd" DataType="System.Boolean" 
                    HeaderText="مرتد" SortExpression="mortd" UniqueName="mortd">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="soref" DataType="System.Boolean" 
                    HeaderText="صرف" SortExpression="soref" UniqueName="soref">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridBoundColumn DataField="datesarf" DataType="System.DateTime" 
                    HeaderText="تاريخ الصرف الفعلي" SortExpression="datesarf" UniqueName="datesarf">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" >
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
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
            <FormTableItemStyle ForeColor="Black" Font-Size="16px" />
            <FormTableAlternatingItemStyle ForeColor="Black" />
            <FormTableButtonRowStyle ForeColor="Black" />
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
                    <ItemStyle ForeColor="Black" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
</div>