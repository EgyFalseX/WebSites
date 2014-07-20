<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AUCreatePage.ascx.cs" Inherits="AUCreatePage" %>

<style type="text/css">


    .style11
    {
        width: 80%;
    }
    .style12
    {
        width: 105px;
    }

    </style>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    
<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td class="style12">
                <asp:Menu ID="AUMainMenu" runat="server" style="direction: rtl" 
                Width="194px" Height="334px" 
                onmenuitemclick="AUMainMenu_MenuItemClick">
                <Items>
                    <asp:MenuItem Text="عن المدرسه" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="الهيكل التنظيمي" Value="2">
                    </asp:MenuItem>
                    <asp:MenuItem Text="التقدم للمدرسه" Value="3">
                    </asp:MenuItem>
                    <asp:MenuItem Text="المصروفات المدرسيه" Value="4"></asp:MenuItem>
                    <asp:MenuItem Text="خطوط سير الباص" Value="5">
                    </asp:MenuItem>
                    <asp:MenuItem Text="كيف تصل الينا" Value="6"></asp:MenuItem>
                    <asp:MenuItem Text="اتصل بنا" Value="7"></asp:MenuItem>
                </Items>
            </asp:Menu>
                </td>
            <td dir="ltr" style="text-align: right">
            <textarea name="editor1">&lt;p&gt;<%=LoadPage() %>&lt;/p&gt;</textarea>
			<script type="text/javascript">
			    CKEDITOR.replace('editor1');
			</script>
            <br />

            <asp:Button ID="BtnAUSave" runat="server" onclick="BtnAUSave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>