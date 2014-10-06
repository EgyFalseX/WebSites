<%@ Page Title="" Language="C#" MasterPageFile="MasterPage1.master" AutoEventWireup="true" CodeFile="CreatePage.aspx.cs" Inherits="CreatePage" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 482px;
        }
        .auto-style2 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td>
                <asp:AccessDataSource ID="dsM1" runat="server" DataFile="Data/FlexibleData.mdb" SelectCommand="SELECT [ItemID], [ItemName], [Show_Hide] FROM [MenuItem] ORDER BY [ItemName]"></asp:AccessDataSource>
                <asp:AccessDataSource ID="dsM2" runat="server" DataFile="Data/FlexibleData.mdb" SelectCommand="SELECT [SubMenuID], [SubMenuTitle] FROM [SubMenu] ORDER BY [SubMenuTitle]"></asp:AccessDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxComboBox ID="cbM1" runat="server" DataSourceID="dsM1" Font-Size="Medium" Style="direction: rtl" TextField="ItemName" ValueField="ItemID" Width="300px">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="ItemName" Name="ItemName" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td style="direction: rtl">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Medium" Text="قائمه رئيسيه : ">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxComboBox ID="cbM2" runat="server" DataSourceID="dsM2" Font-Size="Medium" Style="direction: rtl" TextField="SubMenuTitle" ValueField="SubMenuID" Width="300px">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="SubMenuTitle" Name="SubMenuTitle" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td style="direction: rtl">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Medium" Text="قائمه فرعيه : ">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="btnShow" runat="server" Text="عرض" Width="120px" AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
	CallbackPanel.PerformCallback();
}" />
                </dx:ASPxButton>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanelMain" runat="server" Width="800px" ClientInstanceName="CallbackPanel" OnCallback="ASPxCallbackPanelMain_Callback">
                    <PanelCollection>
                        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxHtmlEditor ID="txt1" runat="server" Height="500px" Width="800px">
                            </dx:ASPxHtmlEditor>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="auto-style2">
                <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ" Width="140px">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="auto-style2">
                <dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" AllowDragging="True" ClientInstanceName="popupeditor" Font-Bold="False" HeaderText="رسالـــه" Height="120px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" RightToLeft="True" style="text-align: center" Width="300px">
                    <ClientSideEvents EndCallback="function(s, e) {
if(typeof(s.cpShowPopup) != 'undefined')
{
	popupeditor.SetContentHTML(s.cpShowPopup);
	popupeditor.Show();
} 		
}" />
                    <CloseButtonStyle>
                        <Paddings Padding="0px" />
                    </CloseButtonStyle>
                    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False">
                        <BorderBottom BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" />
                    </ContentStyle>
                    <HeaderStyle>
                    <Paddings PaddingBottom="4px" PaddingLeft="10px" PaddingRight="4px" PaddingTop="4px" />
                    </HeaderStyle>
                    <contentcollection>
                        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                            </dx:PopupControlContentControl>
                    </contentcollection>
                </dx:ASPxPopupControl>
            </td>
        </tr>
    </table>
</asp:Content>

