﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CDMawad_aldragat.ascx.cs" Inherits="CDMawad_aldragat" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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

        <MasterTableView datakeynames="alsofof_code,FatraId,code_type_aldaragat,mawad_no" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridDropDownColumn DataField="alsofof_code" 
                    DataSourceID="SqlDataSourceCDAlsofof" DropDownControlType="DropDownList" 
                    HeaderText="اسم الصف" ListTextField="alsofof_name" 
                    ListValueField="alsofof_code" SortExpression="alsofof_code" 
                    UniqueName="alsofof_code">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="FatraId" 
                    DataSourceID="SqlDataSourceCDFATRA" DropDownControlType="DropDownList" 
                    HeaderText="اسم فتره الدرجه" ListTextField="FatraNameAR" 
                    ListValueField="FatraId" SortExpression="FatraId" UniqueName="FatraId">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="code_type_aldaragat" 
                    DataSourceID="SqlDataSourceCDTypeAldaragat" DropDownControlType="DropDownList" 
                    HeaderText="اسم نوع الدرجه" ListTextField="nametypealdaragat" 
                    ListValueField="code_type_aldaragat" SortExpression="code_type_aldaragat" 
                    UniqueName="code_type_aldaragat">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="mawad_no" 
                    DataSourceID="SqlDataSourceCDMawad" DropDownControlType="DropDownList" 
                    HeaderText="اسم الماده" ListTextField="mowad_name" ListValueField="mawad_no" 
                    SortExpression="mawad_no" UniqueName="mawad_no">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="degree" 
                    HeaderText="درجة الماده" SortExpression="degree" 
                    UniqueName="degree" DataType="System.Single">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="tarteeb_elmada" DataType="System.Byte" 
                    HeaderText="ترتيب عرض الماده" SortExpression="tarteeb_elmada" 
                    UniqueName="tarteeb_elmada">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" Text="تعديل" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" 
                    Text="حذف" />
            </Columns>

        <EditFormSettings>

<FormStyle ForeColor="Black"></FormStyle>

<FormTableStyle ForeColor="Black"></FormTableStyle>

<FormMainTableStyle ForeColor="Black"></FormMainTableStyle>

<FormTableAlternatingItemStyle ForeColor="Black"></FormTableAlternatingItemStyle>

<FormTableButtonRowStyle ForeColor="Black"></FormTableButtonRowStyle>

            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertImageUrl="~/Images/AddTGrid.png" InsertText="اضافه" UpdateText="حفظ التعديل">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
            </EditColumn>
            <FormStyle ForeColor="Black" Font-Bold="False" />
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" HorizontalAlign="Center" />

<FormTableItemStyle ForeColor="Black" Font-Size="18px"></FormTableItemStyle>

            <FormTableAlternatingItemStyle ForeColor="Black" Font-Bold="True" 
                Font-Size="16px" />
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

<CommandItemStyle Font-Bold="False" ForeColor="Black"></CommandItemStyle>

                    <ItemStyle ForeColor="Black" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />

<StatusBarSettings ReadyText="جاهز" LoadingText="تحميل....."></StatusBarSettings>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [CDMawad_aldragat] WHERE [alsofof_code] = @original_alsofof_code AND [FatraId] = @original_FatraId AND [code_type_aldaragat] = @original_code_type_aldaragat AND [mawad_no] = @original_mawad_no" 
                    InsertCommand="INSERT INTO [CDMawad_aldragat] ([alsofof_code], [FatraId], [code_type_aldaragat], [mawad_no], [degree], [tarteeb_elmada]) VALUES (@alsofof_code, @FatraId, @code_type_aldaragat, @mawad_no, @degree, @tarteeb_elmada)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [alsofof_code], [FatraId], [code_type_aldaragat], [mawad_no], [degree], [tarteeb_elmada] FROM [CDMawad_aldragat]" 
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [CDMawad_aldragat] SET [degree] = @degree, [tarteeb_elmada] = @tarteeb_elmada, alsofof_code = @alsofof_code, FatraId = @FatraId, code_type_aldaragat = @code_type_aldaragat, mawad_no = @mawad_no
 WHERE [alsofof_code] = @original_alsofof_code AND [FatraId] = @original_FatraId AND [code_type_aldaragat] = @original_code_type_aldaragat AND [mawad_no] = @original_mawad_no">
                    <DeleteParameters>
                        <asp:Parameter Name="original_alsofof_code" Type="Byte" />
                        <asp:Parameter Name="original_FatraId" Type="Byte" />
                        <asp:Parameter Name="original_code_type_aldaragat" Type="Byte" />
                        <asp:Parameter Name="original_mawad_no" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="alsofof_code" Type="Byte" />
                        <asp:Parameter Name="FatraId" Type="Byte" />
                        <asp:Parameter Name="code_type_aldaragat" Type="Byte" />
                        <asp:Parameter Name="mawad_no" Type="Int16" />
                        <asp:Parameter Name="degree" Type="Single" />
                        <asp:Parameter Name="tarteeb_elmada" Type="Byte" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="degree" Type="Single" />
                        <asp:Parameter Name="tarteeb_elmada" Type="Byte" />
                        <asp:Parameter Name="original_alsofof_code" Type="Byte" />
                        <asp:Parameter Name="original_FatraId" Type="Byte" />
                        <asp:Parameter Name="original_code_type_aldaragat" Type="Byte" />
                        <asp:Parameter Name="original_mawad_no" Type="Int16" />
                        <asp:Parameter Name="alsofof_code" />
                        <asp:Parameter Name="FatraId" />
                        <asp:Parameter Name="code_type_aldaragat" />
                        <asp:Parameter Name="mawad_no" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCDAlsofof" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [CDAlsofof]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCDFATRA" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [FatraId], [FatraNameAR] FROM [CDFATRA]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCDTypeAldaragat" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    
                    SelectCommand="SELECT [code_type_aldaragat], [nametypealdaragat] FROM [CDTypeAldaragat]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCDMawad" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [mawad_no], [mowad_name] FROM [CDMawad]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>

