<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SBAddStuBook.ascx.cs" Inherits="UserControls_SBAddStuBook" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 32%;
    }
    .style2
    {
        width: 101px;
    }
</style>
<div dir="rtl">
    <table dir ="rtl" class="style1">
        <tr>
            <td  colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="كتاب اعجبني" 
                    style="font-weight: 700"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="اسم الكتاب"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtBookName" runat="server" TabIndex="1" Width="266px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="المؤلف"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtBookOwner" runat="server" TabIndex="3" Width="266px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="تاريخ الاصدار"></asp:Label>
            </td>
            <td>
                <cc1:CalendarExtender ID="CalendarExtenderBook" runat="server" 
                    TargetControlID="TxtBookDate">
                </cc1:CalendarExtender>
                <asp:TextBox ID="TxtBookDate" runat="server" TabIndex="3" Width="266px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="معلومات عن الكتاب"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtBookDetial" runat="server" Height="94px" TabIndex="4" 
                    TextMode="MultiLine" Width="268px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnAddBookInfo" runat="server" onclick="BtnAddBookInfo_Click" 
                    style="height: 26px" TabIndex="5" Text="اضافة الكتاب" Width="110px" />
                <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</div>