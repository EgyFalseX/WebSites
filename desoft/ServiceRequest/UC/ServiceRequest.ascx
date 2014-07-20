<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ServiceRequest.ascx.cs" Inherits="ServiceRequest" %>
<style type="text/css">
    .style3
    {
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

<table align="center" style="width: 781px" border="2">
    <tr>
        <td class="style3" style="text-align: right" colspan="3">
            <asp:DropDownList ID="DDLServices" runat="server" style="direction: rtl" 
                Width="250px" DataSourceID="DSData" DataTextField="servisetype" 
                DataValueField="servisetypeid">
            </asp:DropDownList>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label15" runat="server" Text="اختر خدمه (*)"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right" colspan="3">
            <asp:TextBox ID="tbpname" runat="server" style="direction: rtl" Width="250px" 
                TabIndex="1"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label9" runat="server" Text="الاسم"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right">
            <asp:TextBox ID="tbemail" runat="server" style="direction: rtl" Width="250px" 
                TabIndex="3"></asp:TextBox>
        </td>
        <td class="style5" style="text-align: right; direction: rtl">
            <asp:Label ID="Label13" runat="server" Text="بريد الكتروني (*)"></asp:Label>
        </td>
        <td class="style6" style="text-align: right">
            <asp:TextBox ID="tbmobil" runat="server" style="direction: rtl" Width="250px" 
                TabIndex="2"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label16" runat="server" Text="الجوال"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right">
            <asp:TextBox ID="tbrequest" runat="server" Height="121px" 
                style="direction: rtl" TextMode="MultiLine" Width="500px" TabIndex="4"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl" valign="top">
            <asp:Label ID="Label14" runat="server" Text="الطلب"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right; direction: rtl;">
            &nbsp;</td>
        <td style="text-align: right; direction: rtl" valign="top">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
            <asp:Button ID="BtnClear" runat="server" onclick="BtnClear_Click" Text="مسح" 
                Width="100px" TabIndex="6" />
            <asp:Button ID="BtnSend" runat="server" onclick="BtnSend_Click" Text="ارسال" 
                Width="100px" TabIndex="5" />
        </td>
    </tr>
    <tr>
        <td bgcolor="Yellow" colspan="4" style="text-align: center">
            <asp:Label ID="LblState" runat="server" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
</table>


            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="../App_Data/faservice.mdb" 
                
                
    SelectCommand="SELECT [servisetypeid], [servisetype] FROM [servisetype]">
            </asp:AccessDataSource>
            


