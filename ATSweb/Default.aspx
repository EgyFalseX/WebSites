<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 264px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" class="style1">
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Admin"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/EditCourse.aspx">الدورات التدريبيه</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Admin/EditGridCourse.aspx">عرض الدورات التدريبية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Admin/EditTrainee.aspx">عرض حجز الدورات التدريبية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Admin/EditTraineeCertificatesnew.aspx">ادخال بيانات الشهادات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Admin/ContactUs.aspx">اتصل بنا</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Admin/Editadvcourse.aspx">الاعلان عن الدورات التدريبية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="~/Admin/EditConcilor.aspx">مستشارو الاكاديمية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink15" runat="server" 
                    NavigateUrl="~/Admin/EditTrainerType.aspx">فئات المدربين المعتمدين</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink16" runat="server" 
                    NavigateUrl="~/Admin/EditTrainerShow.aspx">المدربون المعتمدون</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink18" runat="server" 
                    NavigateUrl="~/Admin/changepassword.aspx">تغير كلمة المرور</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="User"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Client/ViewCourseDetails.aspx">الاعلان عن الدورات التدريبية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Client/ValidCertificateCheck.aspx">التأكد من الشهادة</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Client/ContactUs.aspx">اتصل بنا</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/Client/Viewadvcourse.aspx">الاعلان عن الدورات التدريبية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/Client/ViewConcilor.aspx">مستشارو الاكاديمية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink17" runat="server" 
                    NavigateUrl="~/Client/ViewTrainerShow.aspx">المدربون المعتمدون</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Skins"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <telerik:RadComboBox ID="RCBSkins" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RCBSkins_SelectedIndexChanged">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" />
                        <telerik:RadComboBoxItem runat="server" Text="Black" Value="Black" />
                        <telerik:RadComboBoxItem runat="server" Text="Default" Value="Default" />
                        <telerik:RadComboBoxItem runat="server" Text="Forest" Value="Forest" />
                        <telerik:RadComboBoxItem runat="server" Text="Hay" Value="Hay" />
                        <telerik:RadComboBoxItem runat="server" Text="Office2007" Value="Office2007" />
                        <telerik:RadComboBoxItem runat="server" Text="Office2010Black" Value="Office2010Black" />
                        <telerik:RadComboBoxItem runat="server" Text="Office2010Blue" Value="Office2010Blue" />
                        <telerik:RadComboBoxItem runat="server" Text="Office2010Silver" Value="Office2010Silver" />
                        <telerik:RadComboBoxItem runat="server" Text="Outlook" Value="Outlook" />
                        <telerik:RadComboBoxItem runat="server" Text="Simple" Value="Simple" />
                        <telerik:RadComboBoxItem runat="server" Text="Sitefinity" Value="Sitefinity" />
                        <telerik:RadComboBoxItem runat="server" Text="Sunset" Value="Sunset" />
                        <telerik:RadComboBoxItem runat="server" Text="Telerik" Value="Telerik" />
                        <telerik:RadComboBoxItem runat="server" Text="Transparent" Value="Transparent" />
                        <telerik:RadComboBoxItem runat="server" Text="Vista" Value="Vista" />
                        <telerik:RadComboBoxItem runat="server" Text="Web20" Value="Web20" />
                        <telerik:RadComboBoxItem runat="server" Text="WebBlue" Value="WebBlue" />
                        <telerik:RadComboBoxItem runat="server" Text="Windows7" Value="Windows7" />
                    </Items>
                </telerik:RadComboBox>
            </td>
        </tr>
    </table>
</asp:Content>
