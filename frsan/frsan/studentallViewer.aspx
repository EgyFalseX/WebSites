<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="studentallViewer.aspx.cs" Inherits="studentallViewer" %>

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
                SelectCommand="SELECT studentall.stid, studentall.subjectid, studentall.tsfeat, studentall.winner, studentall.autoid, tblsubject.subject, tblproject.project, '' AS Saf, '' AS stu_name FROM ((studentall INNER JOIN tblsubject ON studentall.subjectid = tblsubject.subjectid) INNER JOIN tblproject ON tblsubject.projectid = tblproject.projectid) WHERE (studentall.tsfeat = - 1) AND (tblproject.projectid = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="id" />
                </SelectParameters>
            </asp:AccessDataSource>
            <table align="center" class="auto-style1">
                <tr>
                    <td style="text-align: center">&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxDataView ID="ASPxDataViewMain" runat="server" EmptyDataText="لا يوجد بيانات" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" LoadingPanelText="جاري التحميل&amp;hellip;" style="margin-bottom: 0px" Theme="iOS" Width="700px">
                            <ItemTemplate>
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" EnableTheming="True" RightToLeft="True" Theme="iOS" Font-Bold="False">
                                    <Items>
                                        <dx:LayoutItem Caption="الاسم" ColSpan="2" HorizontalAlign="Center">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Font-Size="Small" Text='<%# Eval("stu_name") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="الصف">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E3" runat="server" Font-Size="Small" Text='<%# Eval("Saf") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" RowSpan="5" ShowCaption="False" Height="96px">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" Height="96px" ImageUrl='<%# Eval("stid", "../desoft/database/photo/picstudent/{0}.jpg") %>' Width="96px">
                                                    </dx:ASPxImage>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="الموضوع" HorizontalAlign="Right" VerticalAlign="Top">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" Font-Size="Small" Text='<%# Eval("subject") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" HorizontalAlign="Right" ShowCaption="False" VerticalAlign="Top">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E7" runat="server" Font-Size="Small" NavigateUrl='<%# Eval("autoid", "studentPageViewer.aspx?id={0}") %>' Text="التفاصيل" Theme="iOS">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" HorizontalAlign="Right" ShowCaption="False" VerticalAlign="Top">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E5" runat="server" Font-Size="Small" NavigateUrl='<%# Eval("autoid", "CommentEditor.aspx?id={0}") %>' Text="اضف تعليق" Theme="iOS">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" HorizontalAlign="Right" ShowCaption="False" VerticalAlign="Top">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E6" runat="server" EnableTheming="True" Font-Size="Small" NavigateUrl='<%# Eval("autoid", "CommentViewer.aspx?id={0}") %>' Text="عرض التعليقات" Theme="iOS" style="direction: ltr">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
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

