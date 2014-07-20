<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register.ascx.cs" Inherits="Register" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxNavBar" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx1" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx1" %>

<style type="text/css">
    .style4
    {
        width: 180px;
        text-align: right;
    }
    .style5
    {
        width: 225px;
        text-align: left;
    }
    .style6
    {
        width: 161px;
        text-align: right;
    }
    .style7
    {
        width: 406px;
    }
    .style9
    {
        width: 105px;
    }
    .style10
    {
        color: #0000FF;
    }
    .style11
    {
        text-decoration: underline;
    }
    .style12
    {
        text-align: right;
    }
</style>
<script type="text/javascript">

    // Submit Button
    function OnSumbitButtonClick(s, e) {
        var tabPageCount = PageControl.GetTabCount();
        for (var i = 0; i < tabPageCount; i++) {
            PageControl.SetActiveTab(PageControl.GetTab(i));
            var editorsContainerId = "tblContainer" + i;
            if (!ASPxClientEdit.ValidateEditorsInContainerById(editorsContainerId)) {
                e.processOnServer = false;
                break;
            }
        }
    }

    </script>
<table align="center">
    <tr>
        <td style="text-align: center; direction: rtl;">
            <asp:Panel ID="pnlResult" runat="server" Visible="False">
                <table class="style7">
                    <tr>
                        <td class="style12" bgcolor="Yellow">
                            <asp:Label runat="server" Text="رقم الرساله" Font-Bold="True" Font-Size="Large" 
                                ID="Label3"></asp:Label>
                        </td>
                        <td bgcolor="Yellow" class="style12">
                            <asp:Label runat="server" Font-Size="Large" ForeColor="Blue" ID="lbladdno0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12" bgcolor="Yellow">
                            <asp:Label runat="server" Text="البريد" Font-Bold="True" Font-Size="Large" 
                                ID="Label4"></asp:Label>
                        </td>
                        <td bgcolor="Yellow" class="style12">
                            <asp:Label runat="server" Font-Size="Large" ForeColor="Blue" ID="lblmail0"></asp:Label>
                        </td>
                    </tr>
                </table>
                
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td style="text-align: center; direction: ltr;" class="style10">
            <strong><span class="style11"><em>تسجيل بيانات السادة الحاصلين على درجة 
            الماجستير أو الدكتوراة</em></span>
            <br />
            الرجاء استكمال كافة البيانات قبل الضغط على مفتاح ارسال....اذا واجهتك مشكلة في 
            التسجيل برجاء اخبارنا على الدعم الفني بالصفحة الرئيسية للموقع<br />
            بعد استكمال التسجيل تظهر لك رسالة تفيدكم برقم التسجيل وبريدكم الالكتروني 
            للاستعلام فيما بعد<br />
            سوف تصلكم رسالة على بريدكم الالكتروني تفيد بنجاح عملية التسجيل </strong>
        </td>
    </tr>
    <tr>
        <td style="text-align: left; direction: ltr;">
            <dx1:ASPxValidationSummary ID="ASPxValidationSummaryMain" runat="server" ShowErrorsInEditors="True"
                ValidationGroup="errorGrp" RightToLeft="True" HorizontalAlign="Center" 
                RenderMode="OrderedList" VerticalAlign="Middle">
                <Paddings PaddingLeft="400px" />
            </dx1:ASPxValidationSummary>
        </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <dx:ASPxPageControl ID="ASPxPageControlEditor" runat="server" 
                ClientInstanceName="PageControl" ActiveTabIndex="3" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Font-Bold="False"
                RightToLeft="True" TabAlign="Center" 
                style="text-align: center; direction: ltr;">
                <TabPages>
                    <dx:TabPage Text="بيانات الماجستير او الدكتوراة">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table align="center" dir="rtl" 
                                    style="border-style: solid; height: 300px; width: 815px;" 
                                    ID="tblContainer3">
                                    <tr>
                                        <td style="width: 150px;">
                                            <dx1:ASPxLabel ID="ASPxLabel45" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="المؤهل : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px;">
                                            <dx1:ASPxComboBox ID="mohqual" runat="server" AutoPostBack="True" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSmohqual" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="25" TextField="qualm" ValueField="qualmid" Width="200px" OnSelectedIndexChanged="mohqual_SelectedIndexChanged"
                                                Font-Size="Medium">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="qualm" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر مؤهل" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel46" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="اخري : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="mohqualother" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="26"
                                                Width="200px" Font-Size="Medium" Enabled="False">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="داخل مؤهل اخر" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px;">
                                            <dx1:ASPxLabel ID="ASPxLabel47" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="التخصص : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="mohqualspc" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSmohqualspc" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="27" TextField="basicqualspc" ValueField="basicqualspcid" Width="200px"
                                                Font-Size="Medium" AutoPostBack="True" 
                                                OnSelectedIndexChanged="mohqualspc_SelectedIndexChanged">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="basicqualspc" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر تخصص" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel51" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="اخرى : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="mohqualspcs" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="28"
                                                Width="200px" Font-Size="Medium" Enabled="False">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="اجخل تخصص اخر" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel48" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="السنة : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="mohqualyear" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSmohqualyear" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="29" TextField="mohqualyear" ValueField="mohqualyearid" Width="200px"
                                                Font-Size="Medium">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="mohqualyear" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر السنه" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel49" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="التقدير : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="mohqualtakid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSmohqualtakid" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="30" TextField="mohqualtak" ValueField="mohqualtakid" 
                                                Width="200px" Font-Size="Medium">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="mohqualtak" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر التقدير" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel50" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="جهة الحصول : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="mohqualgeha" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSmohqualgeha" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="31" TextField="basicqualgeha" ValueField="basicqualgehaid" Width="200px"
                                                Font-Size="Medium" AutoPostBack="True" 
                                                OnSelectedIndexChanged="mohqualgeha_SelectedIndexChanged">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="basicqualgeha" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر جهة الحصول" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel52" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="اخرى : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="mohqualgehaother" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="32"
                                                Width="200px" Font-Size="Medium" Enabled="False">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="اجخل جهة الحصول اخري" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="البيانات الوظيفية ">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table align="center" dir="rtl" 
                                    style="border-style: solid; height: 300px; width: 815px;" 
                                    ID="tblContainer2">
                                    <tr>
                                        <td style="width: 150px;">
                                            <dx1:ASPxLabel ID="ASPxLabel38" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="الوظيفة الحالية : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px;">
                                            <dx1:ASPxComboBox ID="jobid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSjobid" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="18" TextField="job" ValueField="jobid" Width="200px" 
                                                Font-Size="Medium" AutoPostBack="True" 
                                                OnSelectedIndexChanged="jobid_SelectedIndexChanged">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="job" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر الوظيفه الحاليه" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel39" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="اخري : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="jobidother" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="19"
                                                Width="200px" Font-Size="Medium" Enabled="False">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="ادخل وظيفة حالية اخري" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px;">
                                            <dx1:ASPxLabel ID="ASPxLabel40" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="محافظة العمل : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="jobgov" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSjobgov" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="20" TextField="gov" ValueField="govid" Width="200px" 
                                                Font-Size="Medium">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="gov" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر  محافظة العمل" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            &nbsp;
                                        </td>
                                        <td style="width: 220px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel42" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="الجهة : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="jobgeha" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSjobgeha" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="21" TextField="jobgeha" ValueField="jobgehaid" Width="200px"
                                                Font-Size="Medium" AutoPostBack="True" 
                                                OnSelectedIndexChanged="jobgeha_SelectedIndexChanged">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="jobgeha" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر الجهة" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel44" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="اخرى : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="jobgehades" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="22"
                                                Width="200px" Font-Size="Medium" Enabled="False">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="ادخل جهة اخري" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel43" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="الحالة الوظيفية : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="jobstatid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSjobstatid" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="23" TextField="jobstat" ValueField="jobstatid" Width="200px" 
                                                Font-Size="Medium" AutoPostBack="True">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="jobstat" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر الحالة الوظيفية" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel45a" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="عدد سنوات الخبرة : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="jobyearno" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="24"
                                                Width="200px" Font-Size="Medium">
                                                <MaskSettings ErrorText="يجب ادخال رقم صحيح" Mask="&lt;0..50&gt;" />
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="ادخل عدد سنوات الخبرة" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="بيانات المؤهل الاصلي ">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table align="center" dir="rtl" style="border-style: solid; height: 300px; " 
                                    ID="tblContainer1">
                                    <tr>
                                        <td class="style4">
                                            <dx1:ASPxLabel ID="ASPxLabel14" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Font-Size="Large" Text="المؤهل الاساسي : ">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td class="style5">
                                            <dx1:ASPxComboBox ID="basicqualid" runat="server" AutoPostBack="True" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                DataSourceID="DSbasicqualid" Font-Size="Medium" 
                                                OnSelectedIndexChanged="basicqualid_SelectedIndexChanged" Spacing="0" 
                                                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="11" 
                                                TextField="qual" ValueField="qualid" Width="200px">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="qual" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر المؤهل الاساسي" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td class="style6">
                                            <dx1:ASPxLabel ID="ASPxLabel16" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Font-Size="Large" Text="اخري : ">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td class="dxtcLeftAlignCell_DevEx" style="width: 200px">
                                            <dx1:ASPxTextBox ID="basicqualother" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Enabled="False" Font-Size="Medium" 
                                                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="12" 
                                                Width="200px">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="ادخل مؤهل اساسي اخر" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <dx1:ASPxLabel ID="ASPxLabel15" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Font-Size="Large" Text="التخصص : ">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td class="style5">
                                            <dx1:ASPxComboBox ID="basicqualspcid" runat="server" AutoPostBack="True" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                DataSourceID="DSbasicqualspcid" Font-Size="Medium" 
                                                OnSelectedIndexChanged="basicqualspcid_SelectedIndexChanged" Spacing="0" 
                                                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="13" 
                                                TextField="basicqualspc" ValueField="basicqualspcid" Width="200px">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="basicqualspc" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر  التخصص" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td class="style6">
                                            <dx1:ASPxLabel ID="ASPxLabel17" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Font-Size="Large" Text="تخصصات اخرى : ">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td class="dxtcLeftAlignCell_DevEx" style="width: 200px">
                                            <dx1:ASPxTextBox ID="basicqualspcidother" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Enabled="False" Font-Size="Medium" 
                                                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="14" 
                                                Width="200px">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="ادخل تخصص اخر" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <dx1:ASPxLabel ID="ASPxLabel35" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Font-Size="Large" Text="سنة المؤهل الاصلي : ">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td class="style5">
                                            <dx1:ASPxComboBox ID="basicqualyearid" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                DataSourceID="DSbasicqualyearid" Font-Size="Medium" Spacing="0" 
                                                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="15" 
                                                TextField="basicqualyear" ValueField="basicqualyearid" Width="200px">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="basicqualyear" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر سنة المؤهل الاصلي" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td class="style6">
                                            &nbsp;
                                        </td>
                                        <td class="dxtcLeftAlignCell_DevEx" style="width: 200px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <dx1:ASPxLabel ID="ASPxLabel36" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Font-Size="Large" Text="جهة المؤهل الاصلي : ">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td class="style5">
                                            <dx1:ASPxComboBox ID="basicqualgehaid" runat="server" AutoPostBack="True" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                DataSourceID="DSbasicqualgehaid" Font-Size="Medium" 
                                                OnSelectedIndexChanged="basicqualgehaid_SelectedIndexChanged" Spacing="0" 
                                                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="16" 
                                                TextField="basicqualgeha" ValueField="basicqualgehaid" Width="200px">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="basicqualgeha" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر جهة المؤهل الاصلي" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td class="style6">
                                            <dx1:ASPxLabel ID="ASPxLabel37" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Font-Size="Large" Text="اخرى : ">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td class="dxtcLeftAlignCell_DevEx" style="width: 200px">
                                            <dx1:ASPxTextBox ID="basicqualgehaother" runat="server" 
                                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                                Enabled="False" Font-Size="Medium" 
                                                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="17" 
                                                Width="200px">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField ErrorText="ادخل جهة مؤهل اصلي اخر" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="البيانات الاساسية">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table align="center" dir="rtl" 
                                    style="border-style: solid; height: 300px; width: 815px;" 
                                    ID="tblContainer0">
                                    <tr>
                                        <td colspan="2" style="text-align: left; direction: rtl;">
                                            <dx1:ASPxLabel ID="ASPxLabel34" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="نوع المؤهل : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td colspan="2" style="text-align: right">
                                            <dx1:ASPxComboBox ID="mohtypeid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSmohtypeid" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="1" TextField="mohtype" ValueField="mohtypeid" Width="200px" 
                                                Font-Size="Medium">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="mohtype" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر نوع المؤهل" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px;">
                                            <dx1:ASPxLabel ID="ASPxLabel2" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="الاســـم : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="coname" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="2"
                                                Width="200px" Font-Size="Medium">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="ادخل الاسم" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel1" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="الرقم القومي : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="nid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="3"
                                                Width="200px" Font-Size="Medium" MaxLength="14">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="ادخل الرقم القومي" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel3" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="النوع : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="genderid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSgenderid" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="4" TextField="gender" ValueField="genderid" Width="200px" 
                                                Font-Size="Medium">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="الاسم" FieldName="gender" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر النوع" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel7" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="تاريخ الميـــــلاد : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxDateEdit ID="bdate" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DisplayFormatString="d/M/yyyy" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="5" Width="200px" Font-Size="Medium">
                                                <CalendarProperties>
                                                    <HeaderStyle Spacing="1px" />
                                                </CalendarProperties>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر تاريخ الميلاد" />
                                                </ValidationSettings>
                                            </dx1:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel12" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="هاتف رقــــــــم : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="tel" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="6"
                                                Width="200px" Font-Size="Medium">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="ادخل رقم الهاتف" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel11" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="مـــوبيـــــل : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="mobil" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="7"
                                                Width="200px" Font-Size="Medium">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="ادخل رقم الموبيل" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel10" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="بريد الكتروني : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxTextBox ID="mail" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="8"
                                                Width="200px" Font-Size="Medium">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="ادخل البريد الالكتروني" />
                                                    <RegularExpression ErrorText="بريد غير صحيح" 
                                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                        </td>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel4" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="محافظة السكن : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td style="width: 220px">
                                            <dx1:ASPxComboBox ID="govid" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" DataSourceID="DSgovid" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                                                TabIndex="9" TextField="gov" ValueField="govid" Width="200px" 
                                                Font-Size="Medium">
                                                <Columns>
                                                    <dx1:ListBoxColumn Caption="اختار جنسيـــه" FieldName="gov" />
                                                </Columns>
                                                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <LoadingPanelStyle ImageSpacing="5px">
                                                </LoadingPanelStyle>
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="اختر  محافظة السكن" />
                                                </ValidationSettings>
                                            </dx1:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px">
                                            <dx1:ASPxLabel ID="ASPxLabel9" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" Text="العنوان : " Font-Size="Large">
                                            </dx1:ASPxLabel>
                                        </td>
                                        <td colspan="3">
                                            <dx1:ASPxTextBox ID="address" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                                                CssPostfix="DevEx" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TabIndex="10"
                                                Width="400px" Font-Size="Medium">
                                                <ValidationSettings ErrorTextPosition="Top" SetFocusOnError="True" 
                                                    ValidationGroup="errorGrp">
                                                    <RequiredField IsRequired="True" ErrorText="ادخل العنوان" />
                                                </ValidationSettings>
                                            </dx1:ASPxTextBox>
                                            &nbsp; &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
                <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
                </LoadingPanelImage>
                <LoadingPanelStyle ImageSpacing="5px">
                </LoadingPanelStyle>
                
                <Paddings Padding="2px" PaddingLeft="5px" PaddingRight="5px" />
                <ActiveTabStyle Font-Bold="True" ForeColor="Blue">
                    <Border BorderColor="Blue" />
                </ActiveTabStyle>
                <TabStyle Font-Bold="False" Font-Size="Large">
                </TabStyle>
                <ContentStyle Font-Bold="False">
                    <Paddings Padding="12px" />
                    <Border BorderColor="#9DA0AA" BorderStyle="Solid" BorderWidth="1px" />
                </ContentStyle>
            </dx:ASPxPageControl>
        </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <dx1:ASPxButton ID="btnsend" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" OnClick="btnsend_Click" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
                Text="ا رســــــــــــــال" RightToLeft="True" 
                ValidationGroup="errorGrp" TabIndex="33"
                Font-Bold="False" Font-Italic="False" Font-Size="Large" Width="150px">
                <ClientSideEvents Click="OnSumbitButtonClick" />
            </dx1:ASPxButton>
        </td>
    </tr>
