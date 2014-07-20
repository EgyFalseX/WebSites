<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TBLAllMember.ascx.cs" Inherits="TBLAllMember" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>

<style type="text/css">
    .auto-style1
    {
        text-align: right;
    }
</style>

<table align="center" style="width: 627px">
    <tr>
        <td dir="ltr">
            <dx:ASPxValidationSummary ID="ASPxVS" runat="server" RightToLeft="True" ShowErrorsInEditors="True" ValidationGroup="VG" Visible="False">
            </dx:ASPxValidationSummary>
        </td>
    </tr>
    <tr>
        <td dir="ltr" style="text-align: center">
            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" RightToLeft="True" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                <TabPages>
                    <dx:TabPage Text="بيانات اساسيه">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table align="center" style="width: 627px">
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="النقابة الفرعية">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxComboBox ID="cbSyndicateId" runat="server" AutoPostBack="True" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSSyndicateId" Font-Size="12pt" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" TextField="Syndicate" ValueField="SyndicateId" Width="250px" DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="Syndicate" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="اللجنة النقابية">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxComboBox ID="cbSubCommitteId" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSSubCommitteId" Font-Size="12pt" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                                                TextField="SubCommitte" ValueField="SubCommitteId" Width="250px" TabIndex="1" DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="SubCommitte" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel14" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                Font-Size="12pt" Text="نوع العضوية">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxComboBox ID="cbmembertypeid" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSmembertypeid" Font-Size="12pt" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" TabIndex="2" 
                                                TextField="membertypename" ValueField="membertypeid" Width="250px" DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="membertypename" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="الاسم">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxTextBox ID="tbMemberName" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                Font-Size="12pt" MaxLength="75" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" 
                                                TabIndex="3">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel15" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                Font-Size="12pt" Text="الرقم القومي">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxTextBox ID="tbmnid" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                Font-Size="12pt" MaxLength="14" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" TabIndex="3" 
                                                Width="250px">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RegularExpression ValidationExpression="\d{14}" />
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="تاريخ الميلاد">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxDateEdit ID="deBirthDate" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                EditFormat="Custom" EditFormatString="dd/MM/yyyy" Font-Size="12pt" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" 
                                                TabIndex="4">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="نوع المؤهل">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxComboBox ID="cbQualtypeId" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSQualtypeId" DropDownStyle="DropDown" Font-Size="12pt" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                                                TextField="Qualtype" ValueField="QualtypeId" Width="250px" TabIndex="5" IncrementalFilteringMode="Contains">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="Qualtype" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel10" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="الوظيفة">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxComboBox ID="cbJobtitleID" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSJobtitleID" Font-Size="12pt" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                                                TextField="Jobtitle" ValueField="JobtitleID" Width="250px" TabIndex="6" DropDownStyle="DropDown" IncrementalFilteringMode="Contains">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="Jobtitle" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel9" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="تاريخ التعيين">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxDateEdit ID="deWorkeDate" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                EditFormat="Custom" EditFormatString="dd/MM/yyyy" Font-Size="12pt" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" 
                                                TabIndex="7">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            <dx:ASPxLabel ID="ASPxLabel12" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="تاريخ بداية الخصم" Width="120px">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <dx:ASPxDateEdit ID="dekasmDate" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                EditFormat="Custom" EditFormatString="dd/MM/yyyy" Font-Size="12pt" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" 
                                                TabIndex="8">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            &nbsp;</td>
                                        <td class="auto-style1">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style1" dir="ltr">
                                            &nbsp;</td>
                                        <td class="auto-style1">
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                                                Text="اذا كان العضو من الخارج يكتب تاريخ التخرج في حقل تاريخ بداية الخصم"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td dir="ltr" class="auto-style1">
                                            <dx:ASPxLabel ID="ASPxLabel13" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="12pt" Text="الصوره">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td dir="ltr" style="vertical-align: top;" class="auto-style1">
                                            <asp:FileUpload ID="FU" runat="server" TabIndex="10" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td dir="ltr" style="text-align: center">
                                            &nbsp;</td>
                                        <td dir="ltr" style="text-align: left; vertical-align: top;">
                                            <dx:ASPxImage ID="myImg" runat="server" ClientIDMode="Static" ClientInstanceName="myImg">
                                            </dx:ASPxImage>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td dir="ltr">
                                            <dx:ASPxButton ID="btnSave" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                OnClick="btnSave_Click" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Text="حفظ" 
                                                ValidationGroup="VG" Width="120px" TabIndex="11" Height="20px">
                                            </dx:ASPxButton>
                                        </td>
                                        <td dir="ltr" style="text-align: left">
                                            <dx:ASPxButton ID="btnclear" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                OnClick="btnclear_Click" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Text="مسح" 
                                                Width="120px" TabIndex="12">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td dir="ltr">
                                            &nbsp;</td>
                                        <td dir="ltr" style="text-align: left">
                                            <dx:ASPxButton ID="btnNew" runat="server" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                OnClick="btnNew_Click" 
                                                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                                                Text="جديـــــــد" Width="120px" TabIndex="12">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" dir="ltr" style="text-align: center">
                                            <asp:AccessDataSource ID="DSSyndicateId" runat="server" DataFile="~/App_Data/MemberCard.mdb" OnSelecting="DSSyndicateId_Selecting" SelectCommand="SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]"></asp:AccessDataSource>
                                            <asp:AccessDataSource ID="DSSubCommitteId" runat="server" DataFile="~/App_Data/MemberCard.mdb" SelectCommand="SELECT [SubCommitteId], [SubCommitte], [SyndicateId] FROM [CDSubCommitte] WHERE ([SyndicateId] = ?)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="cbSyndicateId" DefaultValue="0" Name="SyndicateId" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:AccessDataSource>
                                            <asp:AccessDataSource ID="DSmembertypeid" runat="server" 
                                                DataFile="~/App_Data/MemberCard.mdb" 
                                                SelectCommand="SELECT [membertypeid], [membertypename] FROM [CDmemberType]">
                                            </asp:AccessDataSource>
                                            <asp:AccessDataSource ID="DSQualtypeId" runat="server" DataFile="~/App_Data/MemberCard.mdb" SelectCommand="SELECT [QualtypeId], [Qualtype] FROM [CDQualtype]"></asp:AccessDataSource>
                                            <asp:AccessDataSource ID="DSJobtitleID" runat="server" DataFile="~/App_Data/MemberCard.mdb" SelectCommand="SELECT [JobtitleID], [Jobtitle] FROM [CDJobtitle] ORDER BY [Jobtitle]"></asp:AccessDataSource>
                                            <asp:HiddenField ID="HFImg" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="بيانات الخصم">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSData" EnableTheming="True" Font-Bold="True" KeyFieldName="id" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Width="700px">
                                    <ClientSideEvents BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                                    </TotalSummary>
                                    <Columns>
                                        <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditButton Visible="True">
                                                <Image Url="../images/edit.png" Width="26px">
                                                </Image>
                                            </EditButton>
                                            <NewButton Visible="True">
                                                <Image Url="../images/insert.png" Width="26px">
                                                </Image>
                                            </NewButton>
                                            <DeleteButton Text="حذف" Visible="True">
                                                <Image Url="../images/delete.png" Width="26px">
                                                </Image>
                                            </DeleteButton>
                                            <SelectButton>
                                                <Image Url="../images/accept.png">
                                                </Image>
                                            </SelectButton>
                                            <CancelButton>
                                                <Image Url="../images/delete.png">
                                                </Image>
                                            </CancelButton>
                                            <UpdateButton>
                                                <Image Url="../images/accept.png">
                                                </Image>
                                            </UpdateButton>
                                            <ClearFilterButton Visible="True">
                                            </ClearFilterButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="نوع الاجازة" FieldName="agazatypeId" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesComboBox DataSourceID="DSagazatypeId" TextField="agazatype" ValueField="agazatypeId" ValueType="System.Int32">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="agazatype" />
                                                </Columns>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="من تاريخ" FieldName="datefrom" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesDateEdit DisplayFormatString="{0: dd/MM/yyyy}">
                                            </PropertiesDateEdit>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataDateColumn Caption="الى تاريخ" FieldName="dateto" ShowInCustomizationForm="True" VisibleIndex="5">
                                            <PropertiesDateEdit DisplayFormatString="{0: dd/MM/yyyy}">
                                            </PropertiesDateEdit>
                                        </dx:GridViewDataDateColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" ConfirmDelete="True" SortMode="DisplayText" />
                                    <SettingsPager ShowDefaultImages="False">
                                        <AllButton Text="All">
                                        </AllButton>
                                        <NextPageButton Text="Next &gt;">
                                        </NextPageButton>
                                        <PrevPageButton Text="&lt; Prev">
                                        </PrevPageButton>
                                        <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" Text="صفحه {0} of {1} ({2} عنصر)" />
                                    </SettingsPager>
                                    <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowTitlePanel="True" />
                                    <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه" CommandDelete="حذف" CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار" CommandUpdate="تحديث" ConfirmDelete="هل انت متأكد؟" CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ" EmptyHeaders="راس فارغ" FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه" FilterControlPopupCaption="خيارات التصفيه" GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه" GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" HeaderFilterShowAll="اظهار الكل" HeaderFilterShowBlanks="اظهار الفارغ" HeaderFilterShowNonBlanks="اظهار غير الفارغ" PopupEditFormCaption="صفحة المحرر" />
                                    <Images SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                                        <LoadingPanelOnStatusBar Url="../App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                                        </LoadingPanelOnStatusBar>
                                        <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                                        </LoadingPanel>
                                    </Images>
                                    <ImagesFilterControl>
                                        <LoadingPanel Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                                        </LoadingPanel>
                                    </ImagesFilterControl>
                                    <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                                        <Header Font-Bold="False" Font-Size="Medium" ImageSpacing="10px" SortingImageSpacing="10px">
                                        </Header>
                                    </Styles>
                                    <StylesPager>
                                        <CurrentPageNumber Font-Bold="False">
                                        </CurrentPageNumber>
                                        <PageNumber Font-Bold="False">
                                        </PageNumber>
                                    </StylesPager>
                                    <StylesEditors>
                                        <CalendarHeader Spacing="11px">
                                        </CalendarHeader>
                                        <ProgressBar Height="25px">
                                        </ProgressBar>
                                    </StylesEditors>
                                </dx:ASPxGridView>
                                <br />
                                <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/MemberCard.mdb" DeleteCommand="DELETE FROM [memberagazat] WHERE [id] = ?" InsertCommand="INSERT INTO [memberagazat] ([MemberId], [agazatypeId], [datefrom], [dateto]) VALUES (?, ?, ?, ?)" SelectCommand="SELECT [MemberId], [agazatypeId], [datefrom], [dateto], [id] FROM [memberagazat] WHERE ([MemberId] = ?)" UpdateCommand="UPDATE [memberagazat] SET [dateto] = ?, [agazatypeId] = ?, [datefrom] = ? WHERE [id] = ?">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:QueryStringParameter DefaultValue="0" Name="MemberId" QueryStringField="mm" Type="Int32" />
                                        <asp:Parameter Name="agazatypeId" Type="Byte" />
                                        <asp:Parameter Name="datefrom" Type="DateTime" />
                                        <asp:Parameter Name="dateto" Type="DateTime" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="0" Name="MemberId" QueryStringField="mm" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="dateto" Type="DateTime" />
                                        <asp:Parameter Name="agazatypeId" Type="Byte" />
                                        <asp:Parameter Name="datefrom" Type="DateTime" />
                                        <asp:Parameter Name="id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:AccessDataSource>
                                <asp:AccessDataSource ID="DSagazatypeId" runat="server" DataFile="~/App_Data/MemberCard.mdb" SelectCommand="SELECT [agazatypeId], [agazatype] FROM [CDagazat]"></asp:AccessDataSource>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/tcLoading.gif">
                </LoadingPanelImage>
                <Paddings PaddingLeft="5px" PaddingRight="5px" PaddingTop="3px" />
                <ContentStyle>
                    <Border BorderWidth="0px" />
                </ContentStyle>
            </dx:ASPxPageControl>
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
    Width="300px" Style="text-align: center"
    Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/dvLoading.gif">
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

        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
            تم 
    التحميل
        </dx:PopupControlContentControl>

    </ContentCollection>
</dx:ASPxPopupControl>



