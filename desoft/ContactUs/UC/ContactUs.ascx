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
        width: 276px;
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
                            <td colspan="2" style="text-align: right">
                                <asp:Label ID="Label2" runat="server" Font-Size="14pt" 
                                    Text="الأكاديمية العربية لعلوم التدريب "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl; text-align: right;">
                                <asp:Label ID="Label4" runat="server" Text="جوال : 0538477076"></asp:Label>
                            </td>
                            <td style="text-align: right; direction: rtl">
                                <asp:Label ID="Label3" runat="server" style="direction: rtl" 
                                    Text="ممثل الأكاديمية بالسعودية   ( ص ب 120202  الرمز البريدي 11679 )"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; direction: rtl">
                                <asp:Label ID="Label6" runat="server" 
                                    Text="المشرف العام : manager@aatsonline.net"></asp:Label>
                            </td>
                            <td style="text-align: right; direction: rtl">
                                <asp:Label ID="Label5" runat="server" 
                                    Text="خدمة العملاء :      info@aatsonline.net "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label8" runat="server" Text="جوال : 0105032037"></asp:Label>
                            </td>
                            <td style="text-align: right; direction: rtl">
                                <asp:Label ID="Label7" runat="server" style="direction: rtl" 
                                    Text="ممثل الأكاديمية في مصر   ( الجمعية الأهلية للحاسبات والنظم  )"></asp:Label>
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
            &nbsp;</td>
        <td class="style5" style="text-align: right">
            &nbsp;</td>
        <td class="style6" style="text-align: right">
            <asp:TextBox ID="Txtconame" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label9" runat="server" Text="الاسم (*)"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right">
            <asp:DropDownList ID="DDLcontypeid" runat="server" style="direction: rtl" 
                Width="250px">
            </asp:DropDownList>
        </td>
        <td class="style5" style="text-align: right; direction: rtl">
            <asp:Label ID="Label11" runat="server" Text="نوع الرسالة (*)"></asp:Label>
        </td>
        <td class="style6" style="text-align: right">
            <asp:DropDownList ID="DDLsefaid" runat="server" style="direction: rtl" 
                Width="250px">
            </asp:DropDownList>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label10" runat="server" Text="الصفه (*)"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right">
            <asp:TextBox ID="Txtmail" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td class="style5" style="text-align: right; direction: rtl">
            <asp:Label ID="Label13" runat="server" Text="بريد الكتروني"></asp:Label>
        </td>
        <td class="style6" style="text-align: right">
            <asp:TextBox ID="Txttel" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label12" runat="server" Text="جوال (*)"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right">
            <asp:TextBox ID="Txtmassage" runat="server" Height="121px" 
                style="direction: rtl" TextMode="MultiLine" Width="500px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl" valign="top">
            <asp:Label ID="Label14" runat="server" Text="نص الرساله (*)"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right; direction: rtl;">
            <asp:CheckBox ID="CBShowOnLine" runat="server" 
                Text="اوافق على عرض رسالتي على الموقع" />
        </td>
        <td style="text-align: right; direction: rtl" valign="top">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            <asp:Button ID="BtnClear" runat="server" onclick="BtnClear_Click" Text="مسح" 
                Width="100px" />
            <asp:Button ID="BtnSend" runat="server" onclick="BtnSend_Click" Text="ارسال" 
                Width="100px" />
        </td>
    </tr>
    <tr>
        <td bgcolor="Yellow" colspan="4" style="text-align: center">
            <asp:Label ID="LblState" runat="server" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
</table>


