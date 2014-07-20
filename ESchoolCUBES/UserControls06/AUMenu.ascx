<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AUMenu.ascx.cs" Inherits="AUMenu" %>

<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 182px;
        
    }
</style>


<div dir="rtl">

    <table class="style1">
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label1" runat="server" Text="القائمة الرئيسية" style="font-weight: 700; color: #5C8ED3; font-size: medium" 
                    ></asp:Label>

            </td>
            <td>
                <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
        <asp:Menu ID="AUMainMenu" runat="server" BackColor="#B5C7DE" 
                DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="1em" 
                ForeColor="#284E98" StaticSubMenuIndent="10px" style="direction: rtl" 
                Width="194px" BorderStyle="Double" BorderWidth="8px" Height="334px">
                <StaticSelectedStyle BackColor="#507CD1" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                <DynamicMenuStyle BackColor="#B5C7DE" />
                <DynamicSelectedStyle BackColor="#507CD1" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                <Items>
                    
                    <asp:MenuItem Text="عن المدرسه" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="الهيكل التنظيمي" Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="التقدم للمدرسه" Value="3"></asp:MenuItem>
                    <asp:MenuItem Text="المصروفات المدرسيه" Value="4"></asp:MenuItem>
                    <asp:MenuItem Text="خطوط سير الباص" Value="5"></asp:MenuItem>
                    <asp:MenuItem Text="كيف تصل الينا" Value="6"></asp:MenuItem>
                    <asp:MenuItem Text="اتصل بنا" Value="7"></asp:MenuItem>
                    
                </Items>
            </asp:Menu>

            </td>
            <td valign="top" style="text-align: justify">
                <%= LoadContain() %></td>
        </tr>
    </table>

</div>
        
