<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="hafzaReport.aspx.cs" Inherits="hafzaReport" %>


<%@ Register assembly="DevExpress.XtraReports.v11.2.Web, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style2
        {
            text-align: left;
        }
        .style3
        {
            width: 340px;
        }
        .style4
        {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <br />
    <table align="center" class="style3">
        <tr>
            <td class="style4">
               <dx:ASPxComboBox ID="cb" runat="server" 
                    CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Font-Bold="False" Font-Size="12pt" 
                    SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css" Width="300px" 
                    DataSourceID="AccessDSData" onbuttonclick="cb_ButtonClick" 
                    TextField="hafzaid" ValueField="hafzaid">
                    <Columns>
                        <dx:ListBoxColumn Caption="رقم الحافظة" FieldName="hafzaid" Name="hafzaid" />
                        <dx:ListBoxColumn Caption="تاريخ الحافظة" FieldName="hafzadate" 
                            Name="hafzadate" />
                    </Columns>
                    <LoadingPanelImage Url="App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <Buttons>
                        <dx:EditButton Text="عرض" Width="50px">
                        </dx:EditButton>
                    </Buttons>
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="AccessDSData" runat="server" 
                    DataFile="~/App_Data/MemberCard.mdb" 
                    
                    
                    SelectCommand="SELECT hafzadate, hafzaid FROM hafza WHERE (userin = ?) GROUP BY hafzaid, hafzadate" UpdateCommand="update hafza Set notes = ?
where hafzaid = ?">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="0" Name="userin" 
                            SessionField="MemberCardUserID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="?" Type="String" />
                        <asp:Parameter Name="?" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                </td>
            <td class="style4">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="False" Font-Size="12pt" 
                    Text="الحافظة">
                </dx:ASPxLabel>
                </td>
        </tr>
        <tr>
            <td class="style4">
                <dx:ASPxMemo ID="TBNote" runat="server" CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Height="71px" SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css" style="direction: rtl" Width="290px">
                    <ValidationSettings>
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxMemo>
            </td>
            <td class="style4">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="False" Font-Size="12pt" 
                    Text="ملحوظة">
                </dx:ASPxLabel>
                </td>
        </tr>
    </table>
    <table class="style1">
    <tr>
        <td class="style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
                <dx1:ASPxLabel ID="lblState" runat="server" Font-Names="10" Font-Bold="True">
                </dx1:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <dx:ReportToolbar ID="ReportToolbar1" runat="server" 
                ReportViewerID="ReportViewerRPT" ShowDefaultButtons="False">
                <Items>
                    <dx:ReportToolbarButton ItemKind="Search" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton ItemKind="PrintReport" />
                    <dx:ReportToolbarButton ItemKind="PrintPage" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
                    <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
                    <dx:ReportToolbarLabel ItemKind="PageLabel" />
                    <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
                    </dx:ReportToolbarComboBox>
                    <dx:ReportToolbarLabel ItemKind="OfLabel" />
                    <dx:ReportToolbarTextBox IsReadOnly="True" ItemKind="PageCount" />
                    <dx:ReportToolbarButton ItemKind="NextPage" />
                    <dx:ReportToolbarButton ItemKind="LastPage" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton ItemKind="SaveToDisk" />
                    <dx:ReportToolbarButton ItemKind="SaveToWindow" />
                    <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                        <Elements>
                            <dx:ListElement Value="pdf" />
                            <dx:ListElement Value="xls" />
                            <dx:ListElement Value="xlsx" />
                            <dx:ListElement Value="rtf" />
                            <dx:ListElement Value="mht" />
                            <dx:ListElement Value="html" />
                            <dx:ListElement Value="txt" />
                            <dx:ListElement Value="csv" />
                            <dx:ListElement Value="png" />
                        </Elements>
                    </dx:ReportToolbarComboBox>
                </Items>
                <Styles>
                    <LabelStyle>
                    <Margins MarginLeft="3px" MarginRight="3px" />
                    </LabelStyle>
                </Styles>
            </dx:ReportToolbar>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <dx:ReportViewer ID="ReportViewerRPT" runat="server" >
            </dx:ReportViewer>
        </td>
    </tr>
</table>
</asp:Content>

