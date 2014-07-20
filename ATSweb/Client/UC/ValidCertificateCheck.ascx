<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ValidCertificateCheck.ascx.cs" Inherits="ValidCertificateCheck" %>
<style type="text/css">
    .style1
    {
        width: 595px;
    }
    .style2
    {
        width: 421px;
    }
    .style3
    {
        width: 268px;
    }
</style>

<table align="center" class="style1">
    <tr>
        <td style="text-align: center; direction: rtl" bgcolor="#E0E0E0">
            <asp:Label ID="Label1" runat="server" Font-Size="18pt" 
                style="font-family: Andalus" 
                
                Text="هذه الخدمه تقدمها الاكاديميه للتأكد من ان الشهاده اصليه ولها مرجعيه في قاعدة البيانات, ويرجي مراجعة خدمة العملاء بشأن أي مشكله في رقم الشهاده.(بريد خدمة العملاء: info@aatsonline.net)" 
                ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center; direction: rtl">
            <asp:Label ID="Label2" runat="server" Text="اكتب الرقم المرجعي للشهاده: "></asp:Label>
            <telerik:RadTextBox ID="RTxtCN" Runat="server" Width="200px">
            </telerik:RadTextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <telerik:RadButton ID="BtnSearch" runat="server" Font-Bold="True" 
                onclick="BtnSearch_Click" Text="استعلام عن الشهاده" Width="150px">
            </telerik:RadButton>
        </td>
    </tr>
</table>
<p style="text-align: center; direction: rtl">
    <br />
    <asp:Label ID="LblState" runat="server" Font-Bold="True" ForeColor="Red" 
        Text="يرجى التأكد من الرقم الذي تم ادخالة أو انه لا توجد شهادة بهذا الرقم" 
        Visible="False"></asp:Label>
</p>
<asp:Panel ID="PnlInfo" runat="server" Visible="False">
    <table align="center" class="style2">
        <tr>
            <td class="style3" style="direction: rtl">
                <asp:Label ID="LblUniqueNo" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td bgcolor="Gray" style="direction: rtl">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                ForeColor="White" Text="الرقم المرجعي: "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" style="direction: rtl">
                <asp:Label ID="LblCourseId" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td bgcolor="Gray" style="direction: rtl">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" 
                ForeColor="White" Text="الدوره التدريبيه: "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" style="direction: rtl">
                <asp:Label ID="LblTraineeID" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td bgcolor="Gray" style="direction: rtl">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                ForeColor="White" Text="اسم المتدرب: "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" style="direction: rtl">
                <asp:Label ID="Lbltrineer" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td bgcolor="Gray" style="direction: rtl">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" 
                ForeColor="White" Text="اسم المدرب: "></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3" style="direction: rtl">
                <asp:Label ID="LblReceiptDate" runat="server" Font-Bold="True"></asp:Label>
            </td>
            <td bgcolor="Gray" style="direction: rtl">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" 
                ForeColor="White" Text="تاريخ اصدار الشهاده: "></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>

