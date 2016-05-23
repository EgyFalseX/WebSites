<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewCourseDetails.ascx.cs" Inherits="ViewCourseDetails" %>
<style type="text/css">

    .style11
    {
        width: 847px;
    }
    .style1
    {
        width: 645px;
    }
    .style12
    {
        direction: rtl;
    }
    </style>

 
<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td class="style12" valign="top">
                <telerik:RadPanelBar ID="RadPanelBarCourseItem" Runat="server">
                    <Items>
                        <telerik:RadPanelItem runat="server" EnableTheming="True" Height="64px" 
                            ImagePosition="Right" ImageUrl="../images/EditCourseDetails/00.jpg" 
                            NavigateUrl="../CourseViewer.aspx" Owner="RadPanelBarCourseItem" 
                            Text="إختر الدورة التدريبية">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="../images/EditCourseDetails/01.jpg" 
                            NavigateUrl="../ViewCourseDetails.aspx?Courseitem=1&" Owner="RadPanelBarCourseItem" 
                            Text="محاور الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="../images/EditCourseDetails/02.jpg" 
                            NavigateUrl="../ViewCourseDetails.aspx?Courseitem=2&" Owner="RadPanelBarCourseItem" 
                            Text="مدرب الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="../images/EditCourseDetails/03.jpg" 
                            NavigateUrl="../ViewCourseDetails.aspx?Courseitem=3&" Owner="RadPanelBarCourseItem" 
                            Text="مميزات الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="../images/EditCourseDetails/04.jpg" 
                            NavigateUrl="../ViewCourseDetails.aspx?Courseitem=4&" Owner="RadPanelBarCourseItem" 
                            Text="مواعيد الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="../images/EditCourseDetails/05.jpg" 
                            NavigateUrl="../ViewCourseDetails.aspx?Courseitem=5&" Owner="RadPanelBarCourseItem" 
                            Text="الرسوم والحسابات البنكية">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="../images/EditCourseDetails/06.jpg" 
                            NavigateUrl="../AddTrainee.aspx?" Owner="RadPanelBarCourseItem" 
                            Text="حجز الدورة">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
            </td>
            <td dir="ltr" style="text-align: center" class="style1" valign="top">
            <%= LoadContain() %>
            </td>
        </tr>
    </table>
</div>






