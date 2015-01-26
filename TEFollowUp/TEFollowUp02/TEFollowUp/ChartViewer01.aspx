<%@ Page Title="" Language="C#" MasterPageFile="~/TEFollowUp/master.master" AutoEventWireup="true" CodeFile="ChartViewer01.aspx.cs" Inherits="ChartViewer01" %>

<%@ Register assembly="DevExpress.XtraCharts.v12.2.Web, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

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
                <dx:ASPxFormLayout ID="ASPxFormLayoutMain" runat="server" RightToLeft="True">
                    <Items>
                        <dx:LayoutItem Caption="اختر مشرف">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cbEmp" runat="server" AutoPostBack="True" DataSourceID="dsempid" OnSelectedIndexChanged="cbEmp_SelectedIndexChanged" TextField="empname" ValueField="empid">
                                        <Columns>
                                            <dx:ListBoxColumn FieldName="empname" Caption="الاسم" />
                                        </Columns>
                                    </dx:ASPxComboBox>
                                    <asp:AccessDataSource ID="dsempid" runat="server" DataFile="Data/TEFollow-up.mdb" SelectCommand="SELECT [empid], [empname] FROM [tblempdata] WHERE [moshref] = true"></asp:AccessDataSource>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
            </td>
        </tr>
        <tr>
            <td dir="rtl" style="text-align: center">
                <dxchartsui:WebChartControl ID="WebChartControlMain" runat="server" DataSourceID="dsData" Height="600px" Width="800px" SeriesDataMember="empname" SeriesSorting="Ascending">
                    <diagramserializable>
                        <cc1:XYDiagram>
                            <axisx visibleinpanesserializable="-1">
                                <range sidemarginsenabled="True" />
                            </axisx>
                            <axisy visibleinpanesserializable="-1">
                                <range sidemarginsenabled="True" />
                            </axisy>
                        </cc1:XYDiagram>
                    </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                    <seriestemplate argumentdatamember="formdate" argumentscaletype="DateTime" valuedatamembersserializable="robrexedegree">
                        <viewserializable>
                            <cc1:LineSeriesView>
                                <linemarkeroptions visible="True">
                                </linemarkeroptions>
                            </cc1:LineSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:PointSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </pointoptionsserializable>
                            </cc1:PointSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PointOptions>
                            </cc1:PointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                </dxchartsui:WebChartControl>
                <asp:AccessDataSource ID="dsData" runat="server" DataFile="Data/TEFollow-up.mdb" SelectCommand="SELECT tblplan.empid, tbladdform.formdate, SUM(tbladdformdetails.robrexedegree) AS robrexedegree, tblempdata.empname FROM ((tblempdata RIGHT OUTER JOIN tblplan ON tblempdata.empid = tblplan.empid) LEFT OUTER JOIN (tbladdformdetails RIGHT OUTER JOIN tbladdform ON tbladdformdetails.formid = tbladdform.formid) ON tblplan.planid = tbladdform.planid) WHERE (tblplan.empid = ?) GROUP BY tblplan.empid, tbladdform.formdate, tblempdata.empname">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="?" QueryStringField="id" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
    </table>
    </asp:Content>