</table>
<asp:AccessDataSource ID="DSmohtypeid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [mohtypeid], [mohtype] FROM [mohtype]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSgenderid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [genderid], [gender] FROM [gender]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSgovid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT * FROM [gov]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSbasicqualid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [qualid], [qual] FROM [qual]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSbasicqualspcid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [basicqualspcid], [qualid], [basicqualspc] FROM [basicqualspc] WHERE ([qualid] = ?)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HFbasicqualspcid" Name="qualid" PropertyName="Value"
            Type="Int32" />
    </SelectParameters>
</asp:AccessDataSource>
<asp:AccessDataSource ID="DSbasicqualyearid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [basicqualyearid], [basicqualyear] FROM [basicqualyear]">
</asp:AccessDataSource>
<asp:AccessDataSource ID="DSbasicqualgehaid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [basicqualgehaid], [basicqualgeha] FROM [qualgeha]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSjobid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [jobid], [job] FROM [job]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSjobgov" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [govid], [gov] FROM [gov]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSjobgeha" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [jobgehaid], [jobgeha] FROM [jobgeha]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSjobstatid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [jobstatid], [jobstat] FROM [jobstat]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSmohqual" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [qualmid], [qualm] FROM [qualm]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSmohqualspc" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [basicqualspcid], [qualid], [basicqualspc] FROM [basicqualspc] WHERE ([qualid] = ?)">
    <SelectParameters>
        <asp:ControlParameter ControlID="HFmohqual" DefaultValue="" Name="qualid" PropertyName="Value"
            Type="Int32" />
    </SelectParameters>
