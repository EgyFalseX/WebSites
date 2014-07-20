<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="calc.aspx.cs" Inherits="calc" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 276px;
        }
        .auto-style2
        {
            height: 32px;
            direction: rtl;
        }
        .auto-style3
        {
            text-align: center;
        }
        .auto-style4
        {
            height: 32px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td class="auto-style4" colspan="2">
                <dx:ASPxDateEdit ID="deBirthDate" runat="server">
                </dx:ASPxDateEdit>
            </td>
            <td class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="تاريخ الميلاد">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <dx:ASPxCheckBox ID="cbArmala" runat="server" Height="21px" Text="ارملة" Width="57px">
                </dx:ASPxCheckBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" style="border-style: solid; background-color: #C0C0C0">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="الاشتراك">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style3" style="border-style: solid; background-color: #C0C0C0">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="العدد">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style3" style="border-style: solid; background-color: #C0C0C0">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="الفئة">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <dx:ASPxLabel ID="lblA3daa" runat="server">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style3">
                <dx:ASPxTextBox ID="tbA3daa" runat="server" Width="50px" ReadOnly="True" Text="1">
                </dx:ASPxTextBox>
            </td>
            <td class="dxtcRightAlignCell">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="العضو">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <dx:ASPxLabel ID="lblZoga" runat="server">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style3">
                <dx:ASPxTextBox ID="tbZoga" runat="server" Width="50px">
                    <MaskSettings Mask="&lt;0..4&gt;" />
                </dx:ASPxTextBox>
            </td>
            <td class="dxtcRightAlignCell">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="زوج/زوجة">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <dx:ASPxLabel ID="lblAbnaa" runat="server">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style3">
                <dx:ASPxTextBox ID="tbAbnaa" runat="server" Width="50px">
                    <MaskSettings Mask="&lt;0..10&gt;" />
                </dx:ASPxTextBox>
            </td>
            <td class="dxtcRightAlignCell">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="ابناء">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <dx:ASPxLabel ID="lblWaldeen" runat="server">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style3">
                <dx:ASPxTextBox ID="tbWaldeen" runat="server" Width="50px">
                    <MaskSettings Mask="&lt;0..2&gt;" />
                </dx:ASPxTextBox>
            </td>
            <td class="dxtcRightAlignCell">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="الوالدين">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">
                <dx:ASPxButton ID="btnCalc" runat="server" OnClick="btnCalc_Click" Text="احسب" Width="120px">
                </dx:ASPxButton>
            </td>
            <td class="dxtcRightAlignCell">&nbsp;</td>
        </tr>
    </table>
    <p style="height: 8px">
    </p>
    <table align="center" class="auto-style1">
        <tr>
            <td bgcolor="Yellow" class="auto-style3" style="border-style: solid; border-color: #FF0000">
                <dx:ASPxLabel ID="lblAgmalAshtrak" runat="server">
                </dx:ASPxLabel>
            </td>
            <td class="dxtcRightAlignCell" style="border-style: solid; border-color: #FF0000">
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="اجمالي الاشتراك">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <dx:ASPxLabel ID="lblKtaab" runat="server" Text="10">
                </dx:ASPxLabel>
            </td>
            <td class="dxtcRightAlignCell">
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="ثمن كتاب">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <dx:ASPxLabel ID="lblEdarya" runat="server" Text="35">
                </dx:ASPxLabel>
            </td>
            <td class="dxtcRightAlignCell">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="ادارية">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <dx:ASPxLabel ID="lblKroot" runat="server">
                </dx:ASPxLabel>
            </td>
            <td class="dxtcRightAlignCell">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" style="direction: ltr" Text="كروت عضوية">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
    <p style="height: 12px">
    </p>
    <table align="center" class="auto-style1">
        <tr>
            <td class="auto-style3" style="border-style: solid; border-color: #FF0000; background-color: #FFFF00">
                <dx:ASPxLabel ID="lblAgmaliNhaai" runat="server">
                </dx:ASPxLabel>
            </td>
            <td style="border-style: solid; border-color: #FF0000;">
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" style="text-align: right" Text="الاجمالي النهائي">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
</asp:Content>

