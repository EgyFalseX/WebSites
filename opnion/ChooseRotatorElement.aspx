<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ChooseRotatorElement.aspx.cs" Inherits="ChooseRotatorElement" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 370px;
        }
        .style2
        {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table align="center" class="style1">
        <tr>
            <td align="right" bgcolor="#CCD9EB" colspan="2" style="text-align: center" 
                valign="top">
                <dx:ASPxValidationSummary ID="ASPxVSGroup" runat="server" RightToLeft="True" 
                    ShowErrorsInEditors="True" ValidationGroup="VGroup">
                </dx:ASPxValidationSummary>
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#CCD9EB" class="style2" valign="top">
                <dx:ASPxComboBox ID="ASPxCB" runat="server" 
                    CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    DataSourceID="DSRotatorElement" 
                    SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css" 
                    ValueType="System.Int32" Width="250px" BackColor="#6B99CE" 
                    TextField="Caption" ValueField="IDElement">
                    <Columns>
                        <dx:ListBoxColumn Caption="اختر" FieldName="Caption" />
                    </Columns>
                    <ItemStyle HorizontalAlign="Center" />
                    <LoadingPanelImage Url="App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom" 
                        ValidationGroup="VGroup">
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RequiredField ErrorText="يجب اختيار عنصر" 
                            IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="DSRotatorElement" runat="server" 
                    DataFile="App_Data/DataDB.mdb" 
                    
                    SelectCommand="SELECT IDElement, Caption FROM RotatorElement WHERE (show = true)">
                </asp:AccessDataSource>
            </td>
            <td align="right" bgcolor="#2A5A8E" valign="top">
                <asp:Label ID="Label1" runat="server" Text="نوع الرساله" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#CCD9EB" colspan="2" valign="top">
                <dx:ASPxButton ID="btnStart" runat="server" onclick="btnStart_Click" 
                    Text="موافق" ValidationGroup="VGroup" Width="120px">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    
</asp:Content>

