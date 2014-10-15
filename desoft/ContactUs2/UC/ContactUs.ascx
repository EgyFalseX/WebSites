<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUs.ascx.cs" Inherits="ContactUs" %>
<style type="text/css">
    .style1
    {
        width: 737px;
        height: 200px;
    }
    .style2
    {
        width: 629px;
    }
    .style3
    {
        width: 297px;
    }
    .style5
    {
        width: 95px;
    }
    .style6
    {
        width: 268px;
    }
    .style7
    {
        color: #000080;
        font-weight: bold;
    }
    </style>

<table align="center" class="style1">
    <tr>
        <td bgcolor="Blue" style="text-align: center">
            <asp:Label ID="Label1" runat="server" Font-Size="18pt" 
                style="color: #FFFFFF; font-weight: 700" Text="أتصل بنا"></asp:Label>
        </td>
    </tr>

    <tr>
         <td style="text-align: center; direction: rtl">
                    <table align="center" class="style2" dir="ltr" border="2">
                        <tr>
                            <td style="text-align: right">
                                <span class="style7">مرحباً باستفساراتكم ومقترحاتكم وايضاً شكواكم</span><br 
                                    class="style7" />
                                <span class="style7">يتم الرد على المراسلات من خلال وسائل الاتصال المكتوبة
                                </span>
                                <br class="style7" />
                                <span class="style7">في حالة اختياركم عرض رسالتكم على الموقع سيتم عرض الرسالة 
                                والرد عليها </span>
                                <br class="style7" />
                                <span class="style7">بعد موافقة الإدارة على ذلك</span>
                            </td>
                        </tr>
                        </table>
         </td>
    </tr>
    </table>
<p>
</p>
<table align="center" style="width: 781px" border="2">
    <tr>
        <td class="style3" style="text-align: right">
            <asp:Label ID="lblName" runat="server" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
        <td class="style5" style="text-align: left">
            <asp:Label ID="Label16" runat="server" Text="المستخدم" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
        <td class="style6" style="text-align: right">
            <asp:Label ID="lblSchool" runat="server" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
        <td style="text-align: left; direction: rtl">
            <asp:Label ID="Label15" runat="server" Text="مرحبا" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right">
            &nbsp;</td>
        <td class="style5" style="text-align: right">
            &nbsp;</td>
        <td class="style6" style="text-align: right">
            <asp:TextBox ID="Txtconame" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label9" runat="server" Text="الاسم (*)" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right">
            <asp:DropDownList ID="DDLcontypeid" runat="server" style="direction: rtl" 
                Width="250px">
            </asp:DropDownList>
        </td>
        <td class="style5" style="text-align: right; direction: rtl">
            <asp:Label ID="Label11" runat="server" Text="نوع الرسالة (*)" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
        <td class="style6" style="text-align: right">
            <asp:DropDownList ID="DDLsefaid" runat="server" style="direction: rtl" 
                Width="250px">
            </asp:DropDownList>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label10" runat="server" Text="الصفه (*)" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right">
            <asp:TextBox ID="Txtmail" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td class="style5" style="text-align: right; direction: rtl">
            <asp:Label ID="Label13" runat="server" Text="بريد الكتروني (*)" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
        <td class="style6" style="text-align: right">
            <asp:TextBox ID="Txttel" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label12" runat="server" Text="جوال (*)" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right">
            <asp:TextBox ID="Txtmassage" runat="server" Height="121px" 
                style="direction: rtl" TextMode="MultiLine" Width="500px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl" valign="top">
            <asp:Label ID="Label14" runat="server" Text="نص الرساله (*)" 
                style="color: #000080; font-weight: 700"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right; direction: rtl;">
            <asp:CheckBox ID="CBShowOnLine" runat="server" 
                Text="اوافق على عرض رسالتي على الموقع" 
                style="color: #000080; font-weight: 700" />
        </td>
        <td style="text-align: right; direction: rtl" valign="top">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            <asp:Button ID="BtnClear" runat="server" onclick="BtnClear_Click" Text="مسح" 
                Width="100px" style="font-weight: 700" />
            <asp:Button ID="BtnSend" runat="server" onclick="BtnSend_Click" Text="ارسال" 
                Width="100px" style="font-weight: 700" />
        </td>
    </tr>
    <tr>
        <td bgcolor="Yellow" colspan="4" style="text-align: center">
            <asp:Label ID="LblState" runat="server" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
</table>


