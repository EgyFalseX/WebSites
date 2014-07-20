<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 264px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Admin"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink7" runat="server" 
                    NavigateUrl="JobsEditor.aspx">اكواد الوظائف</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="LagnaEditor.aspx">اكواد اللجان</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink9" runat="server" 
                    NavigateUrl="MembersEditor.aspx">بيانات الاعضاء</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="MeetingEditor.aspx">بيانات الاجتماعات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="UsersEditor.aspx">المستخدمين</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink13" runat="server" 
                    NavigateUrl="UsersMeetingsEditor.aspx">اجتماعات المستخدمين</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink15" runat="server" 
                    NavigateUrl="AbsentEditor.aspx">الغائبون</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink24" runat="server" 
                    NavigateUrl="DescionEditor.aspx">القرارات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink14" runat="server" 
                    NavigateUrl="AbsentAdminViewer.aspx">الغائبون للمدير</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink16" runat="server" 
                    NavigateUrl="PlanEditor.aspx">الخطط</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HL" runat="server" 
                    NavigateUrl="PlanDetailsEditor.aspx">تفاصيل الخطه</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink17" runat="server" 
                    NavigateUrl="PlanAdminEditor.aspx">الخطط للمدير</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HL0" runat="server" 
                    NavigateUrl="PlanDetailsAdminEditor.aspx">تفاصيل الخطه للمدير</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink18" runat="server" 
                    NavigateUrl="HallEditor.aspx">اكواد القاعات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink21" runat="server" 
                    NavigateUrl="BookingEditor.aspx">الحجز للقاعات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink22" runat="server" 
                    NavigateUrl="BookingAdminEditor.aspx">الحجز للقاعات للادمن</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink8" runat="server" 
                    NavigateUrl="changepassword.aspx">تغير بيانات الدخول</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="User"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink6" runat="server" 
                    NavigateUrl="MeetingViewer.aspx">عرض الاجتماعات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink19" runat="server" 
                    NavigateUrl="PlanViewer.aspx">الخطط للزوار</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink20" runat="server" 
                    NavigateUrl="PlanDetailsAdminViewer.aspx">تفاصيل الخطط للزوار</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink23" runat="server" 
                    NavigateUrl="BookingViewer.aspx">حجز القاعات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink25" runat="server" 
                    NavigateUrl="DescionViewer.aspx">القرارات</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

