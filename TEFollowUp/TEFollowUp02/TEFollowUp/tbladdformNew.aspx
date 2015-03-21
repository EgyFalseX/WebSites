<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tbladdformNew.aspx.cs" Inherits="tbladdformNew" %>
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
        <td dir="ltr">
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" RightToLeft="True" Theme="Aqua">
                <Items>
                    <dx:LayoutItem Caption="الخطة">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxComboBox ID="cbplanid" runat="server" Width="300px" DataSourceID="DSData" TextField="empname" ValueField="planid">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="الاسم" FieldName="empname" />
                                        <dx:ListBoxColumn Caption="التاريخ" FieldName="datef" />
                                        <dx:ListBoxColumn Caption="فصل" FieldName="fasl" />
                                        <dx:ListBoxColumn Caption="صف" FieldName="saf" />
                                        <dx:ListBoxColumn Caption="حصة" FieldName="hesa" />
                                        <dx:ListBoxColumn Caption="المدرسة" FieldName="schoolname" />
                                    </Columns>
                                </dx:ASPxComboBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings Location="Top" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="تاريخ الزيارة">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxDateEdit ID="deformdate" runat="server" Width="300px">
                                </dx:ASPxDateEdit>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings Location="Top" />
                    </dx:LayoutItem>
                </Items>
            </dx:ASPxFormLayout>
        </td>
    </tr>
    </table>
    <table align="center">
    <tr>
        <td style="text-align: center" class="auto-style1">
            <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ" Width="100px">
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT tblplan.planid, 
Format(tblplan.datef,'d/M/yyyy') AS datef
, cdschool.schoolname, cdsaf.saf, cdfasl.fasl, tblempdata.empname, cdhesa.hesa FROM (((((tblplan LEFT OUTER JOIN tblempdata ON tblplan.empid = tblempdata.empid) LEFT OUTER JOIN cdschool ON tblplan.schoolid = cdschool.schoolid) LEFT OUTER JOIN cdhesa ON tblplan.hesaid = cdhesa.hesaid) LEFT OUTER JOIN cdsaf ON tblplan.safid = cdsaf.safid) LEFT OUTER JOIN cdfasl ON tblplan.faslid = cdfasl.faslid) 
WHERE 
((SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true)
OR
(NOT EXISTS(SELECT planid FROM tbladdform WHERE planid = tblplan.planid) AND tblplan.moshref = ?)
">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="empidTEFollowUp" />
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

