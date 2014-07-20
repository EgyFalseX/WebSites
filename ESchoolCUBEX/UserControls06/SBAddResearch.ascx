<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SBAddResearch.ascx.cs" Inherits="UserControls_SBAddResearch" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 33%;
    }
    .style2
    {
        width: 148px;
    }
</style>
<div dir="rtl">
    <table class="style1" dir="rtl">
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label1" runat="server" Text="موضوع البحث"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtResearchSubject" runat="server" Width="276px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label3" runat="server" Text="تاريخ البحث"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtResearchDate" runat="server" Width="276px"></asp:TextBox>
                <cc1:CalendarExtender ID="CalendarExtenderResearch" runat="server" 
                    TargetControlID="TxtResearchDate">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label5" runat="server" Text="هدف البحث"></asp:Label>
            </td>
            <td valign ="top">
                <asp:TextBox ID="TxtAim" runat="server" Height="108px" TextMode="MultiLine" 
                    Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="ارفاق ملف"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUploadResearch" runat="server" Width="278px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnSaveResearch" runat="server" onclick="BtnSaveResearch_Click" 
                    Text="حفظ البحث" Width="95px" />
                <asp:Label ID="LblResearchError" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</div>