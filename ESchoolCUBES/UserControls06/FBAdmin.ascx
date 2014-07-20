<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FBAdmin.ascx.cs" Inherits="FBAdmin" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 33%;
    }
    .style3
    {
        width: 264px;
    }
    .style4
    {
        width: 76px;
        direction:rtl;
    }
    .style5
    {
        width: 45%;
    }
    .style6
    {
    }
    .style8
    {
        width: 100%;
    }
    .style9
    {
        width: 151px;
    }
    .style11
    {
        width: 128px;
    }
    </style>
<div dir="rtl">
         <table class="style1">
            <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Text="نوع العرض"></asp:Label>
            </td>
            <td class="style3">
                <asp:DropDownList ID="DDLViewType" runat="server" Height="22px" 
                    onselectedindexchanged="DDLViewType_SelectedIndexChanged" Width="260px" 
                    AutoPostBack="True">
                    <asp:ListItem Value="1">الكل</asp:ListItem>
                    <asp:ListItem Value="2">المردود عليها</asp:ListItem>
                    <asp:ListItem Value="3">لم يتم الرد عليها</asp:ListItem>
                    <asp:ListItem Value="4">مقروءه</asp:ListItem>
                    <asp:ListItem Value="5">غير مقروءه</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        </table>
    <asp:Label ID="LblError" runat="server" ForeColor="Red" Visible="False"></asp:Label>

    <asp:GridView ID="GridViewMSG" runat="server" AutoGenerateColumns="False" 
        EmptyDataText="لا يوجد رسائل" AllowPaging="True" CellPadding="4" 
        ForeColor="#333333" 
        onpageindexchanging="GridViewMSG_PageIndexChanging" 
        onselectedindexchanged="GridViewMSG_SelectedIndexChanged" 
             DataKeyNames="id_Contact_Us" onrowdeleting="GridViewMSG_RowDeleting">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="id_Contact_Us" HeaderText="رقم الرساله" />
            <asp:BoundField DataField="date_entry" HeaderText="تاريخ الرساله" 
                DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="name_Contact_Us" HeaderText="اسم الراسل" />
            <asp:BoundField DataField="mail_Contact_Us" HeaderText="بريد الراسل" />
            <asp:BoundField DataField="phone_Contact_Us" HeaderText="تليفون الراسل" />
            <asp:BoundField DataField="Guest_Type" HeaderText="نوع الراسل" />
            <asp:BoundField DataField="id_kind_m" HeaderText="نوع الرساله" />
            <asp:BoundField DataField="address_Contact_Us" HeaderText="عنوان الرساله" />
            <asp:BoundField DataField="text_Contact_Us" HeaderText="نص الرساله" />
            <asp:BoundField DataField="reply_Contact_Us" HeaderText="نص الرد" />
            <asp:BoundField DataField="data_reply" HeaderText="تاريخ الرد" 
                DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Is_Readed" HeaderText="تم قراءة الرد" />
            <asp:CommandField ButtonType="Button" DeleteText="تعديل" EditText="تعديل" 
                HeaderText="تعديل" InsertText="تعديل" SelectText="تعديل" 
                ShowSelectButton="True" UpdateText="تعديل" />
            <asp:CommandField ButtonType="Button" DeleteText="حذف" HeaderText="حذف" 
                ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>

</div>
<div dir="rtl">
    <table class="style5">
        <tr>
            <td class="style6">
    
    <asp:Panel ID="PnlMSGDetails" runat="server" Width="674px" Height="207px" Visible="False">
        <table class="style8">
            <tr>
                <td class="style9">
                    <asp:Label ID="Label2" runat="server" Text="رقم الرساله"></asp:Label>
                </td>
                <td class="style12" colspan="4">
                    <asp:TextBox ID="TxtMSGNo" runat="server" Width="220px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label3" runat="server" Text="اسم الراسل"></asp:Label>
                </td>
                <td class="style13">
                    <asp:TextBox ID="TxtSenderName" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td class="style11" colspan="2">
                    <asp:Label ID="Label5" runat="server" Text="رقم التليفون"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtSenderPhone" runat="server" Width="220px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label4" runat="server" Text="بريد الراسل"></asp:Label>
                </td>
                <td class="style13">
                    <asp:TextBox ID="TxtSenderMail" runat="server" Width="220px"></asp:TextBox>
                </td>
                <td class="style11" colspan="2">
                    <asp:Label ID="Label10" runat="server" Text="نوع الراسل"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtSenderType" runat="server" Width="220px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label8" runat="server" Text="تاريخ الرساله"></asp:Label>
                </td>
                <td class="style13">
                    <asp:TextBox ID="TxtMSGDate" runat="server" Width="220px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                        TargetControlID="TxtMSGDate" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                </td>
                <td class="style13">
                    <asp:Label ID="Label25" runat="server" Text="نوع الرساله"></asp:Label>
                </td>
                <td class="style13" colspan="2">
                    <asp:TextBox ID="TxtMSGType" runat="server" Width="220px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label7" runat="server" Text="عنوان الرساله"></asp:Label>
                </td>
                <td class="style12" colspan="4">
                    <asp:TextBox ID="TxtMSGTitle" runat="server" Width="407px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" class="style9">
                    <asp:Label ID="Label23" runat="server" Text="نص الرساله"></asp:Label>
                </td>
                <td class="style10" colspan="4">
                    <asp:TextBox ID="TxtMSGContain" runat="server" Height="236px" TextMode="MultiLine" 
                        Width="409px" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9">
                    <asp:Label ID="Label9" runat="server" Text="تاريخ الرد"></asp:Label>
                </td>
                <td class="style12" colspan="4">
                    <asp:TextBox ID="TxtRpyDate" runat="server" Width="220px"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                        TargetControlID="TxtRpyDate" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td valign="top" class="style9">
                    <asp:Label ID="Label24" runat="server" Text="نص الرد"></asp:Label>
                </td>
                <td class="style12" colspan="4">
                    <asp:TextBox ID="TxtRpyContian" runat="server" Height="236px" TextMode="MultiLine" 
                        Width="409px" TabIndex="3"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style9" valign="top">
                    &nbsp;</td>
                <td class="style12" colspan="4">
                    <asp:Button ID="btnSaveChanges" runat="server" Text="حفــــظ التعديل" 
                        Width="100px" onclick="btnSaveChanges_Click" style="height: 26px" />
                    <asp:Button ID="btnDelMSG" runat="server" onclick="btnDelMSG_Click" 
                        style="height: 26px" Text="حـــــــذف الرساله" Width="100px" />
                    <asp:Label ID="LblStatus" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
    
            </td>
        </tr>
    </table>
</div>