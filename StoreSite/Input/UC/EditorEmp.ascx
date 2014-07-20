<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorEmp.ascx.cs" Inherits="EditorEmp" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }
</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td style="text-align: center">
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
        <MasterTableView datakeynames="EmpID" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Bold="False" Font-Size="12pt" 
                        Font-Names="Arial">
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
                <telerik:GridBoundColumn DataField="EmpName" 
                    HeaderText="الاسم" SortExpression="EmpName" 
                    UniqueName="EmpName">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NationalId" HeaderText="الرقم القومي" 
                    SortExpression="NationalId" UniqueName="NationalId" Display="False">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="BrithDate" HeaderText="تاريخ الميلاد" 
                    SortExpression="BrithDate" UniqueName="BrithDate" Display="False">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" 
                            Text='<%# Bind("BrithDate", "{0:d}") %>'></asp:TextBox>
                        <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="TextBox1">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("BrithDate", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridDropDownColumn DataField="QualId" DataSourceID="SqlDataSourceQua" 
                    HeaderText="المؤهل" ListTextField="QualName" ListValueField="QualID" 
                    SortExpression="QualId" UniqueName="QualId" 
                    DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="QualTakasos" 
                    DataSourceID="SqlDataSourceTakasos" HeaderText="التخصص" 
                    ListTextField="QualTakasosName" ListValueField="QualTakasos" 
                    SortExpression="QualTakasos" UniqueName="QualTakasos" 
                    DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="QualGehaId" 
                    DataSourceID="SqlDataSourceGeha" HeaderText="الجهـــه" 
                    ListTextField="QualGehaName" ListValueField="QualGehaId" 
                    SortExpression="QualGehaId" UniqueName="QualGehaId" Display="False" 
                    DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="YearQual" DataType="System.Int32" 
                    HeaderText="سنة التخرج" SortExpression="YearQual" UniqueName="YearQual" 
                    Display="False">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="QualTakder" 
                    DataSourceID="SqlDataSourceTakder" HeaderText="التقدير" 
                    ListTextField="QualTakerName" ListValueField="QualTakder" 
                    SortExpression="QualTakder" UniqueName="QualTakder" Display="False" 
                    DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="JobId" DataSourceID="SqlDataSourceJob" 
                    HeaderText="الوظيفه" ListTextField="JobId1" ListValueField="JobId" 
                    SortExpression="JobId" UniqueName="JobId" 
                    DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="JobDescId" 
                    DataSourceID="SqlDataSourceJobDesc" HeaderText="التوظيف الوظيفي" 
                    ListTextField="JobDescName" ListValueField="JobDescId" 
                    SortExpression="JobDescId" UniqueName="JobDescId" 
                    DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="BranchId" 
                    DataSourceID="SqlDataSourceBranch" HeaderText="الفرع" 
                    ListTextField="Branchename" ListValueField="Branchecode" 
                    SortExpression="BranchId" UniqueName="BranchId" 
                    DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="EdaraId" 
                    DataSourceID="SqlDataSourceEdara" HeaderText="الاداره" 
                    ListTextField="EdaraName" ListValueField="EdaraId" SortExpression="EdaraId" 
                    UniqueName="EdaraId" DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="DepID" 
                    DataSourceID="SqlDataSourceDepertement" HeaderText="القسم" 
                    ListTextField="DepName" ListValueField="DepID" SortExpression="DepID" 
                    UniqueName="DepID" DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="mobil" HeaderText="الموبيل" 
                    SortExpression="mobil" UniqueName="mobil" Display="False">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="phone" HeaderText="التليفون" 
                    SortExpression="phone" UniqueName="phone" Display="False">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="address" HeaderText="العنوان" 
                    SortExpression="address" UniqueName="address" Display="False">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="email" HeaderText="البريد" 
                    SortExpression="email" UniqueName="email" Display="False">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="BasicSalary" DataType="System.Double" 
                    HeaderText="المرتب الاساسي" SortExpression="BasicSalary" 
                    UniqueName="BasicSalary" Display="False">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="WorkHour" DataType="System.Int32" 
                    HeaderText="عدد الساعات" SortExpression="WorkHour" UniqueName="WorkHour" 
                    Display="False">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="SalaryTypeId" 
                    DataSourceID="SqlDataSourceSalaryType" HeaderText="نوع المرتب" 
                    ListTextField="SalaryTypeName" ListValueField="SalaryTypeId" 
                    SortExpression="SalaryTypeId" UniqueName="SalaryTypeId" Display="False" 
                    DropDownControlType="DropDownList">
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" />
            </Columns>

        <EditFormSettings>
            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertText="اضافه" UpdateText="حفظ التعديل">
                <FooterStyle ForeColor="Black" />
            </EditColumn>
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" />
            <FormTableItemStyle Font-Size="18px" />
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
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    DeleteCommand="DELETE FROM [TblEmp] WHERE [EmpID] = @original_EmpID" 
                    InsertCommand="INSERT INTO [TblEmp] ([EmpID], [EmpName], [NationalId], [BrithDate], [QualId], [QualTakasos], [QualGehaId], [YearQual], [QualTakder], [JobId], [JobDescId], [BranchId], [EdaraId], [DepID], [mobil], [phone], [address], [email], [BasicSalary], [WorkHour], [SalaryTypeId]) VALUES ((SELECT ISNULL(MAX(EmpID) + 1, 1) AS NewID FROM TblEmp), @EmpName, @NationalId, @BrithDate, @QualId, @QualTakasos, @QualGehaId, @YearQual, @QualTakder, @JobId, @JobDescId, @BranchId, @EdaraId, @DepID, @mobil, @phone, @address, @email, @BasicSalary, @WorkHour, @SalaryTypeId)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [EmpID], [EmpName], [NationalId], [BrithDate], [QualId], [QualTakasos], [QualGehaId], [YearQual], [QualTakder], [JobId], [JobDescId], [BranchId], [EdaraId], [DepID], [mobil], [phone], [address], [email], [BasicSalary], [WorkHour], [SalaryTypeId] FROM [TblEmp]" 
                    
                    
                    UpdateCommand="UPDATE [TblEmp] SET [EmpName] = @EmpName, [NationalId] = @NationalId, [BrithDate] = @BrithDate, [QualId] = @QualId, [QualTakasos] = @QualTakasos, [QualGehaId] = @QualGehaId, [YearQual] = @YearQual, [QualTakder] = @QualTakder, [JobId] = @JobId, [JobDescId] = @JobDescId, [BranchId] = @BranchId, [EdaraId] = @EdaraId, [DepID] = @DepID, [mobil] = @mobil, [phone] = @phone, [address] = @address, [email] = @email, [BasicSalary] = @BasicSalary, [WorkHour] = @WorkHour, [SalaryTypeId] = @SalaryTypeId WHERE [EmpID] = @original_EmpID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_EmpID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmpName" Type="String" />
                        <asp:Parameter Name="NationalId" Type="String" />
                        <asp:Parameter DbType="Date" Name="BrithDate" />
                        <asp:Parameter Name="QualId" Type="Int32" />
                        <asp:Parameter Name="QualTakasos" Type="Int32" />
                        <asp:Parameter Name="QualGehaId" Type="Int32" />
                        <asp:Parameter Name="YearQual" Type="Int32" />
                        <asp:Parameter Name="QualTakder" Type="Byte" />
                        <asp:Parameter Name="JobId" Type="Int32" />
                        <asp:Parameter Name="JobDescId" Type="Int32" />
                        <asp:Parameter Name="BranchId" Type="Int32" />
                        <asp:Parameter Name="EdaraId" Type="Int32" />
                        <asp:Parameter Name="DepID" Type="Int32" />
                        <asp:Parameter Name="mobil" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="BasicSalary" Type="Double" />
                        <asp:Parameter Name="WorkHour" Type="Int32" />
                        <asp:Parameter Name="SalaryTypeId" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmpName" Type="String" />
                        <asp:Parameter Name="NationalId" Type="String" />
                        <asp:Parameter Name="BrithDate" DbType="Date" />
                        <asp:Parameter Name="QualId" Type="Int32" />
                        <asp:Parameter Name="QualTakasos" Type="Int32" />
                        <asp:Parameter Name="QualGehaId" Type="Int32" />
                        <asp:Parameter Name="YearQual" Type="Int32" />
                        <asp:Parameter Name="QualTakder" Type="Byte" />
                        <asp:Parameter Name="JobId" Type="Int32" />
                        <asp:Parameter Name="JobDescId" Type="Int32" />
                        <asp:Parameter Name="BranchId" Type="Int32" />
                        <asp:Parameter Name="EdaraId" Type="Int32" />
                        <asp:Parameter Name="DepID" Type="Int32" />
                        <asp:Parameter Name="mobil" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="address" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="BasicSalary" Type="Double" />
                        <asp:Parameter Name="WorkHour" Type="Int32" />
                        <asp:Parameter Name="SalaryTypeId" Type="Int32" />
                        <asp:Parameter Name="original_EmpID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceQua" runat="server" 
                    SelectCommand="SELECT QualID, QualName FROM CdQual"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceGeha" runat="server" 
                    SelectCommand="SELECT QualGehaName,QualGehaId FROM Geha">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTakder" runat="server" 
                    SelectCommand="SELECT QualTakder,QualTakerName FROM CdQualTakder">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceJob" runat="server" 
                    SelectCommand="SELECT JobId,JobId1 FROM CdJob"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceJobDesc" runat="server" 
                    SelectCommand="SELECT JobDescId,JobDescName,JobBisicSalary FROM CdJobDesc">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceBranch" runat="server" 
                    SelectCommand="SELECT Branchecode, Branchename FROM CdBranches">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceEdara" runat="server" 
                    SelectCommand="SELECT EdaraId,EdaraName FROM CdEdara"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceDepertement" runat="server" 
                    SelectCommand="SELECT DepID, DepName FROM CdDepertement">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceSalaryType" runat="server" 
                    SelectCommand="SELECT SalaryTypeId,SalaryTypeName FROM CdSalaryType">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTakasos" runat="server" 
                    SelectCommand="SELECT QualTakasos,QualTakasosName FROM CdQualTakasos">
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