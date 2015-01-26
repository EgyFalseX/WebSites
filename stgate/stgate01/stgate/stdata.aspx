<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="stdata.aspx.cs" Inherits="studentallViewer" %>

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
                DataFile="data/dataschool.mdb" 
                
                
                
                SelectCommand="SELECT student.stu_name, student.stu_name_e, student.stu_code, student_t.asase_code, student_t.fasl_code, student_t.alsofof_code, student.Parthday, student.dyana_code, student.addres, student.walealkmrname, student.waleaalkamrjob, student.waleaalkamr_mobile, student.mother_mobile FROM (student INNER JOIN student_t ON student.stu_code = student_t.stu_code) WHERE (student_t.asase_code = (SELECT MAX(asase_code) AS Expr1 FROM student_t student_t_1)) And student.stu_code = ?">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDst" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="dsfasl" runat="server" DataFile="data/code.mdb" 
                SelectCommand="SELECT [fasl_code], [fasl_name], [fasl_name_e] FROM [fasl]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="dsSofof" runat="server" DataFile="data/code.mdb" 
                SelectCommand="SELECT [alsofof_code], [alsofof_name_e] FROM [alsofof]">
            </asp:AccessDataSource>
            <table align="center" class="auto-style1">
                <tr>
                    <td style="text-align: center">
                        
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxDataView ID="ASPxDataViewMain" runat="server" 
                            EmptyDataText="لا يوجد بيانات" EnableCallbackAnimation="True" 
                            EnablePagingCallbackAnimation="True" EnableTheming="True" 
                            LoadingPanelText="جاري التحميل&amp;hellip;" style="margin-bottom: 0px" 
                            Theme="iOS" Width="700px" DataSourceID="DSData" ColumnCount="1" 
                            RowPerPage="1">
                            <ItemTemplate>
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" 
                                    EnableTheming="True" RightToLeft="False" Theme="iOS" Font-Bold="False">
                            <Items>
                                <dx:LayoutItem Caption="Layout Item" ColSpan="2" HorizontalAlign="Center" 
                                            Height="96px" RowSpan="4" ShowCaption="False" VerticalAlign="Middle">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" Height="96px" 
                                                        ImageUrl='<%# Eval("stu_code", "../sgate/data/photo/picstudent/{0}.jpg") %>' 
                                                        Width="96px">
                                            </dx:ASPxImage>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Name" ColSpan="2" HorizontalAlign="Center">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Font-Size="Small" 
                                                        Text='<%# Eval("stu_name_e") %>' Theme="iOS">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Grade" HorizontalAlign="Left">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="dsSofof" 
                                                        EnableTheming="True" ReadOnly="True" Text='<%# Eval("alsofof_code") %>' 
                                                        TextField="alsofof_name" Theme="Office2010Black" ValueField="alsofof_code">
                                                <Columns>
                                                    <dx:ListBoxColumn FieldName="alsofof_name_e" />
                                                </Columns>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Class" HorizontalAlign="Left">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" DataSourceID="dsfasl" 
                                                        EnableTheming="True" ReadOnly="True" Text='<%# Eval("alsofof_code") %>' 
                                                        TextField="fasl_name" Theme="Office2010Black" ValueField="fasl_code">
                                                <Columns>
                                                    <dx:ListBoxColumn FieldName="fasl_name" />
                                                </Columns>
                                            </dx:ASPxComboBox>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Birth Date" HorizontalAlign="Left" VerticalAlign="Top" 
                                            ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server" 
                                                    SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" Font-Size="Small" 
                                                        Text='<%# Eval("Parthday","{0:d/M/yyyy}") %>' Theme="iOS">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Address" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server" 
                                                    SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E3" runat="server" 
                                                        Text='<%# Eval("addres") %>'>
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Guardian" ColSpan="2">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server" 
                                                    SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E5" runat="server" 
                                                        Text='<%# Eval("walealkmrname") %>'>
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Mobile">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server" 
                                                    SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E6" runat="server" 
                                                        Text='<%# Eval("waleaalkamr_mobile") %>'>
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Mother Mobile">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E7" runat="server" Text='<%# Eval("mother_mobile") %>'>
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                            <SettingsItems HorizontalAlign="Left" VerticalAlign="Middle" />
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

