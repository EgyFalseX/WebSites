﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuEditor.ascx.cs" Inherits="QAMenuEditor" %>
<style type="text/css">
    .style1
    {
        width: 600px;
        height: 200px;
    }
    .style2
    {
        width: 144px;
    }
    .style3
    {
        width: 144px;
        height: 36px;
    }
    .style4
    {
        height: 36px;
    }
</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td bgcolor="#33CC33" colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" Style="font-size: x-large" Text="ادخال صفحه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="اسم الصفحه"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAdd" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="مسار الصوره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAddImg" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <asp:Label ID="Label10" runat="server" Text="تاريخ الصدار"></asp:Label>
            </td>
            <td align="right">
                <asp:Calendar ID="CReleaseDateAdd" runat="server" BackColor="White" BorderColor="#999999"
                    CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                    ForeColor="Black" Height="180px" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label7" runat="server" Text="نبزه مختصره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAddInfo" runat="server" Width="300px" Height="90px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:LinkButton ID="LinkButton1" runat="server" EnableViewState="False" PostBackUrl="Uploader.aspx">صورة</asp:LinkButton>
            </td>
            <td>
                <asp:ImageButton ID="IBAdd" runat="server" Height="32px" ImageUrl="../images/add.png"
                    OnClick="IBAdd_Click" ToolTip="ادخال" Width="32px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td bgcolor="#33CC33" colspan="2" style="text-align: center">
                <asp:Label ID="Label3" runat="server" Style="font-size: x-large" Text="تعديل صفحه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label4" runat="server" Text="اختار صفحه للتعديل"></asp:Label>
            </td>
            <td class="style4">
                <asp:DropDownList ID="DDLItems" runat="server" DataTextField="ItemName" DataValueField="ItemID"
                    Width="300px" AutoPostBack="True" OnSelectedIndexChanged="DDLItems_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:ImageButton ID="IBDelete" runat="server" Height="32px" ImageUrl="../images/delete.png"
                    OnClientClick="javascript: return confirm('هل انت متاكد ؟')" OnClick="IBDelete_Click"
                    ToolTip="حذف" Width="32px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="اسم الصفحه"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEdit" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label8" runat="server" Text="مسار الصوره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEditImg" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <asp:Label ID="Label11" runat="server" Text="تاريخ الصدار"></asp:Label>
            </td>
            <td align="right">
                <asp:Calendar ID="CReleaseDateEdit" runat="server" BackColor="White" BorderColor="#999999"
                    CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                    ForeColor="Black" Height="180px" Width="200px">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label9" runat="server" Text="معلومه مختصره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEditInfo" runat="server" Width="300px" Height="90px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;
            </td>
            <td>
                <asp:ImageButton ID="IBEdit" runat="server" Height="32px" ImageUrl="../images/edit.png"
                    OnClick="IBEdit_Click" ToolTip="تعديل" Width="32px" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblMsg" runat="server" Style="font-size: x-large"></asp:Label>
            </td>
        </tr>
    </table>
</div>