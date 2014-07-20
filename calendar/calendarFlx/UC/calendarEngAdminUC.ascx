<%@ Control Language="C#" AutoEventWireup="true" CodeFile="calendarEngAdminUC.ascx.cs" Inherits="calendarEngAdminUC" %>
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
   DataSubjectField="Subject" EnableTheming="True" 
    Height="603px" SelectedView="WeekView" Skin="Telerik" 
    ToolTip="CalFlx by FalseX[E-E-Soft]">
       <Localization 
           AdvancedDays="ايام" 
           HeaderTimeline="School Calendar" />
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


