<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewTrainerShow.ascx.cs"
    Inherits="ViewTrainerShow" %>
<style type="text/css">
    .rlvEditTable
    {
        width: 268px;
    }
    .style2
    {
        height: 151px;
    }
    .rlvInput
    {
        text-align: center;
        margin: 2,2,2,2;
    }
    .style4
    {
        width: 92px;
    }
    .style5
    {
        text-align: right;
    }
</style>
<table align="center">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="LblTitle" runat="server" Text="مستشارو الاكاديمية" 
                Font-Names="Andalus" Font-Overline="False" Font-Size="XX-Large"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <div style="width: 500px">
                <table style="width: 332px">
                    <tr>
                        <td style="direction: rtl">
                            <telerik:RadComboBox ID="RCBItems" Runat="server" Width="200px" 
                                DataSourceID="DScd_Trainer_type" DataTextField="Trainer_type" 
                                DataValueField="Trainer_type_id">
                            </telerik:RadComboBox>
                        </td>
                        <td style="direction: rtl">
                            <asp:Label ID="Label1" runat="server" Text="اختر فئة المدربين : "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="direction: rtl">
                            <asp:CheckBox ID="CBAll" runat="server" Text="عرض الكــــل" TabIndex="1" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadButton ID="RBtnView" runat="server" Text="عرض" Width="200px" 
                                onclick="RBtnView_Click" TabIndex="2">
                            </telerik:RadButton>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadTextBox ID="tbSearch" Runat="server" TabIndex="3" Width="200px">
                            </telerik:RadTextBox>
                        </td>
                        <td style="direction: rtl">
                            <asp:Label ID="Label2" runat="server" Text="بحث عن اسم : "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadButton ID="btnNameSearch" runat="server" Text="بحث" Width="200px" 
                                onclick="btnNameSearch_Click" TabIndex="4">
                            </telerik:RadButton>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
            <asp:AccessDataSource ID="DScd_Trainer_type" runat="server" DataFile="~/App_Data/AATSWEB.mdb"
                SelectCommand="SELECT [Trainer_type_id], [Trainer_type] FROM [cd_Trainer_type]">
            </asp:AccessDataSource>
                        </td>
                    </tr>
                </table>
            </div>
            </td>
    </tr>
    <tr>
        <td>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanelEdit" runat="server" />
            <telerik:RadAjaxPanel ID="RadAjaxPanelEdit" runat="server">
                <telerik:RadAjaxManager ID="RadAjaxManagerEdit" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanelEdit">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="RadGridEdit">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadListViewViewer" />
                                <telerik:AjaxUpdatedControl ControlID="RBtnView" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                </telerik:RadAjaxManager>
                <telerik:RadListView ID="RadListViewViewer" runat="server" DataKeyNames="id" 
                    AllowPaging="True" DataSourceID="DSData" PageSize="6" TabIndex="5">
                    <LayoutTemplate>
                        <div class="RadListView RadListViewFloated RadListView_Default">
                            <div class="rlvFloated">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                            <telerik:RadDataPager ID="RadDataPager1" PageSize=5 runat="server">
                                <Fields>
                                    <telerik:RadDataPagerButtonField FieldType="FirstPrev" />
                                    <telerik:RadDataPagerButtonField FieldType="Numeric" />
                                    <telerik:RadDataPagerButtonField FieldType="NextLast" />
                                    <telerik:RadDataPagerPageSizeField PageSizeText="حجم الصفحه" />
                                </Fields>
                            </telerik:RadDataPager>
                            <div style="display: none">
                                <telerik:RadCalendar ID="rlvSharedCalendar" runat="server" RangeMinDate="<%#new DateTime(1900, 1, 1) %>"
                                    Skin="<%#Container.Skin %>" />
                            </div>
                            <div style="display: none">
                                <telerik:RadTimeView ID="rlvSharedTimeView" runat="server" Skin="<%# Container.Skin %>" />
                            </div>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="rlvIEdit" style="margin: 10px; height: 303px; width: 273px;">
                            <table cellspacing="0" class="rlvEditTable" dir="rtl" style="height: 292px;">
                                <tr>
                                    <td bgcolor="Gray" class="style2" colspan="2" style="border: 10pt solid white; text-align: center">
                                        <asp:Image ID="img" runat="server" BackColor="White" BorderColor="White" BorderWidth="2px"
                                            Height="150px" ImageUrl='<%# Eval("Trainepic", "../../CourseFiles/Trainer/{0}") %>'
                                            Width="150px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" align="right" valign="top">
                                        <asp:Label ID="cnameLabel2" runat="server" Text="الاسم:" Font-Bold="True" ForeColor="Blue"></asp:Label>
                                    </td>
                                    <td class="style5" valign="top">
                                        <asp:Label ID="lblname" runat="server" Text='<%# Eval("TrainerName") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" align="right" valign="top">
                                        <asp:Label ID="cityLabel2" runat="server" Text="الدولة - المدينة :" Font-Bold="True"
                                            ForeColor="Blue"></asp:Label>
                                    </td>
                                    <td class="style5" valign="top">
                                        <asp:Label ID="lblcity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" align="right" valign="top">
                                        <asp:Label ID="tatLabel2" runat="server" Text="التخصص : " Font-Bold="True" ForeColor="Blue"></asp:Label>
                                    </td>
                                    <td class="style5" valign="top">
                                        <asp:Label ID="lbltel" runat="server" Text='<%# Eval("tat") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div class="RadListView RadListView_Default">
                            <div class="rlvEmpty">
                                لا يوجد بيانات</div>
                        </div>
                    </EmptyDataTemplate>
                    <SelectedItemTemplate>
                        <div class="rlvISel">
                            <br />
                            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                            <br />
                            <asp:Label ID="cnameLabel" runat="server" Text='<%# Eval("cname") %>' />
                            <br />
                            <asp:CheckBox ID="viewpageCheckBox" runat="server" Checked='<%# Eval("viewpage") %>'
                                Enabled="false" />
                            <br />
                            <asp:Label ID="cpicLabel" runat="server" Text='<%# Eval("cpic") %>' />
                            <br />
                            <asp:Label ID="date_entryLabel" runat="server" Text='<%# Eval("date_entry") %>' />
                            <br />
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                            <br />
                            <asp:Label ID="tatLabel" runat="server" Text='<%# Eval("tat") %>' />
                        </div>
                    </SelectedItemTemplate>
                </telerik:RadListView>
                <telerik:RadWindowManager ID="RadWindowManagerEdit" runat="server">
                </telerik:RadWindowManager>
            </telerik:RadAjaxPanel>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/AATSWEB.mdb"
                SelectCommand="SELECT id, TrainerName, Trainer_type_id, viewpage, Trainepic, date_entry, city, tat,
(Select Trainer_type From cd_Trainer_type Where Trainer_type_id = Trainer_show.Trainer_type_id) AS Trainer_type
 FROM Trainer_show">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>
