<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewConcilor.ascx.cs"
    Inherits="ViewConcilor" %>
<style type="text/css">
    .rlvEditTable
    {
        width: 208px;
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
        text-align: center;
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
        <td>
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanelEdit" runat="server" />
            <telerik:RadAjaxPanel ID="RadAjaxPanelEdit" runat="server">
                <telerik:RadAjaxManager ID="RadAjaxManagerEdit" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanelEdit">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="RadGridEdit">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="RadListViewViewer" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                </telerik:RadAjaxManager>
                <telerik:RadListView ID="RadListViewViewer" runat="server" AllowMultiFieldSorting="True"
                    AllowPaging="True" DataKeyNames="id" DataSourceID="DSData" AllowCustomPaging="True"
                    AllowCustomSorting="True" AllowMultiItemSelection="True" AllowNaturalSort="True">
                    <LayoutTemplate>
                        <div class="RadListView RadListViewFloated RadListView_Default">
                            <div class="rlvFloated">
                                <div id="itemPlaceholder" runat="server">
                                </div>
                            </div>
                            <telerik:RadDataPager ID="RadDataPager1" runat="server">
                                <Fields>
                                    <telerik:RadDataPagerButtonField FieldType="FirstPrev" />
                                    <telerik:RadDataPagerButtonField FieldType="NextLast" />
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
                       <div class="rlvIEdit" style="margin: 10px; ">
                            <table cellspacing="0" class="rlvEditTable" dir="rtl" style="height: 292px;">
                                <tr>
                                    <td bgcolor="Gray" class="style2" colspan="2" style="border: 10pt solid white; text-align: center">
                                        <asp:Image ID="img" runat="server" BackColor="White" BorderColor="White" BorderWidth="2px"
                                            Height="150px" ImageUrl='<%# Eval("cpic", "../../CourseFiles/Concilor/{0}") %>'
                                            Width="150px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top" colspan="2" style="text-align: center">
                                        <asp:Label ID="lblname" runat="server" Text='<%# Eval("cname") %>' ForeColor="#003300" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" valign="top">
                                        <asp:Label ID="cityLabel2" runat="server" Text="الدولة-المدينة :" Font-Bold="True"
                                            ForeColor="Blue"></asp:Label>
                                    </td>
                                    <td class="style5" valign="top">
                                        <asp:Label ID="lblcity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style4" align="right" valign="top" colspan="2">
                                        <asp:Label ID="lbltel" runat="server" Text='<%# Eval("tat") %>' ForeColor="#003300" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <div class="RadListView RadListView_Default">
                            <div class="rlvEmpty">
                                There are no items to be displayed.</div>
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
                SelectCommand="SELECT [id], [cname], [viewpage], [cpic], [date_entry], [city], [tat] FROM [Concilor]
Where viewpage = true">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>
