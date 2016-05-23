<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Reservation.ascx.cs" Inherits="Reservation" %>
<script runat="server">

</script>
<style type="text/css">
    .style1
    {
        width: 472px;
    }
    .style2
    {
        height: 32px;
    }
    .style3
    {
        width: 268px;
    }
    .style4
    {
        width: 505px;
    }
    .style6
    {
        text-align: right;
    }
    .style8
    {
        width: 232px;
    }
</style>
<script type="text/javascript">
    // two functions to make page unactive while message is shown
    var modalDiv = null;
    function showModalDiv(sender, args) {
        if (!modalDiv) {
            modalDiv = document.createElement("div");
            modalDiv.style.width = "100%";
            modalDiv.style.height = "100%";
            modalDiv.style.backgroundColor = "#aaaaaa";
            modalDiv.style.position = "absolute";
            modalDiv.style.left = "0px";
            modalDiv.style.top = "0px";
            modalDiv.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=50)";
            modalDiv.style.opacity = ".5";
            modalDiv.style.MozOpacity = ".5";
            modalDiv.setAttribute("unselectable", "on");
            modalDiv.style.zIndex = (sender.get_zIndex() - 1).toString();
            document.body.appendChild(modalDiv);
        }
        modalDiv.style.display = "";
    }
    function hideModalDiv() {
        modalDiv.style.display = "none";
    }
</script>

<table align="center" class="style4">
    <tr>
        <td style="text-align: center">
            <asp:Label ID="LblTitle" runat="server" Font-Size="18pt" Text="حجز الدورة " 
                oninit="LblTitle_Init"></asp:Label>
        </td>
    </tr>
</table>

