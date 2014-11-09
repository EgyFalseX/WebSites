<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Apply.aspx.cs" Inherits="Apply" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <dx:ASPxFormLayout ID="ASPxFormLayoutMain" runat="server" EnableTheming="True" Font-Size="Medium" RightToLeft="True" Theme="SoftOrange" Width="600px" ColCount="2">
        <Items>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxValidationSummary ID="validationcontrol" runat="server" RenderMode="OrderedList" ShowErrorsInEditors="True" Theme="SoftOrange" ValidationGroup="vg" Visible="False">
                        </dx:ASPxValidationSummary>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="Layout Item" ShowCaption="False" RowSpan="10" Width="300px">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxImage ID="ASPxFormLayoutMain_E1" runat="server" ImageUrl="~/images/register.jpg" Width="290px">
                        </dx:ASPxImage>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الاسم">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="txtregestername" runat="server" Font-Size="Medium" Theme="SoftOrange" Width="300px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="يجب ادخال الاسم" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings Location="Top" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="تاريخ الميلاد">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxDateEdit ID="deregesterbdate" runat="server" Font-Size="Medium" TabIndex="1" Theme="SoftOrange" Width="300px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="يجب ادخال تاريخ الميلاد" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxDateEdit>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings Location="Top" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="رقم الموبيل">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="txtregestermobile" runat="server" Font-Size="Medium" TabIndex="2" Theme="SoftOrange" Width="300px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="يجب ادخال رقم الموبيل" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings Location="Top" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الايميل">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="txtregestermail" runat="server" Font-Size="Medium" TabIndex="3" Theme="SoftOrange" Width="300px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="يجب ادخال الايميل" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings Location="Top" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="المحافظة">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxComboBox ID="cbregestergov" runat="server" DataSourceID="dsGov" DropDownStyle="DropDown" Font-Size="Medium" TabIndex="4" TextField="govname" Theme="SoftOrange" ValueField="govid" Width="300px">
                            <Columns>
                                <dx:ListBoxColumn Caption="اسم المحافظة" FieldName="govname" />
                            </Columns>
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="يجب ادخال المحافظة" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:AccessDataSource ID="dsGov" runat="server" DataFile="Data/FlexibleData.mdb" SelectCommand="SELECT [govid], [govname] FROM [cdgov]"></asp:AccessDataSource>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings Location="Top" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="العنوان">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxTextBox ID="txtregesteraddress" runat="server" Font-Size="Medium" TabIndex="5" Theme="SoftOrange" Width="300px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="يجب ادخال العنوان" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings Location="Top" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="الدورة التدريبية">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxComboBox ID="cbcourseid" runat="server" DataSourceID="dsCourse" DropDownStyle="DropDown" Font-Size="Medium" TabIndex="6" TextField="coursename" Theme="SoftOrange" ValueField="courseid" Width="300px">
                            <Columns>
                                <dx:ListBoxColumn Caption="اسم الدورة" FieldName="coursename" />
                            </Columns>
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="يجب ادخال الدورة التدريبية" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:AccessDataSource ID="dsCourse" runat="server" DataFile="Data/FlexibleData.mdb" SelectCommand="SELECT [courseid], [coursename] FROM [cdcourse]"></asp:AccessDataSource>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings Location="Top" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="رسالة">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxMemo ID="txtregestermsg" runat="server" Font-Size="Medium" Height="71px" TabIndex="7" Theme="SoftOrange" Width="300px">
                            <ValidationSettings ValidationGroup="vg">
                                <RequiredField ErrorText="يجب ادخال الرسالة" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxMemo>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
                <CaptionSettings Location="Top" />
            </dx:LayoutItem>
            <dx:LayoutItem Caption="حجـــــــــــــز" ShowCaption="False">
                <LayoutItemNestedControlCollection>
                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxButton ID="btnApply" runat="server" OnClick="btnApply_Click" TabIndex="8" Text="حجـــــــــــــز" Theme="SoftOrange" ValidationGroup="vg">
                        </dx:ASPxButton>
                    </dx:LayoutItemNestedControlContainer>
                </LayoutItemNestedControlCollection>
            </dx:LayoutItem>
        </Items>
        <SettingsItems Width="250px" />
        <SettingsItemCaptions VerticalAlign="Top" />
    </dx:ASPxFormLayout>
    <dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" AllowDragging="True" ClientInstanceName="popupeditor" Font-Bold="False" HeaderText="رسالـــه" Height="120px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" RightToLeft="True" style="text-align: center" Width="300px" Theme="SoftOrange">
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
</asp:Content>

