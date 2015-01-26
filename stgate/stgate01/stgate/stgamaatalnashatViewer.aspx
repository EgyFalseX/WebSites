<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="stgamaatalnashatViewer.aspx.cs" Inherits="stgamaatalnashatViewer" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

<table align="center">
    <tr>
        <td dir="ltr">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <dx:ASPxDataView ID="ASPxDataView1" runat="server" DataSourceID="DSData" 
                EnableTheming="True" Theme="PlasticBlue" ColumnCount="2">
                <ItemTemplate>
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" Theme="iOS">
                        <Items>
                            <dx:LayoutItem Caption="Activity">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxComboBox ID="ASPxFormLayout1_E1" runat="server" DataSourceID="Dcode_gamaat_alnashat" Enabled="False" EnableTheming="True" ReadOnly="True" Text='<%# Eval("code_gamaat_alnashat") %>' TextField="name_gamaat_alnashat" ValueField="code_gamaat_alnashat">
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="name_gamaat_alnashat" />
                                            </Columns>
                                            <Items>
                                                <dx:ListEditItem Selected="True" />
                                            </Items>
                                            <DisabledStyle BackColor="#D4D8DA" ForeColor="Black">
                                            </DisabledStyle>
                                        </dx:ASPxComboBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings VerticalAlign="Middle" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Date">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" Text='<%# Eval("date", "{0:d/M/yyyy}") %>'>
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings VerticalAlign="Middle" />
                            </dx:LayoutItem>
                        </Items>
                    </dx:ASPxFormLayout>
                </ItemTemplate>
            </dx:ASPxDataView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="data/dataschool.mdb" 
                SelectCommand="SELECT code_gamaat_alnashat, [date] FROM stu_gamaat_alnashat WHERE (asase_code = (SELECT MAX(asase_code) AS Expr1 FROM student_t)) AND (stu_code = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDst" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="Dcode_gamaat_alnashat" runat="server" 
                DataFile="data/code.mdb" 
                SelectCommand="SELECT code_gamaat_alnashat, name_gamaat_alnashat FROM gamaat_alnashat">
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
    </table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    HeaderText="رسالـــه" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False" Theme="Aqua">
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/dvLoading.gif">
    </LoadingPanelImage>
    <CloseButtonStyle>
        <Paddings Padding="0px" />
    </CloseButtonStyle>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False">
        <BorderBottom BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" />
    </ContentStyle>
    <HeaderStyle>
    <Paddings PaddingLeft="10px" PaddingBottom="4px" PaddingRight="4px" 
        PaddingTop="4px" />
    </HeaderStyle>
    <ContentCollection>

<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">تم 
    التحميل</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    

</asp:Content>

