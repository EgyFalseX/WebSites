<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditTrainerShow.ascx.cs" Inherits="EditTrainerShow" %>
 
 <style type="text/css">
     .style1
     {
         width: 700px;
     }
 </style>

<script type="text/javascript">
        // two functions to make page unactive while message is shown
        var modalDiv = null;
        function showModalDiv(sender, args) {
            if (!modalDiv) {
                modalDiv = document.createElement("div");
                modalDiv.style.width = "100%";
                modalDiv.style.height = "100%";
                modalDiv.style.backgroundColor = "#aaaaaa";
                modalDiv.style.position = "absolute";
                modalDiv.style.left = "0px";
                modalDiv.style.top = "0px";
                modalDiv.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=50)";
                modalDiv.style.opacity = ".5";
                modalDiv.style.MozOpacity = ".5";
                modalDiv.setAttribute("unselectable", "on");
                modalDiv.style.zIndex = (sender.get_zIndex() - 1).toString();
                document.body.appendChild(modalDiv);
            }
            modalDiv.style.display = "";
        }
        function hideModalDiv() {
            modalDiv.style.display = "none";
        }
        //This function to help gird to exporting
        function requestStart(sender, args) 
        {
            if (args.get_eventTarget().indexOf("ExportToCsvButton") > 0)
                args.set_enableAjax(false);
            if (args.get_eventTarget().indexOf("ExportToExcelButton") > 0)
                args.set_enableAjax(false);
            if (args.get_eventTarget().indexOf("ExportToPdfButton") > 0)
                args.set_enableAjax(false);
            if (args.get_eventTarget().indexOf("ExportToWordButton") > 0)
                args.set_enableAjax(false);
        }
</script>

