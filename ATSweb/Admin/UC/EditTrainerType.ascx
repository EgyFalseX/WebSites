﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditTrainerType.ascx.cs" Inherits="EditTrainerType" %>
 
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
                    <MasterTableView CommandItemDisplay="TopAndBottom" 
                        DataKeyNames="Trainer_type_id" HorizontalAlign="NotSet" 
                        Width="100%" Dir="RTL" NoDetailRecordsText="لا يوجد عنصر داخلي للعرض" 
                        NoMasterRecordsText="لا يوجد عنصر للعرض" DataSourceID="DSData" 
                        EnableHeaderContextAggregatesMenu="True" 
                        Caption="فئات المدربين المعتمدين">
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
                            <telerik:GridBoundColumn DataField="Trainer_type" 
                                FilterControlAltText="Filter Trainer_type column" 
                                UniqueName="Trainer_type" HeaderText="اسم الفئه" 
                                SortExpression="Trainer_type">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" 
                                UniqueName="EditCommandColumn" HeaderText="تعديل" CancelText="الغاء" 
                                EditText="تعديل" InsertText="اضافه" UpdateText="تحديث">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle CssClass="MyImageButton" HorizontalAlign="Center" />
                            </telerik:GridEditCommandColumn>
                            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmDialogType="RadWindow" ConfirmText="هل انت متأكد؟" 
                                ConfirmTitle="تحـــزير" FilterControlAltText="Filter DeleteColumn column" 
                                Text="حذف" UniqueName="DeleteColumn" HeaderText="حذف">
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
                DeleteCommand="DELETE FROM [cd_Trainer_type] WHERE [Trainer_type_id] = ?" 
                InsertCommand="INSERT INTO [cd_Trainer_type] ([Trainer_type]) VALUES (?)" 
                SelectCommand="SELECT [Trainer_type_id], [Trainer_type] FROM [cd_Trainer_type]" 
                
                UpdateCommand="UPDATE [cd_Trainer_type] SET [Trainer_type] = ? WHERE [Trainer_type_id] = ?" 
                onselected="DSData_Selected">
                <DeleteParameters>
                    <asp:Parameter Name="Trainer_type_id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Trainer_type" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Trainer_type" Type="String" />
                    <asp:Parameter Name="Trainer_type_id" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
        </td>
    </tr>
</table>
