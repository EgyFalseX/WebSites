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
        text-align: center;
    }
    </style>

 
<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td class="style12" valign="top">
              
            </td>
            <td class="style12" valign="top">
                <telerik:RadComboBox ID="RCBCources" runat="server" DataSourceID="DSCources" 
                                    DataTextField="CourseName" DataValueField="CourseId" 
                                    Width="220px" oninit="RCBCources_Init">
                </telerik:RadComboBox>
                
                <br />
                <telerik:RadButton ID="SelectCource" runat="server" 
                                    onclick="SelectCource_Click" Text="اختر" Width="120px">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td class="style12" valign="top">
                <telerik:RadPanelBar ID="RadPanelBarCourseItem" Runat="server" 
                    style="text-align: center">
                    <Items>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="http://aats-online.com/Client/images/EditCourseDetails/01.jpg" 
                            NavigateUrl="http://aats-online.com/Client/ViewCourseDetails.aspx?Courseitem=1&" Owner="RadPanelBarCourseItem" 
                            Text="محاور الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="http://aats-online.com/Client/images/EditCourseDetails/02.jpg" 
                            NavigateUrl="http://aats-online.com/Client/ViewCourseDetails.aspx?Courseitem=2&" Owner="RadPanelBarCourseItem" 
                            Text="مدرب الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="http://aats-online.com/Client/images/EditCourseDetails/03.jpg" 
                            NavigateUrl="http://aats-online.com/Client/ViewCourseDetails.aspx?Courseitem=3&" Owner="RadPanelBarCourseItem" 
                            Text="مميزات الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="http://aats-online.com/Client/images/EditCourseDetails/04.jpg" 
                            NavigateUrl="http://aats-online.com/Client/ViewCourseDetails.aspx?Courseitem=4&" Owner="RadPanelBarCourseItem" 
                            Text="مواعيد الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="http://aats-online.com/Client/images/EditCourseDetails/05.jpg" 
                            NavigateUrl="http://aats-online.com/Client/ViewCourseDetails.aspx?Courseitem=5&" Owner="RadPanelBarCourseItem" 
                            Text="الرسوم والحسابات البنكية">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="http://aats-online.com/Client/images/EditCourseDetails/06.jpg" 
                            NavigateUrl="http://aats-online.com/Client/AddTrainee.aspx?" Owner="RadPanelBarCourseItem" 
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






            <asp:AccessDataSource ID="DSCources"
                runat="server" 
                DataFile="../../App_Data/AATSWEB.mdb" 
                
    SelectCommand="SELECT [CourseId], [CourseName] FROM [TBLCourses] WHERE (ShowOnline = true)">
            </asp:AccessDataSource>
        






