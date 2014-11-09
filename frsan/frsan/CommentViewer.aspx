<%@ Page Title="" Language="C#" MasterPageFile="~/frsan/masteruser2.master" AutoEventWireup="true" CodeFile="CommentViewer.aspx.cs" Inherits="CommentViewer" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRatingControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1" dir="rtl">
        <tr>
            <td style="text-align: center">
                <dx:ASPxDataView ID="ASPxDataViewMain" runat="server" EnableTheming="True" Theme="iOS" ColumnCount="1" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" Font-Bold="False" LoadingPanelText="تحميــــــــــــل&amp;hellip;" RightToLeft="True" RowPerPage="4">
                    <ItemTemplate>
                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EmptyDataText="لا يوجد بيانات" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" LoadingPanelText="جاري التحميل&amp;hellip;" style="margin-bottom: 0px" Theme="iOS" Width="700px" ColCount="2" RightToLeft="True"  >
                            <Items>
                                <dx:LayoutItem Caption="الاسم">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" Font-Size="Small" Text='<%# Eval("StudentName") %>' Theme="iOS">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings VerticalAlign="Middle" />
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Layout Item" ShowCaption="False" RowSpan="4">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxMemo ID="ASPxFormLayout1_E5" runat="server" Font-Size="Small" Height="100px" ReadOnly="True" Text='<%# Eval("comment") %>' Theme="iOS" Width="300px">
                                            </dx:ASPxMemo>
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
                                    <CaptionSettings VerticalAlign="Middle" />
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="الفارس">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Font-Size="Small" Text='<%# Eval("SarsName") %>' Theme="iOS">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings VerticalAlign="Middle" />
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="المشروع" RowSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E6" runat="server" EnableTheming="True" Font-Size="Small" Text='<%# Eval("subject") %>' Theme="iOS">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                    <CaptionSettings VerticalAlign="Middle" />
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxRatingControl ID="ASPxFormLayout1_E1" runat="server" OnDataBinding="ASPxFormLayout1_E1_DataBinding1" ReadOnly="True" RightToLeft="True" Theme="iOS" Titles='<%# Eval("LikeIt") %>' Value="<%# 1 %>">
                                            </dx:ASPxRatingControl>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:ASPxFormLayout>
                        <br/>
                    </ItemTemplate>
                    <ItemStyle Font-Bold="False" />
                </dx:ASPxDataView>
                <asp:AccessDataSource ID="dsData" runat="server" 
                    DataFile="~/App_Data/frsan.mdb" 
                    
                    SelectCommand="SELECT tblcomment.studentcomment, tblcomment.comment, tblcomment.autoid, tblcomment.LikeIt, tblcomment.datein, studentall.stid, '' AS SarsName, '' AS Saf, '' AS StudentName, tblsubject.subject FROM ((studentall INNER JOIN tblcomment ON studentall.autoid = tblcomment.autoid) INNER JOIN tblsubject ON studentall.subjectid = tblsubject.subjectid) ORDER BY tblcomment.commentid DESC">
                </asp:AccessDataSource>
            </td>
        </tr>
        </table>
</asp:Content>

