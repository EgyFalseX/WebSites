<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="CategoryViewer.aspx.cs" Inherits="CategoryViewer" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFileManager" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style2
        {
            width: 100px;
        }
        .auto-style3
        {
            width: 100%;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <dx:ASPxFileManager ID="ASPxFileManagerMain" runat="server" Font-Bold="False" Font-Size="10pt" RightToLeft="True">
        <ClientSideEvents SelectedFileOpened="function(s, e) {
ViewerPnl.PerformCallback(e.file.GetFullName());
ViewerPopup.Show();
}" />
        <settings initialfolder="الرئيسية" rootfolder="~\ImageGallary\Assets\" thumbnailfolder="~\ImageGallary\Thumb\" />
        <SettingsEditing AllowCreate="True" AllowDelete="True" AllowMove="True" AllowRename="True" />
        <SettingsToolbar ShowDownloadButton="True" />
        <SettingsUpload>
            <ValidationSettings GeneralErrorText="خطاء في أرسال الملف" NotAllowedFileExtensionErrorText="امتداد غير مسموح به">
            </ValidationSettings>
        </SettingsUpload>
        <SettingsLoadingPanel Text="جاري التحميل&amp;hellip;" />
        <SettingsDataSource FileBinaryContentFieldName="FileBinary" IsFolderFieldName="IsFolder" KeyFieldName="id" LastWriteTimeFieldName="LastWrite" NameFieldName="FileName" ParentKeyFieldName="ParentID" />
    </dx:ASPxFileManager>
    <asp:AccessDataSource ID="dsData" runat="server" DataFile="~/App_Data/GallaryData.mdb" DeleteCommand="DELETE FROM [ImgaeData] WHERE [id] = ?" InsertCommand="INSERT INTO [ImgaeData] ([FileBinary], [IsFolder], [LastWrite], [FileName], [ParentID]) VALUES (?, ?, ?, ?, ?)" SelectCommand="SELECT [id], [FileBinary], [IsFolder], [LastWrite], [FileName], [ParentID] FROM [ImgaeData]" UpdateCommand="UPDATE [ImgaeData] SET [FileBinary] = ?, [IsFolder] = ?, [LastWrite] = ?, [FileName] = ?, [ParentID] = ? WHERE [id] = ?">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FileBinary" Type="String" />
            <asp:Parameter Name="IsFolder" Type="Boolean" />
            <asp:Parameter Name="LastWrite" Type="DateTime" />
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="ParentID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FileBinary" Type="String" />
            <asp:Parameter Name="IsFolder" Type="Boolean" />
            <asp:Parameter Name="LastWrite" Type="DateTime" />
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="ParentID" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <dx:ASPxPopupControl ID="ASPxPopupControlViewer" runat="server" ClientInstanceName="ViewerPopup" HeaderText="Viewer" Modal="True" AllowDragging="True" AllowResize="True" ScrollBars="Auto" Style="text-align: center" ViewStateMode="Enabled" PopupHorizontalAlign="WindowCenter" MaxHeight="700px" MaxWidth="1024px">
        <ClientSideEvents Shown="function(s, e) {
s.SetHeight(ViewerImg.GetHeight() + 50);
s.SetWidth(ViewerImg.GetWidth() + 50);
}" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                 <div id="PopupControlDivContainer">
                <table align="center" class="auto-style3">
                    <tr>
                        <td>
                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanelViewer" runat="server" ClientInstanceName="ViewerPnl" OnCallback="ASPxCallbackPanelViewer_Callback">
                                <PanelCollection>
                                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxImage ID="ASPxImageViewer" runat="server" ClientInstanceName="ViewerImg">
                                        </dx:ASPxImage>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                        </td>
                    </tr>
                </table>
            </div>
                
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

