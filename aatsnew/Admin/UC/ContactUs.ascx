<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUs.ascx.cs" Inherits="ContactUs" %>
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
                <telerik:RadGrid ID="RadGridEdit" GridLines="None" runat="server" AllowAutomaticDeletes="True"
                    PageSize="20" AllowPaging="True" AllowFilteringByColumn="True" AutoGenerateColumns="False"
                    Culture="ar-EG" CellSpacing="0" ShowGroupPanel="True" ShowStatusBar="True" OnItemDeleted="RadGridEdit_ItemDeleted"
                    DataSourceID="DSData" ShowFooter="True" EnableTheming="True" OnItemDataBound="RadGridEdit_ItemDataBound"
                    EnableHeaderContextAggregatesMenu="True" EnableHeaderContextFilterMenu="True"
                    EnableHeaderContextMenu="True" onitemupdated="RadGridEdit_ItemUpdated" 
                    AllowAutomaticUpdates="True" AllowSorting="True">
                    <GroupingSettings CollapseTooltip="غلق حزمه" ExpandTooltip="فتح حزمه" GroupContinuedFormatString="استكمال الجزمه من الصفحه السابقه"
                        GroupContinuesFormatString="الحزمه ستستكمل في الصفحه القادمه" GroupSplitDisplayFormat="عرض {0} of {1} عناصر."
                        UnGroupButtonTooltip="اسحب هنا لالغاء الحزمه" UnGroupTooltip="اسحب خارج الشريط لالغاء الحزمه" />
                    <SortingSettings SortedAscToolTip="مرتبه تصاعدي" SortedDescToolTip="مرتبه تنازلي"
                        SortToolTip="اضغط هنا للترتيب" />
                    <ExportSettings ExportOnlyData="True" FileName="GridDataExport" IgnorePaging="True"
                        OpenInNewWindow="True">
                        <Pdf Author="E-E-Soft" Creator="FalseX" Producer="FalseX" />
                    </ExportSettings>
                    <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" 
                        AllowDragToGroup="True">
                        <Selecting AllowRowSelect="True" />
                        <ClientMessages ColumnResizeTooltipFormatString="عرض: &lt;strong&gt;{0}&lt;/strong&gt; &lt;em&gt;نقط&lt;/em&gt;"
                            DragToGroupOrReorder="اسحب لتصنع حزمه او أعادة الترتيب" DragToResize="اسحب لتغيير حجم"
                            DropHereToReorder="اسحب هنا لأعادة الترتيب" PagerTooltipFormatString="صفحه &lt;strong&gt;{0}&lt;/strong&gt; من &lt;strong&gt;{1}&lt;/strong&gt;" />
                        <Resizing AllowResizeToFit="True" EnableRealTimeResize="True" ResizeGridOnColumnResize="True" />
                    </ClientSettings>
                    <GroupPanel Text="اسحب راس عمود ثم افلت هنا لأنشاء حزمه من هذا العمود">
                    </GroupPanel>
                    <MasterTableView CommandItemDisplay="TopAndBottom" DataKeyNames="addno" HorizontalAlign="NotSet"
                        Width="100%" Dir="RTL" NoDetailRecordsText="لا يوجد عنصر داخلي للعرض" NoMasterRecordsText="لا يوجد عنصر للعرض"
                        DataSourceID="DSData" EnableHeaderContextAggregatesMenu="True" 
                        Caption="بيانات راسلنا">
                        <CommandItemSettings ExportToPdfText="تصدير الي PDF" AddNewRecordText="اضافة جديد"
                            ExportToCsvText="تصدير الي CSV" ExportToExcelText="تصدير الي Excel" ExportToWordText="تصدير الي Word"
                            RefreshText="تحديث" ShowExportToCsvButton="True" ShowExportToExcelButton="True"
                            ShowExportToPdfButton="True" ShowExportToWordButton="True" ShowAddNewRecordButton="False" />
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn FilterControlAltText="Filter addno column"
                                UniqueName="addno" Display="False" ReadOnly="True" Visible="False" HeaderText="كود الرساله"
                                SortExpression="addno">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="coname" FilterControlAltText="Filter coname column"
                                HeaderText="الاسم" SortExpression="coname" UniqueName="coname">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridDropDownColumn DataField="sefaid" FilterControlAltText="Filter sefaid column"
                                HeaderText="الصفه" SortExpression="sefaid" UniqueName="sefaid" 
                                DataSourceID="DScontype" ListTextField="contype" 
                                ListValueField="contypeid" EnableEmptyListItem="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridDropDownColumn>
                            <telerik:GridDropDownColumn DataField="contypeid" FilterControlAltText="Filter contypeid column"
                                HeaderText="نوع الرساله" SortExpression="contypeid" UniqueName="contypeid" 
                                DataSourceID="DSsefa" ListTextField="sefa" ListValueField="sefaid" 
                                EnableEmptyListItem="True">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridDropDownColumn>
                            <telerik:GridBoundColumn DataField="tel" FilterControlAltText="Filter tel column"
                                HeaderText="التليفون" SortExpression="tel" UniqueName="tel">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="mail" FilterControlAltText="Filter mail column"
                                HeaderText="البريد" SortExpression="mail" UniqueName="mail">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridBoundColumn>
                            <telerik:GridDateTimeColumn DataField="condate" DataFormatString="{0:d/M/yyyy}" 
                                DataType="System.DateTime" EditDataFormatString="d/M/yyyy" 
                                FilterControlAltText="Filter condate column" HeaderText="التاريخ" 
                                ReadOnly="True" SortExpression="condate" UniqueName="condate">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridDateTimeColumn>
                            <telerik:GridHTMLEditorColumn DataField="massage" FilterControlAltText="Filter massage column"
                                HeaderText="الرساله" SortExpression="massage" UniqueName="massage">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridHTMLEditorColumn>
                            <telerik:GridHTMLEditorColumn DataField="rply" FilterControlAltText="Filter rply column"
                                HeaderText="الرد" SortExpression="rply" UniqueName="rply">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridHTMLEditorColumn>
                            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn"
                                HeaderText="تعديل" CancelText="الغاء" EditText="تعديل" InsertText="اضافه" UpdateText="تحديث">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </telerik:GridEditCommandColumn>
                            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow"
                                ConfirmText="هل انت متأكد؟" ConfirmTitle="تحـــزير" FilterControlAltText="Filter DeleteColumn column"
                                HeaderText="حذف" Text="حذف" UniqueName="DeleteColumn">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle CssClass="MyImageButton" HorizontalAlign="Center" />
                            </telerik:GridButtonColumn>
                        </Columns>
                        <EditFormSettings>
                            <FormTableStyle BackColor="White" CellPadding="2" CellSpacing="0" Height="110px" />
                            <FormMainTableStyle BackColor="White" CellPadding="3" CellSpacing="0" Width="100%" />
                            <FormCaptionStyle CssClass="EditFormHeader" />
                            <FormTableItemStyle Wrap="False" />
                            <FormTableAlternatingItemStyle Wrap="False" />
                            <FormTableButtonRowStyle CssClass="EditFormButtonRow" HorizontalAlign="Right" />
                            <EditColumn ButtonType="ImageButton" CancelText="Cancel Edit" UniqueName="EditCommandColumn1">
                            </EditColumn>
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
                <asp:CheckBox ID="CBsendit" runat="server" AutoPostBack="True" 
                    Text="ارسال رسالة رد بعد الحفظ" />
            </telerik:RadAjaxPanel>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/ABOUT.mdb"
                SelectCommand="SELECT [addno], [coname], [sefaid], [contypeid], [tel], [mail], [massage], [condate], [rply] FROM [contact]"
                OnSelected="DSData_Selected" DeleteCommand="DELETE FROM [contact] WHERE [addno] = ?"
                InsertCommand="INSERT INTO [contact] ([addno], [coname], [sefaid], [contypeid], [tel], [mail], [massage], [condate], [rply]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
                
                
                UpdateCommand="UPDATE [contact] SET [coname] = @coname, [sefaid] = @sefaid, [contypeid] = @contypeid, [tel] = @tel, [mail] = @mail, [massage] = @massage, [rply] = @rply WHERE [addno] = @addno" 
                onupdated="DSData_Updated">
                <DeleteParameters>
                    <asp:Parameter Name="addno" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="addno" Type="Int32" />
                    <asp:Parameter Name="coname" Type="String" />
                    <asp:Parameter Name="sefaid" Type="Byte" />
                    <asp:Parameter Name="contypeid" Type="Byte" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="mail" Type="String" />
                    <asp:Parameter Name="massage" Type="String" />
                    <asp:Parameter Name="condate" Type="DateTime" />
                    <asp:Parameter Name="rply" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="coname" Type="String" />
                    <asp:Parameter Name="sefaid" Type="Byte" />
                    <asp:Parameter Name="contypeid" Type="Byte" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="mail" Type="String" />
                    <asp:Parameter Name="massage" Type="String" />
                    <asp:Parameter Name="rply" Type="String" />
                    <asp:Parameter Name="addno" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScontype" runat="server" DataFile="~/App_Data/ABOUT.mdb"
                SelectCommand="SELECT [contypeid], [contype] FROM [contype]"
                OnSelected="DSData_Selected">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSsefa" runat="server" DataFile="~/App_Data/ABOUT.mdb"
                SelectCommand="SELECT [sefaid], [sefa] FROM [sefa]"
                OnSelected="DSData_Selected">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>
