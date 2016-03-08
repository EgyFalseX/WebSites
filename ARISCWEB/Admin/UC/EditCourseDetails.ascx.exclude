<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditCourseDetails.ascx.cs" Inherits="EditCourseDetails" %>
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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
 
<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td class="style12">
                <telerik:RadPanelBar ID="RadPanelBarCourseItem" Runat="server">
                    <Items>
                        <telerik:RadPanelItem runat="server" EnableTheming="True" Height="64px" 
                            ImagePosition="Right" ImageUrl="~/images/EditCourseDetails/00.jpg" 
                            NavigateUrl="../CourseViewer.aspx" Owner="RadPanelBarCourseItem" 
                            Text="إختر الدورة التدريبية">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="~/images/EditCourseDetails/01.jpg" 
                            NavigateUrl="../EditCourseDetails.aspx?Courseitem=1&" Owner="RadPanelBarCourseItem" 
                            Text="محاور الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="~/images/EditCourseDetails/02.jpg" 
                            NavigateUrl="../EditCourseDetails.aspx?Courseitem=2&" Owner="RadPanelBarCourseItem" 
                            Text="مدرب الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="~/images/EditCourseDetails/03.jpg" 
                            NavigateUrl="../EditCourseDetails.aspx?Courseitem=3&" Owner="RadPanelBarCourseItem" 
                            Text="مميزات الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="~/images/EditCourseDetails/04.jpg" 
                            NavigateUrl="../EditCourseDetails.aspx?Courseitem=4&" Owner="RadPanelBarCourseItem" 
                            Text="مواعيد الدورة">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="~/images/EditCourseDetails/05.jpg" 
                            NavigateUrl="../EditCourseDetails.aspx?Courseitem=5&" Owner="RadPanelBarCourseItem" 
                            Text="الرسوم والحسابات البنكية">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="~/images/EditCourseDetails/06.jpg" 
                            NavigateUrl="../Default.aspx" Owner="RadPanelBarCourseItem" 
                            Text="حجز الدورة">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
            </td>
            <td dir="ltr" style="text-align: right" class="style1">
            <textarea name="editor1" cols="20" rows="1">&lt;p&gt;<%=LoadPage() %>&lt;/p&gt;</textarea>
			<script type="text/javascript">
			    CKEDITOR.replace('editor1');
			</script>
            <br />
            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>


