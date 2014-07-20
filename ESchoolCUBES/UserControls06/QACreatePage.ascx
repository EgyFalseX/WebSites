<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QACreatePage.ascx.cs" Inherits="QACreatePage" %>

<style type="text/css">
    .style1
    {
        width: 645px;
    }
</style>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
 
<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td class="style12">
                <asp:Menu ID="QAMainMenu" runat="server" BackColor="#B5C7DE" 
                DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="1em" 
                ForeColor="#284E98" StaticSubMenuIndent="10px" style="direction: rtl" 
                Width="194px" BorderStyle="Double" BorderWidth="8px" Height="334px" 
                onmenuitemclick="QAMainMenu_MenuItemClick">
                <StaticSelectedStyle BackColor="#507CD1" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <Items>
                    <asp:MenuItem Text="الصفحه الرئيسيه" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="مجالات الجوده" Value="2">
                        <asp:MenuItem Text="الرؤيه و الرساله" Value="3"></asp:MenuItem>
                        <asp:MenuItem Text="القياده و الحوكمه" Value="4"></asp:MenuItem>
                        <asp:MenuItem Text="الموارد البشريه و الماديه" Value="5"></asp:MenuItem>
                        <asp:MenuItem Text="المشاركة المجتمعية" Value="6"></asp:MenuItem>
                        <asp:MenuItem Text="توكيد الجوده و المساءله" Value="7"></asp:MenuItem>
                        <asp:MenuItem Text="المتعلم" Value="8"></asp:MenuItem>
                        <asp:MenuItem Text="المعلم" Value="9"></asp:MenuItem>
                        <asp:MenuItem Text="المنهج الدراسي" Value="10"></asp:MenuItem>
                        <asp:MenuItem Text="المناخ التربوي" Value="11"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="البيانات الاساسيه" Value="12">
                    </asp:MenuItem>
                    <asp:MenuItem Text="الرؤيه و الرساله" Value="13"></asp:MenuItem>
                    <asp:MenuItem Text="استمارة التقييم الذاتي" Value="14">
                        <asp:MenuItem Text="القدره المؤسسيه" Value="15">
                            <asp:MenuItem Text="الرؤيه و الرساله" Value="16"></asp:MenuItem>
                            <asp:MenuItem Text="القياده و الحوكمه" Value="17"></asp:MenuItem>
                            <asp:MenuItem Text="الموارد البشريه و الماديه" Value="18"></asp:MenuItem>
                            <asp:MenuItem Text="المشاركة المجتمعية" Value="19"></asp:MenuItem>
                            <asp:MenuItem Text="توكيد الجوده و المساءله" Value="20"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="الفاعليه التعليميه" Value="21">
                            <asp:MenuItem Text="المتعلم" Value="22"></asp:MenuItem>
                            <asp:MenuItem Text="المعلم" Value="23"></asp:MenuItem>
                            <asp:MenuItem Text="المنهج الدراسي" Value="24"></asp:MenuItem>
                            <asp:MenuItem Text="المناخ التربوي" Value="25"></asp:MenuItem>
                        </asp:MenuItem>
                        <asp:MenuItem Text="الامن و السلامه للمبني" Value="26"></asp:MenuItem>
                    </asp:MenuItem>
                    <asp:MenuItem Text="تقرير التقييم الذاتي" Value="27"></asp:MenuItem>
                    <asp:MenuItem Text="خطط التحسين" Value="28"></asp:MenuItem>
                    <asp:MenuItem Text="نظم المتابعه داخل المؤسسه" Value="29"></asp:MenuItem>
                    <asp:MenuItem Text="المرفقات" Value="30"></asp:MenuItem>
                    <asp:MenuItem Text="وحدة التدريب" Value="31"></asp:MenuItem>
                </Items>
            </asp:Menu>
                </td>
            <td dir="ltr" style="text-align: right" class="style1">
            <textarea name="editor1">&lt;p&gt;<%=LoadPage() %>&lt;/p&gt;</textarea>
			<script type="text/javascript">
			    CKEDITOR.replace('editor1');
			</script>
            <br />
            <asp:Button ID="BtnQASave" runat="server" onclick="BtnQASave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>

