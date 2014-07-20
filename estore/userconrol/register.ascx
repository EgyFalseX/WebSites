<%@ Control Language="C#" AutoEventWireup="true" CodeFile="register.ascx.cs" Inherits="userconrol_register" %>
<style type="text/css">
    .style1
    {
        width: 57%;
    }
    .style2
    {
        width: 36px;
    }
    .style3
    {
        width: 73px;
    }
</style>
<table class="style1">
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
        </td>
        <td>
            الاسم</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="tel" runat="server"></asp:TextBox>
        </td>
        <td>
            التليفون</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp; &nbsp;</td>
        <td>
            <asp:TextBox ID="mobile" runat="server"></asp:TextBox>
        </td>
        <td>
            موبيل
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td>
            <asp:TextBox ID="e_mail" runat="server"></asp:TextBox>
        </td>
        <td>
            ايميل</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:RadioButtonList ID="RadioGender" runat="server">
                <asp:ListItem>ذكر</asp:ListItem>
                <asp:ListItem>انثى</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            الجنس</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <table class="style1">
                <tr>
                    <td>
                        سنة<td class="style2">
                        شهر</td>
                    <td>
                        ييوم</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="year" runat="server" MaxLength="4" Width="64px" 
                            ontextchanged="TextBox4_TextChanged"></asp:TextBox>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownMonthe" runat="server" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownday" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem Value="5"></asp:ListItem>
                            <asp:ListItem Value="6"></asp:ListItem>
                            <asp:ListItem Value="7"></asp:ListItem>
                            <asp:ListItem Value="8"></asp:ListItem>
                            <asp:ListItem Value="9"></asp:ListItem>
                            <asp:ListItem Value="10"></asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                            <asp:ListItem Value="13"></asp:ListItem>
                            <asp:ListItem Value="14"></asp:ListItem>
                            <asp:ListItem Value="15"></asp:ListItem>
                            <asp:ListItem Value="16"></asp:ListItem>
                            <asp:ListItem Value="17"></asp:ListItem>
                            <asp:ListItem Value="18"></asp:ListItem>
                            <asp:ListItem Value="19"></asp:ListItem>
                            <asp:ListItem Value="20"></asp:ListItem>
                            <asp:ListItem Value="21"></asp:ListItem>
                            <asp:ListItem Value="22"></asp:ListItem>
                            <asp:ListItem Value="23"></asp:ListItem>
                            <asp:ListItem Value="24"></asp:ListItem>
                            <asp:ListItem Value="25"></asp:ListItem>
                            <asp:ListItem Value="26"></asp:ListItem>
                            <asp:ListItem Value="27"></asp:ListItem>
                            <asp:ListItem Value="28"></asp:ListItem>
                            <asp:ListItem Value="29"></asp:ListItem>
                            <asp:ListItem Value="30"></asp:ListItem>
                            <asp:ListItem Value="31"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            تاريخ الميلاد</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="countery" runat="server"></asp:TextBox>
        </td>
        <td>
            المحافظة</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="city" runat="server"></asp:TextBox>
        </td>
        <td>
            المدينة</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
        </td>
        <td>
            العنوان</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:DropDownList ID="DropDownKind" runat="server">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>شركة</asp:ListItem>
                <asp:ListItem>تاجر</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            نوع الحساب</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="job" runat="server"></asp:TextBox>
        </td>
        <td>
            المهنة</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="username" runat="server"></asp:TextBox>
        </td>
        <td>
            اسم المستخدم</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
        </td>
        <td>
            كلمة المرور
        </td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            <asp:TextBox ID="passwordconverm" runat="server"></asp:TextBox>
        </td>
        <td>
            تاكيد كلمة المرور</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            &nbsp;&nbsp;</td>
        <td style="text-align: center">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                style="font-weight: 700" Text="تسجيل" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
