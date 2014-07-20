<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QAMenuEditor.ascx.cs" Inherits="QAMenuEditor" %>
<style type="text/css">
    .style1
    {
        width: 41%;
    }
    .style2
    {
    }
    .style3
    {
    }
    .style4
    {
        width: 15px;
    }
    .style5
    {
        width: 19px;
    }
</style>
<div dir="rtl">

    <table class="style1">
        <tr>
            <td class="style2" colspan="5">
                <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C1" runat="server" AutoPostBack="True" 
                    Text="الصفحه الرئيسيه" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C2" runat="server" AutoPostBack="True" 
                    Text="مجالات الجوده" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &gt;&gt;</td>
            <td class="style3">
                <asp:CheckBox ID="C3" runat="server" AutoPostBack="True" 
                    Text="الرؤيه و الرساله" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C4" runat="server" AutoPostBack="True" 
                    Text="القياده و الحوكمه" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C5" runat="server" AutoPostBack="True" 
                    Text="الموارد البشريه و الماديه" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C6" runat="server" AutoPostBack="True" 
                    Text="المشاركة المجتمعية" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C7" runat="server" AutoPostBack="True" 
                    Text="توكيد الجوده و المساءله" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C8" runat="server" AutoPostBack="True" Text="المتعلم" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C9" runat="server" AutoPostBack="True" Text="المعلم" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C10" runat="server" AutoPostBack="True" 
                    Text="المنهج الدراسي" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C11" runat="server" AutoPostBack="True" 
                    Text="المناخ التربوي" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C12" runat="server" AutoPostBack="True" 
                    Text="البيانات الاساسيه" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C13" runat="server" AutoPostBack="True" 
                    Text="الرؤيه و الرساله" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C14" runat="server" AutoPostBack="True" 
                    Text="استمارة التقييم الذاتي" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &gt;&gt;</td>
            <td class="style3">
                <asp:CheckBox ID="C15" runat="server" AutoPostBack="True" 
                    Text="القدره المؤسسيه" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &gt;&gt;</td>
            <td>
                <asp:CheckBox ID="C16" runat="server" AutoPostBack="True" 
                    Text="الرؤيه و الرساله" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="C17" runat="server" AutoPostBack="True" 
                    Text="القياده و الحوكمه" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="C18" runat="server" AutoPostBack="True" 
                    Text="الموارد البشريه و الماديه" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="C19" runat="server" AutoPostBack="True" 
                    Text="المشاركة المجتمعية" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="C20" runat="server" AutoPostBack="True" 
                    Text="توكيد الجوده و المساءله" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C21" runat="server" AutoPostBack="True" 
                    Text="الفاعليه التعليميه" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &gt;&gt;</td>
            <td>
                <asp:CheckBox ID="C22" runat="server" AutoPostBack="True" Text="المتعلم" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="C23" runat="server" AutoPostBack="True" Text="المعلم" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="C24" runat="server" AutoPostBack="True" 
                    Text="المنهج الدراسي" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="C25" runat="server" AutoPostBack="True" 
                    Text="المناخ التربوي" oncheckedchanged="CX_CheckedChanged" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                <asp:CheckBox ID="C26" runat="server" AutoPostBack="True" 
                    Text="الامن و السلامه للمبني" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C27" runat="server" AutoPostBack="True" 
                    Text="تقرير التقييم الذاتي" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C28" runat="server" AutoPostBack="True" Text="خطط التحسين" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C29" runat="server" AutoPostBack="True" 
                    Text="نظم المتابعه داخل المؤسسه" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C30" runat="server" AutoPostBack="True" Text="المرفقات" 
                    oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:CheckBox ID="C31" runat="server" AutoPostBack="True" 
                    Text="وحدة التدريب" oncheckedchanged="CX_CheckedChanged" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</div>