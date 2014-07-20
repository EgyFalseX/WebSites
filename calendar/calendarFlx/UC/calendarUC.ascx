<%@ Control Language="C#" AutoEventWireup="true" CodeFile="calendarUC.ascx.cs" Inherits="calendarUC" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
   <telerik:RadScheduler 
   ID="RadScheduler1" 
   runat="server" 
   DataEndField="End" 
   DataKeyField="ID" 
   DataRecurrenceField="RecurrenceRule" 
   DataRecurrenceParentKeyField="RecurrenceParentID" 
   DataSourceID="CalDataSource" 
   DataStartField="Start" 
   DataSubjectField="Subject" Culture="ar-EG" EnableTheming="True" 
    Height="603px" SelectedView="WeekView" Skin="Telerik" 
    ToolTip="CalFlx by FalseX[E-E-Soft]">
       <Localization AdvancedAllDayEvent="كل احداث اليوم" 
           AdvancedCalendarCancel="الغاء" AdvancedCalendarOK="موافق" 
           AdvancedCalendarToday="اليوم" AdvancedDaily="يومي" AdvancedDay="يوم" 
           AdvancedDays="ايام" AdvancedDescription="الموضوع" 
           AdvancedEndAfter="ينتهي بعد :" AdvancedEndByThisDate="ينتهي في هذا اليوم :" 
           AdvancedEvery="كل" AdvancedEveryWeekday="كل اسبوع" AdvancedFirst="الاول" 
           AdvancedFourth="الرابع" AdvancedFrom="من :" AdvancedHourly="بالساعه" 
           AdvancedHours="ساعات" AdvancedLast="الاخير" AdvancedMaskDay="يوم" 
           AdvancedMaskWeekday="اسبوعي" AdvancedMaskWeekendDay="يوم العطله" 
           AdvancedMonthly="شهري" AdvancedMonths="شهور" AdvancedMoreDetails="تفاصيل" 
           AdvancedNoEndDate="لا تاريخ نهايه" AdvancedOccurrences="الحوادث" 
           AdvancedOf="من" AdvancedOfEvery="من كل" AdvancedRange="مجموعة من تكرار :" 
           AdvancedRecurEvery="تتكرر كل" AdvancedRecurrence="تكرار :" 
           AdvancedRecurringAppointment="تعيين المتكررة" 
           AdvancedReset="إعادة الاستثناءات القائمة" AdvancedSecond="الثاني" 
           AdvancedThe="ال" AdvancedThird="الثالث" AdvancedTo="الي: " 
           AdvancedWeekly="اسبوعي" AdvancedWeeks="اسابيع" AdvancedYearly="سنوي" 
           AllDay="كل اليوم" Cancel="الغاء" ConfirmCancel="الغاء" 
           ConfirmDeleteText="هل تريد ان تحذف؟" ConfirmDeleteTitle="تحزير الحذف" 
           ConfirmOK="موافق" ConfirmRecurrenceDeleteOccurrence="حذف هذا فقط" 
           ConfirmRecurrenceDeleteSeries="حذف هذه المجموعه" 
           ConfirmRecurrenceDeleteTitle="حذف موعد متكرر" 
           ConfirmRecurrenceEditOccurrence="فقط تحرير هذا التكرار." 
           ConfirmRecurrenceEditSeries="تحرير السلسلة." 
           ConfirmRecurrenceEditTitle="تحرير موعد متكرر" 
           ConfirmRecurrenceMoveOccurrence="تتحرك إلا هذا التكرار." 
           ConfirmRecurrenceMoveSeries="نقل السلسلة." 
           ConfirmRecurrenceMoveTitle="نقل موعد متكرر" 
           ConfirmRecurrenceResizeOccurrence="تغيير حجم هذا التكرار فقط." 
           ConfirmRecurrenceResizeSeries="تغيير حجم السلسلة." 
           ConfirmRecurrenceResizeTitle="تغيير حجم موعد متكرر" HeaderDay="يوم" 
           HeaderMonth="شهر" HeaderNextDay="اليوم التالي" HeaderPrevDay="اليوم السابق" 
           HeaderTimeline="الجدول الزمني" HeaderToday="اليوم" HeaderWeek="اسبوع" 
           Insert="اضافه" Show24Hours="اظهار 24 ساعه" ShowAdvancedForm="تفاصيل" 
           ShowBusinessHours="اظهار ساعات العمل" ShowMore="عرض اكثر" Update="تحديث" />
   </telerik:RadScheduler>
        <asp:AccessDataSource 
            ID="CalDataSource" 
            runat="server" 
            DataFile="../App_Data/calendar.mdb"
            SelectCommand="SELECT * FROM [calendarData]" 
            DeleteCommand="DELETE FROM [calendarData] WHERE [ID] = ?" 
            InsertCommand="INSERT INTO [calendarData] ([Subject], [Start], [End], [RecurrenceRule], [RecurrenceParentID]) VALUES (?, ?, ?, ?, ?)" 
            UpdateCommand="UPDATE [calendarData] SET [Subject] = ?, [Start] = ?, [End] = ?, [RecurrenceRule] = ?, [RecurrenceParentID] = ? WHERE [ID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Start" Type="DateTime" />
                <asp:Parameter Name="End" Type="DateTime" />
                <asp:Parameter Name="RecurrenceRule" Type="String" />
                <asp:Parameter Name="RecurrenceParentID" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>              
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Start" Type="DateTime" />
                <asp:Parameter Name="End" Type="DateTime" />
                <asp:Parameter Name="RecurrenceRule" Type="String" />
                <asp:Parameter Name="RecurrenceParentID" Type="Int32" />
            </InsertParameters>
        </asp:AccessDataSource>