<table align="center" class="style4">
    <tr>
        <td valign="top">
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanelEdit" runat="server" />
            <telerik:RadAjaxPanel ID="RadAjaxPanelEdit" runat="server">
                <telerik:RadAjaxManager ID="RadAjaxManagerEdit" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanelEdit">
                    <AjaxSettings>
                        <telerik:AjaxSetting AjaxControlID="FrmEditor">
                            <UpdatedControls>
                                <telerik:AjaxUpdatedControl ControlID="FrmEditor" />
                                <telerik:AjaxUpdatedControl ControlID="RadNotificationInfo" />
                            </UpdatedControls>
                        </telerik:AjaxSetting>
                    </AjaxSettings>
                </telerik:RadAjaxManager>
                <div id="FrmEditor">
                    <table class="style1" border="0.9">
                        <tr>
                            <td style="direction: rtl" class="style2" colspan="2">
                                <table align="center" class="style3">
                                    <tr>
                                        <td class="style6">
                                            <asp:RequiredFieldValidator ID="VRTxtTraineeName0" runat="server" ControlToValidate="RTxtTraineeName"
                                                ErrorMessage="ادخل اسمك بالعربيه " Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="style6">
                                            <asp:RequiredFieldValidator ID="VRTxtNameInEnglish" runat="server" 
                                                ControlToValidate="RTxtNameInEnglish" ErrorMessage="ادخل اسمك بالانجليزيه" 
                                                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <asp:RequiredFieldValidator ID="VRCBNationalityId" runat="server" 
                                                ControlToValidate="RCBNationalityId" ErrorMessage="ادخل جنسيتك" 
                                                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="style6">
                                            <asp:RequiredFieldValidator ID="VRCBcountryId" runat="server" 
                                                ControlToValidate="RCBcountryId" ErrorMessage="ادخل دولة الاقامه" 
                                                Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <asp:RequiredFieldValidator ID="VRTxtCity" runat="server" 
                                                ControlToValidate="RTxtCity" ErrorMessage="ادخل مدينتك" Font-Bold="True" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="style6">
                                            <asp:RequiredFieldValidator ID="VRTxttel" runat="server" 
                                                ControlToValidate="RTxttel" ErrorMessage="ادخل هاتفك" Font-Bold="True" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style6">
                                            <asp:RequiredFieldValidator ID="VRTxtMobile" runat="server" 
                                                ControlToValidate="RTxtMobile" ErrorMessage="ادخل جوالك" Font-Bold="True" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                        <td class="style6">
                                            <asp:RequiredFieldValidator ID="VRTxtEmail" runat="server" 
                                                ControlToValidate="RTxtEmail" ErrorMessage="ادخل بريدك" Font-Bold="True" 
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="style2" style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadComboBox ID="RCBCourseId" runat="server" AutoPostBack="True" DataSourceID="DSMenuItem" DataTextField="ItemName" DataValueField="ItemID" TabIndex="2" Width="203px">
                                </telerik:RadComboBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="White" Text="اختر الدورة * :"></asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style8" style="direction: rtl">
                                <telerik:RadTextBox ID="RTxtTraineeName" runat="server" EmptyMessage="ادخل اسمك بالعربيه" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td bgcolor="Gray" style="direction: rtl">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="White" Text="الاسم باللغة العربية * :"></asp:Label>
                            </td>
                            <td style="direction: rtl">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtNameInEnglish" runat="server" EmptyMessage="ادخل اسمك بالانجليزيه"
                                    TabIndex="1" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label2" runat="server" Text="الاسم باللغة الانجليزية * :" 
                                    Font-Bold="True" ForeColor="White"></asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadComboBox ID="RCBNationalityId" runat="server" TabIndex="2" Width="203px"
                                    DataSourceID="DSCdNationality" DataTextField="Nationality" DataValueField="NationalityId">
                                </telerik:RadComboBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="White">الجنسية * :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadComboBox ID="RCBcountryId" runat="server" TabIndex="3" Width="203px"
                                    DataSourceID="DSCdcountry" DataTextField="country" DataValueField="countryId">
                                </telerik:RadComboBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="White">دولة الإقامة *:</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtCity" runat="server" EmptyMessage="ادخل اسم مدينتك" TabIndex="4"
                                    Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="White">المدينة* :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtAddress" runat="server" EmptyMessage="ادخل عنوانك" TabIndex="5"
                                    Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="White">العنوان :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxttel" runat="server" EmptyMessage="ادخل هاتفك" TabIndex="6"
                                    Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="White">الهاتف * :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtMobile" runat="server" EmptyMessage="ادخل جوالك" TabIndex="7"
                                    Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="White">جوال * :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtEmail" runat="server" EmptyMessage="ادخل بريدك الالكتروني"
                                    TabIndex="8" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="White">بريد الكتروني * :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtmony" runat="server" EmptyMessage="ادخل مبلغ الدوره المحول"
                                    TabIndex="9" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="White">المبلغ المحول للدورة  :
                                </asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtaccname" runat="server" EmptyMessage="ادخل اسم صاحب الحساب البنكي"
                                    TabIndex="10" Width="200px">
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" bgcolor="Gray">
                                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="White">اسم صاحب الحساب البنكي المحول منه :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp; &nbsp;</td>
                        </tr>
                    </table>
                </div>
                <div dir="ltr" style="text-align: center">
                    <telerik:RadButton ID="RBtnClear" runat="server" OnClick="RBtnClear_Click" 
                        TabIndex="12" Text="مســـــح" Visible="False">
                    </telerik:RadButton>
                    <telerik:RadButton ID="RBtnSend" runat="server" OnClick="RBtnSend_Click" 
                        TabIndex="11" Text="ارســـال">
                    </telerik:RadButton>
                </div>
                <telerik:RadNotification ID="RadNotificationInfo" runat="server" AutoCloseDelay="0"
                    EnableRoundedCorners="True" OnClientHidden="hideModalDiv" OnClientShowing="showModalDiv"
                    Position="Center" Skin="Default" Animation="Fade" AnimationDuration="1000" Width="400px">
                </telerik:RadNotification>
                <telerik:RadWindowManager ID="RadWindowManagerEdit" runat="server">
                </telerik:RadWindowManager>
            </telerik:RadAjaxPanel>
        </td>
        <td valign="top">
            &nbsp;</td>
    </tr>
</table>
<asp:AccessDataSource ID="DSCdcountry" runat="server" SelectCommand="Select countryId, country From Cdcountry"
    DataFile="~/App_Data/AATSWEB.mdb"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSCdNationality" runat="server" SelectCommand="Select NationalityId, Nationality From CdNationality"
    DataFile="~/App_Data/AATSWEB.mdb"></asp:AccessDataSource>
<asp:AccessDataSource ID="DSMenuItem" runat="server" SelectCommand="SELECT [ItemID], [ItemName] FROM [MenuItem] WHERE ([Show_Hide] = ?)"
    DataFile="~/App_Data/AATSWEB.mdb">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="Show_Hide" Type="Boolean" />
    </SelectParameters>
</asp:AccessDataSource>