</asp:AccessDataSource>
<asp:AccessDataSource ID="DSmohqualyear" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [mohqualyearid], [mohqualyear] FROM [mohqualyear]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSmohqualtakid" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [mohqualtakid], [mohqualtak] FROM [mohqualtak]"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSmohqualgeha" runat="server" DataFile="../App_Data/ABOUT.mdb"
    SelectCommand="SELECT [basicqualgehaid], [basicqualgeha] FROM [qualgeha]"></asp:AccessDataSource>
<asp:HiddenField ID="HFbasicqualspcid" runat="server" />
<asp:HiddenField ID="HFmohqual" runat="server" />
<dx1:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" AllowDragging="True"
    ClientInstanceName="popupeditor" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
    CssPostfix="DevEx" HeaderText="رسالـــه" MinHeight="80px" MinWidth="200px" Modal="True"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css"
    Style="text-align: center" Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
    </LoadingPanelImage>
    
    <ClientSideEvents Closing="function(s, e) {
    window.location.href = 'http://ets.eg/';
}" />
    
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False" HorizontalAlign="Center"
        VerticalAlign="Middle">
        <Border BorderStyle="Solid" BorderWidth="10px" />
    </ContentStyle>
    <HeaderStyle>
        <Paddings PaddingLeft="7px" />
    </HeaderStyle>
    <LoadingPanelStyle ImageSpacing="5px">
    </LoadingPanelStyle>
    <ModalBackgroundStyle BackColor="Gray">
    </ModalBackgroundStyle>
    <ContentCollection>
        <dx1:popupcontrolcontentcontrol runat="server" SupportsDisabledAttribute="True">
        <table class="style7">
                    <tr>
                        <td bgcolor="Yellow" colspan="2">
                            <asp:Label ID="LblState" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="Yellow" class="style9">
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" 
                                Text="رقم الرساله"></asp:Label>
                        </td>
                        <td bgcolor="Yellow">
                            <asp:Label ID="lbladdno" runat="server" Font-Size="Large" ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9" bgcolor="Yellow">
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                Font-Size="Large" Text="البريد"></asp:Label>
                        </td>
                        <td bgcolor="Yellow">
                            <asp:Label ID="lblmail" runat="server" Font-Size="Large" 
                ForeColor="Blue"></asp:Label>
                        </td>
                    </tr>
                </table>
            </dx1:popupcontrolcontentcontrol>
    </ContentCollection>
</dx1:ASPxPopupControl>

