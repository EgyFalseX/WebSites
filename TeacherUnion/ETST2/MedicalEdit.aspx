<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="MedicalEdit.aspx.cs" Inherits="MedicalEdit" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 515px;
        }
        .auto-style2
        {
            direction: rtl;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td colspan="2" style="text-align: center">
                <dx:ASPxLabel ID="lblState" runat="server" Font-Size="12pt" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbGOVID" runat="server" AutoPostBack="True" DataSourceID="dsGOVID" Font-Size="12pt" TextField="GOV" ValueField="GOVID" Width="250px">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="GOV" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsGOVID" runat="server" DataFile="~/App_Data/Medical.mdb" SelectCommand="SELECT [GOVID], [GOV] FROM [GOV]"></asp:AccessDataSource>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="12pt" Text="المحافظة">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbgehatypid" runat="server" AutoPostBack="True" DataSourceID="dsgehatypid" Font-Size="12pt" TextField="type" ValueField="typeid" Width="250px">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="type" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dsgehatypid" runat="server" DataFile="~/App_Data/Medical.mdb" SelectCommand="SELECT [typeid], [type] FROM [cdtypegeha]"></asp:AccessDataSource>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="12pt" Text="نوع مقدم الخدمة ">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbtaksosid" runat="server" AutoPostBack="True" DataSourceID="dstaksosid" Font-Size="12pt" TextField="taksos" ValueField="taksosid" Width="250px">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="taksos" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dstaksosid" runat="server" DataFile="~/App_Data/Medical.mdb" SelectCommand="SELECT [taksosid], [taksos] FROM [cdtaksos]"></asp:AccessDataSource>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="12pt" Text="التخصص">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxComboBox ID="cbIDnetwork" runat="server" DataSourceID="dstypemember" Font-Size="12pt" TextField="NAME" ValueField="ID" Width="250px">
                    <Columns>
                        <dx:ListBoxColumn Caption="الاسم" FieldName="NAME" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:AccessDataSource ID="dstypemember" runat="server" DataFile="~/App_Data/Medical.mdb" SelectCommand="SELECT [ID], [NAME] FROM [NETWORK] WHERE (([GOVID] = ?) AND ([gehatypid] = ?) AND ([taksosid] = ?))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbGOVID" DefaultValue="0" Name="GOVID" PropertyName="Value" Type="Int32" />
                        <asp:ControlParameter ControlID="cbgehatypid" DefaultValue="0" Name="gehatypid" PropertyName="Value" Type="Byte" />
                        <asp:ControlParameter ControlID="cbtaksosid" DefaultValue="0" Name="taksosid" PropertyName="Value" Type="Byte" />
                    </SelectParameters>
                </asp:AccessDataSource>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="12pt" Text="اسم مقدم الخدمة">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxDateEdit ID="dedatetahweel" runat="server" Font-Size="12pt" Width="250px">
                </dx:ASPxDateEdit>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="12pt" Text="تاريخ التحويل">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxMemo ID="tbrem" runat="server" Font-Size="12pt" Height="71px" Width="250px">
                </dx:ASPxMemo>
            </td>
            <td class="auto-style2" valign="top">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="12pt" Text="ملاحظات">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2" valign="top">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ" Width="200px">
                </dx:ASPxButton>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="حفظ التعديل" Width="200px" Visible="False">
                </dx:ASPxButton>
            </td>
            <td class="auto-style2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">

<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server"
    AllowDragging="True" ClientInstanceName="popupeditor"
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
    HeaderText="رسالـــه"
    Modal="True" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Height="120px"
    Width="300px" Style="text-align: center"
    Font-Bold="False">
    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Web/dvLoading.gif">
    </LoadingPanelImage>
    <ClientSideEvents Init="function(s, e) {
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
        <Paddings PaddingLeft="10px" PaddingBottom="4px" PaddingRight="4px"
            PaddingTop="4px" />
    </HeaderStyle>
    <ContentCollection>

        <dx:popupcontrolcontentcontrol ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
            تم 
    التحميل
        </dx:popupcontrolcontentcontrol>

    </ContentCollection>
</dx:ASPxPopupControl>








            </td>
            <td class="auto-style2">
                <asp:HiddenField ID="HFid" runat="server" />
                <asp:HiddenField ID="HFtype" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

