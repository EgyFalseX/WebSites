<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FBSendMSG.ascx.cs" Inherits="FBSendMSG" %>
<style type="text/css">
    .style1
    {
        width: 51%;
    }
    .style3
    {
    }
    .style4
    {
    }
</style>
<div dir="rtl">
    <table class="style1">
        <tr>
            <td colspan="4" style="text-align: center">
                <asp:Label ID="Label1" runat="server" style="font-weight: 700" 
                    Text="ارسال رساله"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: right">
                <asp:RequiredFieldValidator ID="RFVMSGType" runat="server" 
                    ControlToValidate="TxtSenderName" ErrorMessage="ادخل اسم الراسل" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TxtSenderAddress" ErrorMessage="ادخل بريد الراسل" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TxtSenderPhone" ErrorMessage="تليفون الراسل" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TxtMSGAddress" ErrorMessage=" عنوان الرساله" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TxtMSGContain" ErrorMessage=" نص الرساله" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label2" runat="server" Text="نوع الرساله"></asp:Label>
            </td>
            <td class="style3">
                <asp:DropDownList ID="DDLMSGType" runat="server" Height="22px" Width="200px" 
                    TabIndex="1">
                </asp:DropDownList>
            </td>
            <td class="style4">
                <asp:Label ID="Label3" runat="server" Text="نوع الراسل"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLSenderType" runat="server" Height="22px" Width="200px" 
                    TabIndex="2">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label4" runat="server" Text="اسم الراسل"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="TxtSenderName" runat="server" Width="200px" TabIndex="3"></asp:TextBox>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label5" runat="server" Text="بريد الراسل"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="TxtSenderAddress" runat="server" Width="200px" TabIndex="4"></asp:TextBox>
            </td>
            <td class="style4">
                <asp:Label ID="Label6" runat="server" Text="تليفون الراسل"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtSenderPhone" runat="server" Width="200px" TabIndex="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label7" runat="server" Text="عنوان الرساله"></asp:Label>
            </td>
            <td class="style3" colspan="3">
                <asp:TextBox ID="TxtMSGAddress" runat="server" Width="480px" TabIndex="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style4">
                <asp:Label ID="Label8" runat="server" Text="نص الرساله"></asp:Label>
            </td>
            <td class="style3" colspan="3">
                <asp:TextBox ID="TxtMSGContain" runat="server" Height="300px" TextMode="MultiLine" 
                    Width="480px" TabIndex="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style3" colspan="3">
                <asp:Button ID="BtnSend" runat="server" onclick="BtnSend_Click" TabIndex="8" 
                    Text="ارسال" Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style3" colspan="3">
                <asp:Label ID="LblStatus" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="LblStatus0" runat="server" Text="رقم الرساله"></asp:Label>
            </td>
            <td class="style3" colspan="3">
                
                <asp:Label ID="LblMSGNo" runat="server" Visible="False" 
                    style="color: #FFFFFF; background-color: #000000">0</asp:Label>
                <br />
                <asp:Label ID="LblInfo" runat="server" 
                    Text="عن طريق هذا الرقم يمكنك متابعة الرد" Visible="False" 
                    style="color: #0000FF; font-weight: 700"></asp:Label>
                
            </td>
        </tr>
    </table>
</div>