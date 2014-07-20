<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLCatEditor.ascx.cs" Inherits="UserControl_SLCatEditor" %>


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
</style>
<div style="direction:rtl">
    <table style="width: 654px">
        <tr>
            <td class="style2" align="right" valign="top" rowspan="7">
                <asp:TreeView ID="TVCats" runat="server" 
                    onselectednodechanged="TVCats_SelectedNodeChanged" 
                    ontreenodeexpanded="TVCats_TreeNodeExpanded" 
                    Width="199px" Height="410px" ImageSet="Arrows">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                        HorizontalPadding="0px" VerticalPadding="0px" />
                    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
                        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label1" runat="server" Text="اسم القسم"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtCatName" runat="server" style="margin-left: 0px" 
                    Width="212px" ontextchanged="TxtCatName_TextChanged" 
                    TabIndex="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label2" runat="server" Text="صورة القسم"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:Image ID="CatImage" runat="server" Height="120px" 
                    ImageUrl="~/libimages/defaultpic.jpg" Visible="False" Width="145px" />
                <br />
                <asp:FileUpload ID="FileUploadImage" runat="server" Width="216px" 
                    TabIndex="2" />
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label3" runat="server" Text="معلومات عن القسم"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtCatInfo" runat="server" Height="78px" 
                    style="margin-left: 0px" TextMode="MultiLine" Width="216px" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label4" runat="server" Text="ترتيب القسم عند العرض"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:ListBox ID="ListBoxCatOrder" runat="server" Height="50px" Width="52px" >
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
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
                </asp:ListBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label5" runat="server" Text="اسم القسم الرئيسي"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:CheckBox ID="CheckBoxMainCat" runat="server" AutoPostBack="True" 
                    oncheckedchanged="CheckBoxMainCat_CheckedChanged" Text="قسم رئيسي" />
                <asp:TextBox ID="TxtCatParent" runat="server" ReadOnly="True" 
                    style="margin-left: 0px" Width="167px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                <asp:Label ID="Label6" runat="server" Text="عدد مرات الزياره"></asp:Label>
            </td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                <asp:TextBox ID="TxtCatVisitCounter" runat="server" style="margin-left: 0px" 
                    Width="167px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td  align="right" valign="top" dir="ltr" class="style3">
                &nbsp;</td>
            <td  align="right" valign="top" dir="ltr" class="style4">
                
                <asp:Button ID="BtnAddNew" runat="server" onclick="BtnAddNew_Click" 
                    Text="اضافة قسم جديد" Width="89px" />
                
                <asp:Button ID="BtnDel" runat="server" Text="حذف الدرس" Width="89px" 
                    onclick="BtnDel_Click" />
                <asp:Button ID="BtnUpdateCat" runat="server" Text="حفظ التعديل" Visible="False" 
                    Width="89px" onclick="BtnUpdateCat_Click" />
                    <br />
                    <asp:Label ID="LblStatus" runat="server" Text="What is Going ON " 
                    Visible="False" style="direction: rtl"></asp:Label>
            </td>
        </tr>
    </table>
</div>



    

    
