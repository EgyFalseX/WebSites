<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="ProjectViewer.aspx.cs" Inherits="ProjectViewer" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/frsan.mdb" 
                DeleteCommand="DELETE FROM [studentall] WHERE autoid = ?" 
                InsertCommand="INSERT INTO [studentall] ([stid], [subjectid], [tsfeat], [winner], [Data_Path]) VALUES (?, ?, ?, ?, ?)" 
                SelectCommand="SELECT tblproject.projectid, tblproject.project, cdmonth.monthname, tblproject.yearname, tblproject.primg FROM (tblproject INNER JOIN cdmonth ON tblproject.monthid = cdmonth.monthid) ORDER BY tblproject.projectid desc" 
                UpdateCommand="UPDATE [studentall] SET [tsfeat] = ?, [winner] = ?, [Data_Path] = ?, [stid] = ?, [subjectid] =  ? WHERE autoid = ?">
                <DeleteParameters>
                    <asp:Parameter Name="autoid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="stid" Type="Int32" />
                    <asp:Parameter Name="subjectid" Type="Int32" />
                    <asp:Parameter Name="tsfeat" Type="Boolean" />
                    <asp:Parameter Name="winner" Type="Boolean" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="tsfeat" Type="Boolean" />
                    <asp:Parameter Name="winner" Type="Boolean" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="stid" Type="Int32" />
                    <asp:Parameter Name="subjectid" Type="Int32" />
                    <asp:Parameter Name="autoid" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <table align="center" class="auto-style1">
                <tr>
                    <td style="text-align: center">&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxDataView ID="ASPxDataViewMain" runat="server" AlwaysShowPager="True" DataSourceID="DSData" EmptyDataText="لا يوجد بيانات" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" LoadingPanelText="جاري التحميل&amp;hellip;" style="margin-bottom: 0px" Theme="iOS" Width="700px">
                            <ItemTemplate>
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" EnableTheming="True" RightToLeft="True" Theme="iOS" Font-Bold="False">
                                    <Items>
                                        <dx:LayoutItem Caption="المشروع" ColSpan="2" HorizontalAlign="Center">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Font-Size="Small" Text='<%# Eval("project") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="الشهر">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E3" runat="server" Font-Size="Small" Text='<%# Eval("monthname") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" RowSpan="2" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" Height="96px" ImageUrl='<%# Eval("primg", "ProjectPhoto/{0}") %>' Width="96px">
                                                    </dx:ASPxImage>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="السنة">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" Font-Size="Small" Text='<%# Eval("yearname") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="التفاصيل" HorizontalAlign="Right" VerticalAlign="Top">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E7" runat="server" Font-Size="Small" NavigateUrl='<%# Eval("projectid", "ProjectPageViewer.aspx?id={0}") %>' Text="التفاصيل" Theme="iOS" ImageUrl="~/frsan/images/Details.png">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <CaptionSettings VerticalAlign="Middle" />
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="المتقدمين" HorizontalAlign="Right" VerticalAlign="Middle">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E6" runat="server" Font-Size="Small" NavigateUrl='<%# Eval("projectid", "StudentViewer.aspx?id={0}") %>' Text="المتقدمين" Theme="iOS" ImageUrl="~/frsan/images/Requests.png">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <CaptionSettings VerticalAlign="Middle" />
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="التصفيات" HorizontalAlign="Right" VerticalAlign="Middle">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E5" runat="server" Font-Size="Small" NavigateUrl='<%# Eval("projectid", "studentallViewer.aspx?id={0}") %>' Text="التصفيات" Theme="iOS" ImageUrl="~/frsan/images/Tasfyat.png">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <CaptionSettings VerticalAlign="Middle" />
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="التصويت" HorizontalAlign="Right" VerticalAlign="Middle">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E8" runat="server" EnableTheming="True" Font-Size="Small" NavigateUrl='<%# Eval("projectid", "VoteEditor.aspx?id={0}") %>' Text="التصويت" Theme="iOS" ImageUrl="~/frsan/images/Vote.png">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <CaptionSettings VerticalAlign="Middle" />
                                        </dx:LayoutItem>
                                    </Items>
                                    <Styles>
                                        <LayoutGroupBox>
                                        </LayoutGroupBox>
                                        <LayoutItem>
                                            <Caption Font-Bold="False" Font-Size="Smaller">
                                            </Caption>
                                        </LayoutItem>
                                    </Styles>
                                </dx:ASPxFormLayout>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="False" />
                        </dx:ASPxDataView>
                    </td>
                </tr>
    </table>
            </asp:Content>

