<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="st_birth1.aspx.cs" Inherits="studentallViewer" %>

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
                DataFile="~/stgate/data/dataschool.mdb" 
                
                SelectCommand="SELECT  student.stu_name,student.stu_name_e, student.stu_code, student_t.asase_code, student_t.fasl_code, student_t.alsofof_code, student.Parthday, '' as img  
FROM (student INNER JOIN student_t ON student.stu_code = student_t.stu_code) WHERE (student_t.asase_code = (SELECT MAX(asase_code) AS Expr1 FROM student_t student_t_1)) AND (student_t.alsofof_code BETWEEN 0 AND 33) AND (Day(student.Parthday) = Day(NOW())) AND (MONTH(student.Parthday) = MONTH(NOW()))" OnSelected="DSData_Selected">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="dsSofof" runat="server" DataFile="~/stgate/data/code.mdb" 
                SelectCommand="SELECT [alsofof_code], [alsofof_name_e] FROM [alsofof]">
            </asp:AccessDataSource>
            <table align="center" class="auto-style1">
                <tr>
                    <td style="text-align: center">&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxDataView ID="ASPxDataViewMain" runat="server" 
                            EmptyDataText="لا يوجد بيانات" EnableCallbackAnimation="True" 
                            EnablePagingCallbackAnimation="True" EnableTheming="True" 
                            LoadingPanelText="جاري التحميل&amp;hellip;" style="margin-bottom: 0px" 
                            Theme="iOS" Width="700px" ColumnCount="2" OnPageIndexChanged="ASPxDataViewMain_PageIndexChanged">
                            <ItemTemplate>
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" 
                                    EnableTheming="True" RightToLeft="False" Theme="iOS" Font-Bold="False" 
                                    style="text-align: left">
                                    <Items>
                                        <dx:LayoutItem Caption="Name" ColSpan="2" HorizontalAlign="Left">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Font-Size="Small" 
                                                        Text='<%# Eval("stu_name_e") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Grade" ColSpan="2" HorizontalAlign="Left">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="dsSofof" 
                                                        ReadOnly="True" TextField="alsofof_name" Theme="Office2010Black" 
                                                        ValueField="alsofof_code" EnableTheming="True" 
                                                        Text='<%# Eval("alsofof_code") %>' HorizontalAlign="Left">
                                                        <Columns>
                                                            <dx:ListBoxColumn FieldName="alsofof_name_e" />
                                                        </Columns>
                                                    </dx:ASPxComboBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Birth Date" HorizontalAlign="Left" VerticalAlign="Top" 
                                            ColSpan="2">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" Font-Size="Small" 
                                                        Text='<%# Eval("Parthday","{0:d/M/yyyy}") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False" Height="96px" 
                                            RowSpan="4" HorizontalAlign="Center" VerticalAlign="Middle">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" Height="96px" 
                                                        ImageUrl='<%# Eval("img") %>' 
                                                        Width="96px">
                                                    </dx:ASPxImage>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                    <SettingsItems HorizontalAlign="Right" VerticalAlign="Middle" />
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

