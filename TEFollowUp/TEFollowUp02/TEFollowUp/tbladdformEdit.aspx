<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tbladdformEdit.aspx.cs" Inherits="tbladdformEdit" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <table align="center">
    <tr>
        <td style="text-align: center" class="auto-style1">
                                <dx:ASPxComboBox runat="server" DataSourceID="DSData" TextField="formdate" ValueField="formid" Width="300px" ID="cbplanid0" >
                                    <Columns>
                                        <dx:ListBoxColumn Caption="التاريخ" FieldName="formdate" />
                                        <dx:ListBoxColumn Caption="المدرسه" FieldName="schoolname" />
                                        <dx:ListBoxColumn Caption="الصف" FieldName="saf" />
                                        <dx:ListBoxColumn Caption="فصل" FieldName="fasl" />
                                        <dx:ListBoxColumn Caption="الاسم" FieldName="empname" />
                                    </Columns>
</dx:ASPxComboBox>

        </td>
    </tr>
    <tr>
        <td style="text-align: center" class="auto-style1">
            <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="تعديل" Width="100px">
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" class="auto-style1">
            <dx:ASPxButton ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="حذف" Width="100px">
                <ClientSideEvents Click="function(s, e) {
	 e.processOnServer = confirm('هل انت متأكد؟');
}" />
                <Image Url="images/delete.png">
                </Image>
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" class="auto-style1">
            <dx:ASPxButton ID="btnReport" runat="server" OnClick="btnReport_Click" Text="التقرير" Width="100px">
                <Image Url="images/report.png">
                </Image>
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT qform.formid, qform.planid, qform.formdate, cdschool.schoolname, tblempdata.empname, cdsaf.saf, cdfasl.fasl
FROM (((qform LEFT JOIN tblempdata ON qform.empid = tblempdata.empid) LEFT JOIN cdfasl ON qform.faslid = cdfasl.faslid) LEFT JOIN cdschool ON qform.school = cdschool.schoolid) LEFT JOIN cdsaf ON qform.saf = cdsaf.safid
WHERE userin = ?
 OR (SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true
OR EXISTS(SELECT planid FROM tblplan WHERE planid = tbladdform.planid AND moshref = ?)
">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                </SelectParameters>
            </asp:AccessDataSource>
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

