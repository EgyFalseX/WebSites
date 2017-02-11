<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="AddMessage.aspx.cs" Inherits="AddMessage" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center">
                <dx:ASPxFormLayout ID="MainLayout" runat="server" EnableTheming="True" Theme="iOS" Width="600px" RightToLeft="True">
                    <Items>
                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxValidationSummary ID="validator" runat="server" ValidationGroup="gv">
                                    </dx:ASPxValidationSummary>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="المهمة">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cbtaskid" runat="server" DataSourceID="dstasks" TextField="task" ValueField="taskid" Width="500px" ValueType="System.Int32">
                                        <Columns>
                                            <dx:ListBoxColumn FieldName="task" Name="الاسم" Caption="name" />
                                            <dx:ListBoxColumn FieldName="taskdataefrom" Name="from" Caption="من" />
                                            <dx:ListBoxColumn FieldName="taskdataeto" Name="to" Caption="الي" />
                                        </Columns>
                                        <ValidationSettings ValidationGroup="gv">
                                            <RequiredField ErrorText="اختر مهامة" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:AccessDataSource ID="dstasks" runat="server" DataFile="../App_Data/team.mdb" SelectCommand="SELECT taskid, task, Format(taskdataefrom, 'd/M/yyyy') AS taskdataefrom, Format(taskdataeto, 'd/M/yyyy') AS taskdataeto FROM tasks"></asp:AccessDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="التقرير">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxMemo ID="tbtaskdonedetails" runat="server" Height="250px" Width="600px">
                                        <ValidationSettings ValidationGroup="gv">
                                            <RequiredField ErrorText="ادخل التقرير" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="المرفقات">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css"
                                CssPostfix="DevEx" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete"
                                ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css"
                                Width="280px">
                                <validationsettings generalerrortext="فشل التحميل بسبب خطــاء داخلي" maxfilesize="409600"
                                    
                                    maxfilesizeerrortext="الملف اكبر من 400 كيلوبايت برجاء رفع ملف اصغر من 400 كيلوبايت" multiselectionerrortext="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" notallowedfileextensionerrortext="امتداد الملف غير مسموح به">
                    </validationsettings>
                    <AddButton Text="اضافه">
                    </AddButton>
                    <BrowseButton Text="اختار ملف">
                    </BrowseButton>
                    <RemoveButton Text="حذف">
                    </RemoveButton>
                    <UploadButton Text="بداء التحميــــــــــل">
                    </UploadButton>
                    <CancelButton Text="الغــــــاء">
                    </CancelButton>
                    <AdvancedModeSettings TemporaryFolder="App_Data\UploadTemp\" />
                </dx:ASPxUploadControl>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="ارسال" ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxButton ID="btnSend" runat="server" OnClick="btnSend_Click" Text="ارسال" ValidationGroup="gv" Width="150px">
                                    </dx:ASPxButton>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                    <SettingsItemCaptions HorizontalAlign="Right" Location="Top" />
                </dx:ASPxFormLayout>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxLabel ID="lblResult" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
</asp:Content>

