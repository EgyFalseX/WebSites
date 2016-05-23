<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewReservation.ascx.cs" Inherits="ViewReservation" %>
<style type="text/css">
    .style1 {
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
                    AllowAutomaticDeletes="True" AllowAutomaticInserts="True" PageSize="20"
                    AllowAutomaticUpdates="True" AllowPaging="True"
                    AllowFilteringByColumn="True" AutoGenerateColumns="False"
                    Culture="ar-EG" CellSpacing="0" ShowGroupPanel="True" ShowStatusBar="True"
                    OnItemDeleted="RadGridEdit_ItemDeleted"
                    OnItemInserted="RadGridEdit_ItemInserted"
                    OnItemUpdated="RadGridEdit_ItemUpdated" DataSourceID="DSData"
                    ShowFooter="True" EnableTheming="True"
                    OnItemDataBound="RadGridEdit_ItemDataBound"
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
                    <MasterTableView CommandItemDisplay="TopAndBottom" DataKeyNames="TraineeID" HorizontalAlign="NotSet"
                        Width="100%" Dir="RTL" NoDetailRecordsText="لا يوجد عنصر داخلي للعرض"
                        NoMasterRecordsText="لا يوجد عنصر للعرض" DataSourceID="DSData"
                        EnableHeaderContextAggregatesMenu="True"
                        Caption="عرض حجز الدورات التدريبية">
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
                            <telerik:GridBoundColumn DataField="CourseId" FilterControlAltText="Filter column column" HeaderText="كود الدورة" SortExpression="CourseId" UniqueName="column">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CourseName"
                                FilterControlAltText="Filter CourseName column" HeaderText="اسم الدوره"
                                ReadOnly="True" SortExpression="CourseName" UniqueName="CourseName">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TraineeID"
                                FilterControlAltText="Filter TraineeID column"
                                UniqueName="TraineeID" Display="False" ReadOnly="True" Visible="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="TraineeName"
                                FilterControlAltText="Filter TraineeName column"
                                HeaderText="اسم المتدرب" SortExpression="TraineeName"
                                UniqueName="TraineeName">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Nationality"
                                FilterControlAltText="Filter Nationality column" HeaderText="الجنسية"
                                ReadOnly="True" SortExpression="Nationality" UniqueName="Nationality">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Mobile"
                                FilterControlAltText="Filter Mobile column" HeaderText="الجوال"
                                SortExpression="Mobile" UniqueName="Mobile">
                                <FooterStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email"
                                FilterControlAltText="Filter Email column" HeaderText="البريد الاليكتروني"
                                SortExpression="Email" UniqueName="Email">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Address"
                                FilterControlAltText="Filter Address column" HeaderText="العنوان"
                                SortExpression="Address" UniqueName="Address">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn DataField="TimeIn" FilterControlAltText="Filter TimeIn column"
                                HeaderText="تاريخ الحجز" ReadOnly="True" SortExpression="TimeIn"
                                UniqueName="TimeIn" DataType="System.DateTime"
                                DataFormatString="{0:d/M/yyyy}" EditDataFormatString="d/M/yyyy">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridDateTimeColumn>
                            <telerik:GridBoundColumn DataField="mony"
                                FilterControlAltText="Filter mony column" HeaderText="المبلغ"
                                SortExpression="mony" UniqueName="mony">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="accname"
                                FilterControlAltText="Filter accname column"
                                HeaderText="صاحب الحساب" SortExpression="accname"
                                UniqueName="accname">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridDropDownColumn DataField="countryId"
                                FilterControlAltText="Filter countryId column" HeaderText="دولة الاقامة"
                                ListTextField="country" ListValueField="countryId" SortExpression="countryId"
                                UniqueName="countryId" DataSourceID="DSCdcountry"
                                EnableEmptyListItem="True" DataType="System.Int32" Display="False"
                                Visible="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridDropDownColumn>
                            <telerik:GridBoundColumn DataField="country"
                                FilterControlAltText="Filter country column" HeaderText="دولة الاقامة"
                                ReadOnly="True" SortExpression="country" UniqueName="country">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="City" FilterControlAltText="Filter City column" HeaderText="المدينة" SortExpression="City" UniqueName="City">
                            </telerik:GridBoundColumn>
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
                    OnClientHidden="hideModalDiv" OnClientShowing="showModalDiv"
                    Position="Center" Skin="Default" Animation="Fade" AnimationDuration="1000"
                    Width="400px">
                </telerik:RadNotification>
                <telerik:RadWindowManager ID="RadWindowManagerEdit" runat="server">
                </telerik:RadWindowManager>
            </telerik:RadAjaxPanel>
            <asp:AccessDataSource ID="DSData"
                runat="server" OnInserting="DSData_Inserting"
                DataFile="~/App_Data/AATSWEB.mdb"
                SelectCommand="SELECT TBLTraineeLearnEnglish.TraineeID, TBLTraineeLearnEnglish.TraineeName, TBLTraineeLearnEnglish.NameInEnglish, TBLTraineeLearnEnglish.GenderID, TBLTraineeLearnEnglish.NationalityId, TBLTraineeLearnEnglish.Mobile, TBLTraineeLearnEnglish.tel, TBLTraineeLearnEnglish.Email, TBLTraineeLearnEnglish.City, TBLTraineeLearnEnglish.Address, TBLTraineeLearnEnglish.jobID, TBLTraineeLearnEnglish.OtherJob, TBLTraineeLearnEnglish.CertificateAddress, TBLTraineeLearnEnglish.MembershipTypeID, TBLTraineeLearnEnglish.MembershipNo, TBLTraineeLearnEnglish.REM, TBLTraineeLearnEnglish.UserName, TBLTraineeLearnEnglish.[password], TBLTraineeLearnEnglish.[image], TBLTraineeLearnEnglish.TraineeTypeId, TBLTraineeLearnEnglish.TimeIn, TBLTraineeLearnEnglish.mony, TBLTraineeLearnEnglish.accname, TBLTraineeLearnEnglish.CourseId, TBLTraineeLearnEnglish.countryId, TBLTraineeLearnEnglish.sdd, CdNationality.Nationality, CdGender.Gender, Cdcountry.country, MenuItem.ItemName AS CourseName FROM ((((TBLTraineeLearnEnglish INNER JOIN MenuItem ON TBLTraineeLearnEnglish.CourseId = MenuItem.ItemID) LEFT OUTER JOIN CdNationality ON TBLTraineeLearnEnglish.NationalityId = CdNationality.NationalityId) LEFT OUTER JOIN CdGender ON TBLTraineeLearnEnglish.GenderID = CdGender.GenderID) LEFT OUTER JOIN Cdcountry ON TBLTraineeLearnEnglish.countryId = Cdcountry.countryId) ORDER BY TBLTraineeLearnEnglish.TimeIn DESC"
                OnSelected="DSData_Selected" OnSelecting="DSData_Selecting"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSTBLCourses"
                runat="server" SelectCommand="SELECT [CourseId], [CourseName] FROM [TBLCourses]"
                DataFile="~/App_Data/AATSWEB.mdb"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCdcountry"
                runat="server" SelectCommand="Select countryId, country From Cdcountry"
                DataFile="~/App_Data/AATSWEB.mdb"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCdNationality"
                runat="server"
                SelectCommand="Select NationalityId, Nationality From CdNationality"
                DataFile="~/App_Data/AATSWEB.mdb"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DStd_starting1"
                runat="server"
                SelectCommand="SELECT [id_starting], [name_starting] FROM [td_starting1]"
                DataFile="~/App_Data/AATSWEB.mdb"></asp:AccessDataSource>
        </td>
    </tr>
</table>