<table align="center" class="style1">
    <tr>
        <td>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanelEdit" runat="server" />
            <telerik:RadAjaxPanel ID="RadAjaxPanelEdit" runat="server">
                <telerik:RadAjaxManager ID="RadAjaxManagerEdit" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanelEdit"
                    ClientEvents-OnRequestStart="requestStart">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="RadGridEdit">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadGridEdit" />
                                <telerik:AjaxUpdatedControl ControlID="RadNotificationInfo" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                </telerik:RadAjaxManager>
                <telerik:RadGrid ID="RadGridEdit" GridLines="None" runat="server" 
                    AllowAutomaticDeletes="True" AllowAutomaticInserts="True" PageSize="20" 
                    AllowAutomaticUpdates="True" AllowPaging="True" 
                    AllowFilteringByColumn="True"  AutoGenerateColumns="False" 
                    Culture="ar-EG" CellSpacing="0" ShowGroupPanel="True" ShowStatusBar="True" 
                    onitemdeleted="RadGridEdit_ItemDeleted" 
                    oniteminserted="RadGridEdit_ItemInserted" 
                    onitemupdated="RadGridEdit_ItemUpdated" DataSourceID="DSData" 
                    ShowFooter="True" EnableTheming="True" 
                    onitemdatabound="RadGridEdit_ItemDataBound" 
                    EnableHeaderContextAggregatesMenu="True" EnableHeaderContextFilterMenu="True" 
                    EnableHeaderContextMenu="True" AllowSorting="True">
                    <GroupingSettings CollapseTooltip="غلق حزمه" ExpandTooltip="فتح حزمه" 
                        GroupContinuedFormatString="استكمال الجزمه من الصفحه السابقه" 
                        GroupContinuesFormatString="الحزمه ستستكمل في الصفحه القادمه" 
                        GroupSplitDisplayFormat="عرض {0} of {1} عناصر." 
                        UnGroupButtonTooltip="اسحب هنا لالغاء الحزمه" 
                        UnGroupTooltip="اسحب خارج الشريط لالغاء الحزمه" />
                    <SortingSettings SortedAscToolTip="مرتبه تصاعدي" 
                        SortedDescToolTip="مرتبه تنازلي" SortToolTip="اضغط هنا للترتيب" />
                    <ExportSettings ExportOnlyData="True" FileName="GridDataExport" 
                        IgnorePaging="True" OpenInNewWindow="True">
                        <Pdf Author="E-E-Soft" Creator="FalseX" Producer="FalseX" />
                    </ExportSettings>
                    <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" 
                        AllowDragToGroup="True">
                        <Selecting AllowRowSelect="True" />
                        <ClientMessages DragToGroupOrReorder="اسحب لتصنع حزمه او أعادة الترتيب" 
                            DragToResize="اسحب لتغيير حجم" DropHereToReorder="اسحب هنا لأعادة الترتيب" 
                            ColumnResizeTooltipFormatString="عرض: &lt;strong&gt;{0}&lt;/strong&gt; &lt;em&gt;نقط&lt;/em&gt;" 
                            PagerTooltipFormatString="صفحه &lt;strong&gt;{0}&lt;/strong&gt; من &lt;strong&gt;{1}&lt;/strong&gt;" />
                        <Resizing AllowResizeToFit="True" EnableRealTimeResize="True" 
                            ResizeGridOnColumnResize="True" />
                    </ClientSettings>
                    <GroupPanel Text="اسحب راس عمود ثم افلت هنا لأنشاء حزمه من هذا العمود">
                    </GroupPanel>
                    <MasterTableView CommandItemDisplay="TopAndBottom" DataKeyNames="id" HorizontalAlign="NotSet" 
                        Width="100%" Dir="RTL" NoDetailRecordsText="لا يوجد عنصر داخلي للعرض" 
                        NoMasterRecordsText="لا يوجد عنصر للعرض" DataSourceID="DSData" 
                        EnableHeaderContextAggregatesMenu="True" 
                        Caption="مستشارو الاكاديمية">
                        <CommandItemSettings ExportToPdfText="تصدير الي PDF" 
                            AddNewRecordText="اضافة جديد" ExportToCsvText="تصدير الي CSV" 
                            ExportToExcelText="تصدير الي Excel" ExportToWordText="تصدير الي Word" 
                            RefreshText="تحديث" ShowExportToCsvButton="True" ShowExportToExcelButton="True" 
                            ShowExportToPdfButton="True" ShowExportToWordButton="True" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn DataField="id" 
                                FilterControlAltText="Filter id column" HeaderText="id" 
                                ReadOnly="True" SortExpression="id" UniqueName="id" Display="False" 
                                Visible="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TrainerName" 
                                FilterControlAltText="Filter TrainerName column" 
                                UniqueName="TrainerName" HeaderText="اسم المدرب" 
                                SortExpression="TrainerName">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Trainer_type" 
                                FilterControlAltText="Filter Trainer_type column" HeaderText="الفئه" 
                                ReadOnly="True" SortExpression="Trainer_type" UniqueName="Trainer_type">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridDropDownColumn DataField="Trainer_type_id" 
                                DataSourceID="DScd_Trainer_type" Display="False" 
                                FilterControlAltText="Filter Trainer_type_id column" HeaderText="الفئه" 
                                ListTextField="Trainer_type" ListValueField="Trainer_type_id" 
                                SortExpression="Trainer_type_id" UniqueName="Trainer_type_id" Visible="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridDropDownColumn>
                            <telerik:GridTemplateColumn DataField="Trainepic" 
                                FilterControlAltText="Filter Trainepic column" HeaderText="الصوره" 
                                SortExpression="Trainepic" UniqueName="Trainepic">
                                <EditItemTemplate>
                                    <telerik:RadAsyncUpload ID="RadAsyncUploadImg" runat="server" 
                                        AllowedFileExtensions="jpg,jprg,gif" MaxFileInputsCount="1" 
                                        MaxFileSize="1048576" onfileuploaded="RadAsyncUploadImg_FileUploaded" 
                                        TargetFolder="../temp" TemporaryFolder="../temp">
                                        <Localization Cancel="الغاء" Remove="حذف" Select="اختار" />
                                    </telerik:RadAsyncUpload>
                                    <asp:HiddenField ID="HFimg" runat="server" Value='<%# Bind("Trainepic") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Img" runat="server" Height="64px" 
                                        ImageUrl='<%# Eval("Trainepic", "../../CourseFiles/Trainer/{0}") %>' 
                                        Width="64px" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridTemplateColumn>
                            <telerik:GridBoundColumn DataField="city" 
                                FilterControlAltText="Filter city column" 
                                HeaderText="المدينه" 
                                UniqueName="city" SortExpression="city">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="tat" 
                                FilterControlAltText="Filter tat column" HeaderText="التخصص" 
                                SortExpression="tat" UniqueName="tat">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn DataField="date_entry" FilterControlAltText="Filter date_entry column" 
                                HeaderText="تاريخ الادخال" SortExpression="date_entry" 
                                UniqueName="date_entry" DataType="System.DateTime" 
                                DataFormatString="{0:d/M/yyyy}" EditDataFormatString="d/M/yyyy">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridDateTimeColumn>
                            <telerik:GridCheckBoxColumn DataField="viewpage" DefaultInsertValue="true" 
                                FilterControlAltText="Filter viewpage column" HeaderText="يعرض" 
                                SortExpression="viewpage" UniqueName="viewpage">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridCheckBoxColumn>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" CancelText="الغاء" 
                                EditText="تعديل" HeaderText="تعديل" InsertText="اضافه" 
                                UniqueName="EditCommandColumn" UpdateText="تحديث">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle CssClass="MyImageButton" HorizontalAlign="Center" />
                            </telerik:GridEditCommandColumn>
                            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmDialogType="RadWindow" ConfirmText="هل انت متأكد؟" 
                                ConfirmTitle="تحـــزير" FilterControlAltText="Filter DeleteColumn column" 
                                HeaderText="حذف" Text="حذف" UniqueName="DeleteColumn">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle CssClass="MyImageButton" HorizontalAlign="Center" />
                            </telerik:GridButtonColumn>
                        </Columns>
                        <EditFormSettings>
                            <FormTableItemStyle Wrap="False" />
                            <FormCaptionStyle CssClass="EditFormHeader" />
                            <FormMainTableStyle BackColor="White" CellPadding="3" CellSpacing="0" 
                                GridLines="None" Width="100%" />
                            <FormTableStyle BackColor="White" CellPadding="2" CellSpacing="0" 
                                Height="110px" />
                            <FormTableAlternatingItemStyle Wrap="False" />
                            <EditColumn ButtonType="ImageButton" CancelText="Cancel edit" 
                                UniqueName="EditCommandColumn1">
                            </EditColumn>
                            <FormTableButtonRowStyle CssClass="EditFormButtonRow" HorizontalAlign="Right" />
                        </EditFormSettings>
                        <PagerStyle FirstPageToolTip="الصفحه الاولي" LastPageToolTip="الصفحه الاخيره" 
                            NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                            PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                            PageSizeLabelText="حجم الصفحه:" PrevPagesToolTip="الصفحات السابقه" 
                            PrevPageToolTip="لصفحه السابقه" />
                    </MasterTableView>
                    <PagerStyle FirstPageToolTip="الصفحة الاولي" LastPageToolTip="الصفحه الاخيره" 
                        NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحات التاليه" 
                        PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;صفحه &lt;strong&gt;{0}&lt;/strong&gt; من &lt;strong&gt;{1}&lt;/strong&gt;, عناصر &lt;strong&gt;{2}&lt;/strong&gt; الي &lt;strong&gt;{3}&lt;/strong&gt; من &lt;strong&gt;{5}&lt;/strong&gt;." 
                        PageSizeLabelText="حجم الصفحه" PrevPagesToolTip="الصفحات السابقه" 
                        PrevPageToolTip="الصفحه السابقه" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
                </telerik:RadGrid>
                <telerik:RadNotification ID="RadNotificationInfo" runat="server" 
                    AutoCloseDelay="0" EnableRoundedCorners="True"
                    onclienthidden="hideModalDiv" onclientshowing="showModalDiv" 
                    Position="Center" Skin="Default" Animation="Fade" AnimationDuration="1000" 
                    Width="400px">
                </telerik:RadNotification>
                <telerik:RadWindowManager ID="RadWindowManagerEdit" runat="server">
                </telerik:RadWindowManager>
            </telerik:RadAjaxPanel>
            <asp:AccessDataSource ID="DSData"
                runat="server" oninserting="DSData_Inserting" 
                DataFile="~/App_Data/AATSWEB.mdb" 
                DeleteCommand="DELETE FROM [Trainer_show] WHERE [id] = ?" 
                InsertCommand="INSERT INTO [Trainer_show] ([TrainerName], [Trainer_type_id], [viewpage], [Trainepic], [date_entry], [city], [tat]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [id], [TrainerName], [Trainer_type_id], [viewpage], [Trainepic], [date_entry], [city], [tat],
