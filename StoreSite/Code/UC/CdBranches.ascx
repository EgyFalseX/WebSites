﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CdBranches.ascx.cs" Inherits="CdBranches" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 20px;
    }
</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td>
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
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
        <MasterTableView datakeynames="Branchecode" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridBoundColumn DataField="Branchename" 
                    HeaderText="اسم الفرع" SortExpression="Branchename" 
                    UniqueName="Branchename">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="BrancheAADDRES" HeaderText="العنوان" 
                    SortExpression="BrancheAADDRES" UniqueName="BrancheAADDRES">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="BrancheTel" HeaderText="التليفون" 
                    SortExpression="BrancheTel" UniqueName="BrancheTel">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="BrancheMobil" HeaderText="الموبيل" 
                    SortExpression="BrancheMobil" UniqueName="BrancheMobil">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Branchefax" HeaderText="الفاكس #1" 
                    SortExpression="Branchefax" UniqueName="Branchefax">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Branchefax1" HeaderText="الفاكس #2" 
                    SortExpression="Branchefax1" UniqueName="Branchefax1">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" />
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
            <FormMainTableStyle ForeColor="Black" />
            <FormTableItemStyle ForeColor="Black" Font-Size="18px" />
            <FormTableAlternatingItemStyle ForeColor="Black" />
            <FormTableButtonRowStyle ForeColor="Black" />
        <PopUpSettings ScrollBars="None"></PopUpSettings>
            
        </EditFormSettings>
            <ItemStyle ForeColor="Black" />
            <GroupHeaderItemStyle ForeColor="Black" />
            <EditItemStyle ForeColor="Black" Font-Size="18px" />
            <PagerStyle NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" />
            <HeaderStyle ForeColor="Black" />
            <CommandItemStyle Font-Bold="False" />
        </MasterTableView>
                    <EditItemStyle Font-Bold="True" />
                    <CommandItemStyle Font-Bold="False" ForeColor="Black" />
                    <ItemStyle ForeColor="Black" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [CdBranches] WHERE [Branchecode] = @original_Branchecode" 
                    InsertCommand="INSERT INTO [CdBranches] ([Branchecode], [Branchename], [BrancheAADDRES], [BrancheTel], [BrancheMobil], [Branchefax], [Branchefax1]) VALUES ((SELECT ISNULL(MAX(Branchecode) + 1, 1) AS NewID FROM CdBranches), @Branchename, @BrancheAADDRES, @BrancheTel, @BrancheMobil, @Branchefax, @Branchefax1)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [Branchecode], [Branchename], [BrancheAADDRES], [BrancheTel], [BrancheMobil], [Branchefax], [Branchefax1] FROM [CdBranches]" 
                    
                    
                    
                    UpdateCommand="UPDATE [CdBranches] SET [Branchename] = @Branchename, [BrancheAADDRES] = @BrancheAADDRES, [BrancheTel] = @BrancheTel, [BrancheMobil] = @BrancheMobil, [Branchefax] = @Branchefax, [Branchefax1] = @Branchefax1 WHERE [Branchecode] = @original_Branchecode">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Branchecode" Type="Byte" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Branchename" Type="String" />
                        <asp:Parameter Name="BrancheAADDRES" Type="String" />
                        <asp:Parameter Name="BrancheTel" Type="String" />
                        <asp:Parameter Name="BrancheMobil" Type="String" />
                        <asp:Parameter Name="Branchefax" Type="String" />
                        <asp:Parameter Name="Branchefax1" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Branchename" Type="String" />
                        <asp:Parameter Name="BrancheAADDRES" Type="String" />
                        <asp:Parameter Name="BrancheTel" Type="String" />
                        <asp:Parameter Name="BrancheMobil" Type="String" />
                        <asp:Parameter Name="Branchefax" Type="String" />
                        <asp:Parameter Name="Branchefax1" Type="String" />
                        <asp:Parameter Name="original_Branchecode" Type="Byte" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>
</div>