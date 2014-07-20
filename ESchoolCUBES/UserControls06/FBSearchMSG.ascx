<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FBSearchMSG.ascx.cs" Inherits="FBSearchMSG" %>
<style type="text/css">
    .style1
    {
        width: 53%;
    }
    .style4
    {
        width: 93px;
        height: 30px;
    }
    .style8
    {
        width: 100%;
    }
    .style9
    {
        width: 151px;
    }
    .style10
    {
    }
    .style11
    {
        width: 128px;
    }
    .style12
    {
    }
    .style13
    {
    }
    </style>
<div dir="rtl">

    <table class="style1">
        <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Text="رقم الرسالــــه"></asp:Label>
            </td>
            <td >
                <asp:TextBox ID="TxtMSGSearchNo" runat="server" Width="200px" TabIndex="1"></asp:TextBox>
                <asp:Button ID="BtnSearchMSG" runat="server" Text="بحث" Width="80px" 
                    onclick="BtnSearchMSG_Click" />
                <br />
                <asp:Label ID="LblStatus" runat="server" ForeColor="Red" Text="Status" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td >
    
    <asp:Panel ID="PnlMSG" runat="server" Width="574px" Height="207px" Visible="False">
        <table class="style8">
            <tr>
                <td class="style9">
                    <asp:Label ID="Label2" runat="server" Text="رقم الرساله"></asp:Label>
                </td>
                <td class="style12" colspan="4">
                    <asp:Label ID="LblMSGNo" runat="server" Text="None"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label3" runat="server" Text="اسم الراسل"></asp:Label>
                </td>
                <td class="style13">
                    <asp:Label ID="LblSenderName" runat="server" Text="None"></asp:Label>
                </td>
                <td class="style11" colspan="2">
                    <asp:Label ID="Label5" runat="server" Text="رقم التليفون"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LblSenderPhone" runat="server" Text="None"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label4" runat="server" Text="بريد الراسل"></asp:Label>
                </td>
                <td class="style13">
                    <asp:Label ID="LblSenderMail" runat="server" Text="None"></asp:Label>
                </td>
                <td class="style11" colspan="2">
                    <asp:Label ID="Label10" runat="server" Text="نوع الراسل"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LblSenderType" runat="server" Text="None"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label8" runat="server" Text="تاريخ الرساله"></asp:Label>
                </td>
                <td class="style13">
                    <asp:Label ID="LblMSGDate" runat="server" Text="None"></asp:Label>
                </td>
                <td class="style13">
                    <asp:Label ID="Label25" runat="server" Text="نوع الرساله"></asp:Label>
                </td>
                <td class="style13" colspan="2">
                    <asp:Label ID="LblMSGType" runat="server" Text="None"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label7" runat="server" Text="عنوان الرساله"></asp:Label>
                </td>
                <td class="style12" colspan="4">
                    <asp:Label ID="LblMSGTitle" runat="server" Text="None"></asp:Label>
                </td>
            </tr>
            <tr>
                <td valign="top" class="style9">
                    <asp:Label ID="Label23" runat="server" Text="نص الرساله"></asp:Label>
                </td>
                <td class="style10" colspan="4">
                    <asp:TextBox ID="TxtMSGContain" runat="server" Height="236px" TextMode="MultiLine" 
                        Width="409px" ReadOnly="True" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label9" runat="server" Text="تاريخ الرد"></asp:Label>
                </td>
                <td class="style12" colspan="4">
                    <asp:Label ID="LblRpyDate" runat="server" Text="None"></asp:Label>
                </td>
            </tr>
            <tr>
                <td valign="top" class="style9">
                    <asp:Label ID="Label24" runat="server" Text="نص الرد"></asp:Label>
                </td>
                <td class="style12" colspan="4">
                    <asp:TextBox ID="TxtRpyContian" runat="server" Height="236px" TextMode="MultiLine" 
                        Width="409px" ReadOnly="True" TabIndex="3"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    
            </td>
        </tr>
    </table>
    <br />
    
</div>