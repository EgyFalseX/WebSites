<%@ Page Title="" Language="C#" MasterPageFile="~/ImageGallary/master.master" AutoEventWireup="true" CodeFile="CategoryViewer[Database].aspx.cs" Inherits="CategoryViewer" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxFileManager" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <dx:ASPxFileManager ID="ASPxFileManagerMain" runat="server" DataSourceID="dsData" Font-Bold="False" Font-Size="10pt" RightToLeft="True">
        <ClientSideEvents SelectedFileOpened="function(s, e) {
        e.file.Download();
        e.processOnServer = false;
}" />
        <Settings ThumbnailFolder="~\ImageGallary\Thumb\" />
        <SettingsEditing AllowCreate="True" AllowDelete="True" AllowMove="True" AllowRename="True" />
        <SettingsToolbar ShowDownloadButton="True" />
        <SettingsUpload UseAdvancedUploadMode="True">
            <ValidationSettings GeneralErrorText="خطاء في أرسال الملف" NotAllowedFileExtensionErrorText="امتداد غير مسموح به">
            </ValidationSettings>
        </SettingsUpload>
        <SettingsLoadingPanel Text="جاري التحميل&amp;hellip;" />
        <SettingsDataSource FileBinaryContentFieldName="Data" IsFolderFieldName="IsFolder" KeyFieldName="Id" LastWriteTimeFieldName="LastWriteTime" NameFieldName="Name" ParentKeyFieldName="ParentId" />
    </dx:ASPxFileManager>
    <asp:AccessDataSource ID="dsData" runat="server" DataFile="~/App_Data/GallaryData.mdb" DeleteCommand="DELETE FROM [FileSystem] WHERE [Id] = ?" InsertCommand="INSERT INTO [FileSystem] ([Name], [IsFolder], [ParentId], [Data], [LastWriteTime]) VALUES (?, ?, ?, ?, ?)" SelectCommand="SELECT * FROM [FileSystem]" UpdateCommand="UPDATE [FileSystem] SET [Name] = ?, [IsFolder] = ?, [ParentId] = ?, [Data] = ?, [LastWriteTime] = ? WHERE [Id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="IsFolder" Type="Boolean" />
            <asp:Parameter Name="ParentId" Type="Int32" />
            <asp:Parameter DbType="Object" Name="Data" />
            <asp:Parameter Name="LastWriteTime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="IsFolder" Type="Boolean" />
            <asp:Parameter Name="ParentId" Type="Int32" />
            <asp:Parameter DbType="Object" Name="Data" />
            <asp:Parameter Name="LastWriteTime" Type="DateTime" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" AllowResize="True"
        CloseAction="CloseButton" ContentUrl="Viewer.aspx" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="700px"
        Height="500px"
        HeaderText="Viewer" ClientInstanceName="MsgPopupControl" EnableHierarchyRecreation="True" PopupAnimationType="Fade" RightToLeft="True" ScrollBars="Auto" Modal="True" ShowPageScrollbarWhenModal="True" LoadingPanelText="جاري التحميل&amp;hellip;">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True"></dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