(Select Trainer_type From cd_Trainer_type Where Trainer_type_id = Trainer_show.Trainer_type_id) AS Trainer_type
 FROM [Trainer_show]" 
                
                UpdateCommand="UPDATE [Trainer_show] SET [TrainerName] = ?, [Trainer_type_id] = ?, [viewpage] = ?, [Trainepic] = ?, [date_entry] = ?, [city] = ?, [tat] = ? WHERE [id] = ?" 
                onselected="DSData_Selected">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TrainerName" Type="String" />
                    <asp:Parameter Name="Trainer_type_id" Type="Int32" />
                    <asp:Parameter Name="viewpage" Type="Boolean" />
                    <asp:Parameter Name="Trainepic" Type="String" />
                    <asp:Parameter Name="date_entry" Type="DateTime" />
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="tat" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TrainerName" Type="String" />
                    <asp:Parameter Name="Trainer_type_id" Type="Int32" />
                    <asp:Parameter Name="viewpage" Type="Boolean" />
                    <asp:Parameter Name="Trainepic" Type="String" />
                    <asp:Parameter Name="date_entry" Type="DateTime" />
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="tat" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScd_Trainer_type"
                runat="server" SelectCommand="SELECT [Trainer_type_id], [Trainer_type] FROM [cd_Trainer_type]" 
                DataFile="~/App_Data/AATSWEB.mdb"></asp:AccessDataSource>
        </td>
    </tr>
</table>

