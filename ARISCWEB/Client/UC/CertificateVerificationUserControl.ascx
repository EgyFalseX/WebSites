<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CertificateVerificationUserControl.ascx.cs" Inherits="Client_UC_CertificateVerificationUserControl" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRatingControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx1" %>




<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<style type="text/css">

.dxpControl_Youthful 
{
	color: #7A9F0E;
	font: 12px Tahoma;
}
.dxpSummary_Youthful 
{
	padding: 0px 4px;
}
.dxpDisabled_Youthful
{
	color: #9eb273!important;
	border-color: #abb590;
	cursor: default;
}
.dxpDisabledButton_Youthful 
{
	color: #A1AE7E!important;
	text-decoration: none;
}
.dxpButton_Youthful 
{
	text-decoration: underline;
	cursor: pointer;
}
.dxpCurrentPageNumber_Youthful 
{
	font-weight: bold;
	text-decoration: none;
	color: White;
	background-color: #F4921B;
	padding: 2px 3px 3px;
	white-space: nowrap;
}
.dxpPageNumber_Youthful 
{
	padding: 0px 5px;
	text-decoration: none;
	color: #7A9F0E;
	cursor: pointer;
}
</style>

<table dir="ltr" runat="server" DataSourceID="certificateSqlDataSource">
                                       <tr>
                            <td style="direction: rtl" class="style8" >
                                <dx:ASPxButton ID="selectAddASPxButton" runat="server" Text="بحث" Theme="Glass" Font-Bold="True" OnClick="selectAddASPxButton_Click" ValidationGroup="VG">
                                </dx:ASPxButton>

                                           </td>
                            <td style="direction: rtl" >
                                 <dx:ASPxTextBox ID="codeASPxTextBox" runat="server" Width="200px" 
                ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" MaxLength="500" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Theme="Glass" ViewStateMode="Enabled" >
                                     <ValidationSettings ErrorText="مطلوب" SetFocusOnError="True" ValidationGroup="VG">
                                         <RequiredField ErrorText="" IsRequired="True" />
                                     </ValidationSettings>

            </dx:ASPxTextBox>

                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label1" runat="server" Text="كود الشهادة * :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                                       <tr>
                            <td style="direction: rtl" class="style8" colspan="3" >

                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="إسم المتدرب :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="nameASPxLabel" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color: #008000;">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="إسم الدورة :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="courseASPxLabel" runat="server" ClientInstanceName="courseASPxLabel" style="font-weight: 700; color: #008000;"  >
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="تاريخ بداية الدورة :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="startDateASPxLabel" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color: #008000;" >
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="تاريخ نهاية الدورة :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="endDateASPxLabel" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color: #008000;" >
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                </table>

                                           </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8" colspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8" colspan="3">
                               <dx:ASPxLabel ID="msgNotifyASPxLabel" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color:red;">
                                </dx:ASPxLabel>
                                           </td>
                        </tr>
                                       <tr>
                                           <td class="style8" colspan="3" style="direction: rtl">
                                               <p style="text-align: right">
                                                   (*) بيانات مطلوبة</p>
                                           </td>
                                       </tr>
                                </table>
<asp:SqlDataSource ID="certificateSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\AATSWEB.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT TBLTrainee.TraineeName, TBLTraineeCertificates.ReceiptDate, TBLTraineeCertificates.UniqueNo, TBLCourses.CourseName, TBLTraineeCertificates.CourseId, TBLCourses.StartDate, TBLCourses.EndDate FROM ((TBLTrainee INNER JOIN TBLTraineeCertificates ON TBLTrainee.TraineeID = TBLTraineeCertificates.TraineeID) INNER JOIN TBLCourses ON TBLTraineeCertificates.CourseId = TBLCourses.CourseId) WHERE (TBLTraineeCertificates.UniqueNo = ?)" UpdateCommand="UPDATE TBLFiles SET FileTitle = ?, FileText = ?, FilePath = ?, FileCategoryID = ?, UserName = ? WHERE (FileID = ?)">
    <SelectParameters>
        <asp:ControlParameter ControlID="codeASPxTextBox" Name="?" PropertyName="Text" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="FileTitle" />
        <asp:Parameter Name="FileText" />
        <asp:Parameter Name="FilePath" />
        <asp:Parameter Name="FileCategoryID" />
        <asp:SessionParameter Name="UserName" SessionField="UserName" />
        <asp:Parameter Name="FileID" />
    </UpdateParameters>
</asp:SqlDataSource>




