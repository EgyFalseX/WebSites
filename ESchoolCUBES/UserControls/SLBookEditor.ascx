<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLBookEditor.ascx.cs" Inherits="UserControl_SLBookEditor" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<style type="text/css">
    .style2
    {
        width: 260px;
    }
    .style3
    {
        width: 159px;
    }
    .style4
    {
        width: 353px;
    }
    .style5
    {
        width: 159px;
        height: 33px;
    }
    .style6
    {
        width: 353px;
        height: 33px;
    }
</style>

<div style="direction:rtl">
    <table style="width: 776px">
        <tr>
            <td class="style2" align="right" valign="top" rowspan="8">
                <telerik:RadPanelBar ID="RPBCats" Runat="server" Skin="Hay" Width="260px" 
                    Height="260px" onitemclick="RPBCats_ItemClick">
<CollapseAnimation Type="None" Duration="100"></CollapseAnimation>

<ExpandAnimation Type="None" Duration="100"></ExpandAnimation>
                </telerik:RadPanelBar>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style5">
                <asp:Label ID="Label8" runat="server" Text="اختار كتاب"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style6">
                <asp:DropDownList ID="DDLBooks" runat="server" Height="16px" Width="280px" 
                    AutoPostBack="True" onselectedindexchanged="DDLBooks_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label1" runat="server" Text="اسم الكتاب"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtBookName" runat="server" style="margin-left: 0px" 
                    Width="280px" AutoPostBack="True" 
                    TabIndex="1" ontextchanged="TxtBookName_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label2" runat="server" Text="صورة الكتاب"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:Image ID="BookImage" runat="server" Height="120px" 
                    ImageUrl="~/libimages/defaultpic.jpg" Visible="False" Width="145px" />
                <br />
                <asp:FileUpload ID="FileUploadImage" runat="server" Width="280px" 
                    TabIndex="2" />
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label7" runat="server" Text="اسم المؤلف"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtOwner" runat="server" style="margin-left: 0px" 
                    Width="280px" 
                    TabIndex="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label9" runat="server" Text="تحميل الكتاب"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:FileUpload ID="FileUploadBook" runat="server" Width="280px" 
                    TabIndex="2" />
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label3" runat="server" Text="معلومات عن الكتاب"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtBookInfo" runat="server" Height="78px" 
                    style="margin-left: 0px" TextMode="MultiLine" Width="280px" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label5" runat="server" Text="اسم قسم الكتاب"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtCatParent" runat="server" ReadOnly="True" 
                    style="margin-left: 0px" Width="280px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                &nbsp;</td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:Button ID="BtnAddNew" runat="server" 
                    Text="اضافة كتاب جديد" Width="89px" onclick="BtnAddNew_Click" 
                    Enabled="False" />
                <asp:Button ID="BtnDelBook" runat="server" 
                    Text="حذف الكتاب" Width="89px" Visible="False" 
                    onclick="BtnDelBook_Click" />
                
                <asp:Button ID="BtnUpdateBook" runat="server" 
                    Text="حفظ التعديل" Width="89px" Visible="False" 
                    onclick="BtnUpdateBook_Click" />
                    <br />
                    <asp:Label ID="LblStatus" runat="server" Text="What is Going ON " 
                    Visible="False" style="direction: rtl"></asp:Label>
            </td>
        </tr>
    </table>
</div>
