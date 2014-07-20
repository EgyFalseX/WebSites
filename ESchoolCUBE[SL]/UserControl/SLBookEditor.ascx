<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLBookEditor.ascx.cs" Inherits="UserControl_SLBookEditor" %>


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
                <asp:TreeView ID="TVCats" runat="server" 
                    onselectednodechanged="TVCats_SelectedNodeChanged" 
                    ontreenodeexpanded="TVCats_TreeNodeExpanded" Width="225px" Height="412px" 
                    ImageSet="WindowsHelp">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA" />
                    <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" 
                        HorizontalPadding="0px" VerticalPadding="0px" />
                    <NodeStyle Font-Names="Tahoma" Font-Size="8pt" ForeColor="Black" 
                        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="1px" />
                </asp:TreeView>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style5">
                <asp:Label ID="Label8" runat="server" Text="اختار الدرس"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style6">
                <asp:DropDownList ID="DDLBooks" runat="server" Height="25px" Width="280px" 
                    AutoPostBack="True" onselectedindexchanged="DDLBooks_SelectedIndexChanged" 
                    style="font-family: Arial, Helvetica, sans-serif">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label1" runat="server" Text="اسم الدرس"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtBookName" runat="server" style="margin-left: 0px" 
                    Width="280px" AutoPostBack="True" 
                    TabIndex="1" ontextchanged="TxtBookName_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label2" runat="server" Text="صورة الدرس"></asp:Label>
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
                <asp:Label ID="Label9" runat="server" Text="تحميل الدرس"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:FileUpload ID="FileUploadBook" runat="server" Width="280px" 
                    TabIndex="2" />
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label3" runat="server" Text="معلومات عن الدرس"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtBookInfo" runat="server" Height="78px" 
                    style="margin-left: 0px" TextMode="MultiLine" Width="280px" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label5" runat="server" Text="اسم قسم الدرس"></asp:Label>
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
                    Text="اضافة درس جديد" Width="89px" onclick="BtnAddNew_Click" 
                    Enabled="False" />
                <asp:Button ID="BtnDelBook" runat="server" 
                    Text="حذف الدرس" Width="89px" Visible="False" 
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
