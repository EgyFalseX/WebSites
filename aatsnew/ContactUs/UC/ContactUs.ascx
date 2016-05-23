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
        width: 695px;
        text-align: center;
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
                            <td class="style7">
                                <span id="ContentPlaceHolder1_ContactUs1_Label2" style="font-size:14pt;">ا<strong>لأكاديمية 
                                العربية لعلوم التدريب<br />
                                </strong><span id="ContentPlaceHolder1_ContactUs1_Label3" 
                                    style="direction: rtl"><strong>الرياض ( ص ب 120202 الرمز البريدي 11679 )</strong></span></span><strong>&nbsp;
                                </strong><span id="ContentPlaceHolder1_ContactUs1_Label4"><strong>جوال : 
                                0538477076</strong></span><span id="ContentPlaceHolder1_ContactUs1_Label5"><strong><br />
&nbsp;</strong><span id="ContentPlaceHolder1_ContactUs1_Label6"><strong> االمشرف العام
                                <br />
                                <a href="mailto:manager@aatsonline.net">manager@aatsonline.net</a>&nbsp;
                                <br />
                                خدمة العملاء</strong><br />
                                <a href="mailto:info@aatsonline.net"><strong>info@aatsonline.net</strong></a>
                                <br />
            <asp:Button ID="BtnSend1" runat="server" onclick="BtnSend_Click" Text="ممثلو الإكاديمية العربية بالدول العربية" 
                Width="186px" style="font-weight: 700" PostBackUrl="~/about/ViewDetails.aspx?id=52" />
                                </span></span>
                            </td>
                        </tr>
                        </table>
         </td>
    </tr>
    </table>
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
            <asp:Label ID="Label13" runat="server" Text="بريد الكتروني" 
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
            <asp:TextBox ID="Txtmassage" runat="server" Height="82px" 
                style="direction: rtl" TextMode="MultiLine" Width="616px"></asp:TextBox>
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
            <asp:Button ID="BtnSend0" runat="server" onclick="BtnSend_Click" Text="عرض المراسلات" 
                Width="186px" style="font-weight: 700" 
                PostBackUrl="http://aats-online.com/ContactUs/ViewContracUs.aspx" />
        </td>
    </tr>
    <tr>
        <td bgcolor="Yellow" colspan="4" style="text-align: center">
            <asp:Label ID="LblState" runat="server" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
</table>


