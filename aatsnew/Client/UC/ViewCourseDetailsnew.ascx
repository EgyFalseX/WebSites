<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewCourseDetailsnew.ascx.cs" Inherits="ViewCourseDetails" %>
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
    .auto-style1 {
        direction: rtl;
        text-align: center;
        height: 70px;
    }
    </style>

 
<div dir="rtl"> 
    <table class="style11" align="center">
        <tr>
            <td class="style12" valign="top">
                <telerik:RadComboBox ID="RCBCources" runat="server" DataSourceID="DSCources" 
                                    DataTextField="CourseName" DataValueField="CourseId" 
                                    Width="220px" oninit="RCBCources_Init" AutoPostBack="True">
                </telerik:RadComboBox>
                
                <br />
                <telerik:RadButton ID="SelectCource" runat="server" 
                                    onclick="SelectCource_Click" Text="اختر" Width="120px">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" valign="top">
                <telerik:RadButton ID="btnCourceNew" runat="server" 
                                    onclick="btnCourceNew_Click" Text="اختر" Width="120px">
                </telerik:RadButton>
            </td>
        </tr>
        <tr>
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
        






