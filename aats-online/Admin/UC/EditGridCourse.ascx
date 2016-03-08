<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditGridCourse.ascx.cs"
    Inherits="EditGridCourse" %>
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
    function requestStart(sender, args) {
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
                    AllowAutomaticDeletes="True" PageSize="20" AllowPaging="True"
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" Culture="ar-EG" CellSpacing="0"
                    ShowGroupPanel="True" ShowStatusBar="True" OnItemDeleted="RadGridEdit_ItemDeleted"
                    DataSourceID="DSData" ShowFooter="True" EnableTheming="True" OnItemDataBound="RadGridEdit_ItemDataBound"
                    EnableHeaderContextAggregatesMenu="True" EnableHeaderContextFilterMenu="True"
                    EnableHeaderContextMenu="True">
                    <GroupingSettings CollapseTooltip="غلق حزمه" ExpandTooltip="فتح حزمه" GroupContinuedFormatString="استكمال الجزمه من الصفحه السابقه"
                        GroupContinuesFormatString="الحزمه ستستكمل في الصفحه القادمه" GroupSplitDisplayFormat="عرض {0} of {1} عناصر."
                        UnGroupButtonTooltip="اسحب هنا لالغاء الحزمه" UnGroupTooltip="اسحب خارج الشريط لالغاء الحزمه" />
                    <SortingSettings SortedAscToolTip="مرتبه تصاعدي" SortedDescToolTip="مرتبه تنازلي"
                        SortToolTip="اضغط هنا للترتيب" />
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
                        <Pdf Author="E-E-Soft" Creator="FalseX" Producer="FalseX" />
                    </ExportSettings>
                    <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                        <Selecting AllowRowSelect="True" />
                        <ClientMessages ColumnResizeTooltipFormatString="عرض: &lt;strong&gt;{0}&lt;/strong&gt; &lt;em&gt;نقط&lt;/em&gt;" 
                            DragToGroupOrReorder="اسحب لتصنع حزمه او أعادة الترتيب" 
                            DragToResize="اسحب لتغيير حجم" DropHereToReorder="اسحب هنا لأعادة الترتيب" 
                            PagerTooltipFormatString="صفحه &lt;strong&gt;{0}&lt;/strong&gt; من &lt;strong&gt;{1}&lt;/strong&gt;" />
                        <Resizing AllowResizeToFit="True" EnableRealTimeResize="True" 
                            ResizeGridOnColumnResize="True" />
                        <Selecting AllowRowSelect="True" />
                        <ClientMessages ColumnResizeTooltipFormatString="عرض: &lt;strong&gt;{0}&lt;/strong&gt; &lt;em&gt;نقط&lt;/em&gt;" 
                            DragToGroupOrReorder="اسحب لتصنع حزمه او أعادة الترتيب" 
                            DragToResize="اسحب لتغيير حجم" DropHereToReorder="اسحب هنا لأعادة الترتيب" 
                            PagerTooltipFormatString="صفحه &lt;strong&gt;{0}&lt;/strong&gt; من &lt;strong&gt;{1}&lt;/strong&gt;" />
                        <Resizing AllowResizeToFit="True" EnableRealTimeResize="True" 
                            ResizeGridOnColumnResize="True" />
                    </ClientSettings>
                    <GroupPanel Text="اسحب راس عمود ثم افلت هنا لأنشاء حزمه من هذا العمود">
                    </GroupPanel>
                    <MasterTableView CommandItemDisplay="TopAndBottom" DataKeyNames="CourseId" HorizontalAlign="NotSet"
                        Width="100%" Dir="RTL" NoDetailRecordsText="لا يوجد عنصر داخلي للعرض" NoMasterRecordsText="لا يوجد عنصر للعرض"
                        DataSourceID="DSData" EnableHeaderContextAggregatesMenu="True">
                        <CommandItemSettings ExportToPdfText="تصدير الي PDF" AddNewRecordText="اضافة جديد"
                            ExportToCsvText="تصدير الي CSV" ExportToExcelText="تصدير الي Excel" ExportToWordText="تصدير الي Word"
                            RefreshText="تحديث" ShowExportToCsvButton="True" ShowExportToExcelButton="True"
                            ShowExportToPdfButton="True" ShowExportToWordButton="True" 
                            ShowAddNewRecordButton="False" />
                        <CommandItemSettings AddNewRecordText="اضافة جديد" 
                            ExportToCsvText="تصدير الي CSV" ExportToExcelText="تصدير الي Excel" 
                            ExportToPdfText="تصدير الي PDF" ExportToWordText="تصدير الي Word" 
                            RefreshText="تحديث" ShowExportToCsvButton="True" ShowExportToExcelButton="True" 
                            ShowExportToPdfButton="True" ShowExportToWordButton="True" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn DataField="CourseId" FilterControlAltText="Filter  column"
                                UniqueName="CourseId" Display="False" ReadOnly="True" Visible="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CourseName" FilterControlAltText="Filter CourseName column"
                                HeaderText="اسم الدورة" SortExpression="CourseName" 
                                UniqueName="CourseName">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StartDate" FilterControlAltText="Filter StartDate column"
                                HeaderText="تاريخ البداية" SortExpression="StartDate" 
                                UniqueName="StartDate">
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndDate" FilterControlAltText="Filter EndDate column"
                                HeaderText="تاريخ النهاية" SortExpression="EndDate" UniqueName="EndDate">
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Price" FilterControlAltText="Filter Price column"
                                HeaderText="السعر" SortExpression="Price" UniqueName="Price">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridCheckBoxColumn DataField="ShowOnline" 
                                FilterControlAltText="Filter ShowOnline column" HeaderText="تعرض على الموقع" 
                                SortExpression="ShowOnline" UniqueName="ShowOnline">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridCheckBoxColumn>
                            <telerik:GridHyperLinkColumn DataNavigateUrlFields="CourseId" 
                                DataNavigateUrlFormatString="../EditCourse.aspx?CourseId={0}" 
                                DataTextField="تعديل" FilterControlAltText="Filter column column" 
                                HeaderText="تعديل" Text="تعديل" UniqueName="column">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridHyperLinkColumn>
                            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                ConfirmDialogType="RadWindow" ConfirmText="هل انت متأكد؟" 
                                ConfirmTitle="تحـــزير" FilterControlAltText="Filter DeleteColumn column" 
                                HeaderText="حذف" Text="حذف" UniqueName="DeleteColumn">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle CssClass="MyImageButton" HorizontalAlign="Center" />
                            </telerik:GridButtonColumn>
                            <telerik:GridHyperLinkColumn DataTextField="الحجز" 
                                FilterControlAltText="Filter column1 column" HeaderText="الحجز" Text="الحجز" 
                                UniqueName="column1">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridHyperLinkColumn>
                            <telerik:GridHyperLinkColumn DataTextField="السداد" 
                                FilterControlAltText="Filter column2 column" HeaderText="السداد" Text="السداد" 
                                UniqueName="column2">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridHyperLinkColumn>
                        </Columns>
                        <EditFormSettings>
                            <FormTableStyle BackColor="White" CellPadding="2" CellSpacing="0" 
                                Height="110px" />
                            <FormMainTableStyle BackColor="White" CellPadding="3" CellSpacing="0" 
                                Width="100%" />
                            <FormCaptionStyle CssClass="EditFormHeader" />
                            <FormTableItemStyle Wrap="False" />
                            <FormTableAlternatingItemStyle Wrap="False" />
                            <FormTableButtonRowStyle CssClass="EditFormButtonRow" HorizontalAlign="Right" />
                            <EditColumn ButtonType="ImageButton" CancelText="Cancel Edit" 
                                UniqueName="EditCommandColumn1">
                            </EditColumn>
                            <FormTableStyle BackColor="White" CellPadding="2" CellSpacing="0" 
                                Height="110px" />
                            <FormMainTableStyle BackColor="White" CellPadding="3" CellSpacing="0" 
                                GridLines="None" Width="100%" />
                            <FormCaptionStyle CssClass="EditFormHeader" />
                            <FormTableItemStyle Wrap="False" />
                            <FormTableAlternatingItemStyle Wrap="False" />
                            <FormTableButtonRowStyle CssClass="EditFormButtonRow" HorizontalAlign="Right" />
                            <PopUpSettings Modal="True" />
                        </EditFormSettings>
                        <PagerStyle FirstPageToolTip="الصفحه الاولي" LastPageToolTip="الصفحه الاخيره" NextPagesToolTip="الصفحات التاليه"
                            NextPageToolTip="الصفحه التاليه" PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}."
                            PageSizeLabelText="حجم الصفحه:" PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="لصفحه السابقه" />
                    </MasterTableView>
                    <PagerStyle FirstPageToolTip="الصفحة الاولي" LastPageToolTip="الصفحه الاخيره" NextPagesToolTip="الصفحات التاليه"
                        NextPageToolTip="الصفحات التاليه" PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;صفحه &lt;strong&gt;{0}&lt;/strong&gt; من &lt;strong&gt;{1}&lt;/strong&gt;, عناصر &lt;strong&gt;{2}&lt;/strong&gt; الي &lt;strong&gt;{3}&lt;/strong&gt; من &lt;strong&gt;{5}&lt;/strong&gt;."
                        PageSizeLabelText="حجم الصفحه" PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="الصفحه السابقه" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                    <FilterMenu EnableImageSprites="False">
                    </FilterMenu>
                    <HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default">
                    </HeaderContextMenu>
                </telerik:RadGrid>
                <telerik:RadNotification ID="RadNotificationInfo" runat="server" AutoCloseDelay="0"
                    EnableRoundedCorners="True" OnClientHidden="hideModalDiv" OnClientShowing="showModalDiv"
                    Position="Center" Skin="Default" Animation="Fade" AnimationDuration="1000" Width="400px">
                </telerik:RadNotification>
                <telerik:RadWindowManager ID="RadWindowManagerEdit" runat="server">
                </telerik:RadWindowManager>
            </telerik:RadAjaxPanel>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/AATSWEB.mdb" SelectCommand="Select CourseId,
CourseName,
Courseremark,
Format(StartDate, 'dd/MM/yyyy') AS StartDate,
Format(EndDate, 'dd/MM/yyyy') AS EndDate,
Price,
ShowOnline
From TBLCourses"
                OnSelected="DSData_Selected">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>
