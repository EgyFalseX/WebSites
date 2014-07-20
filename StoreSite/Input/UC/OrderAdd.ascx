<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderAdd.ascx.cs" Inherits="UC_OrderAdd" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<style type="text/css">
    .style1
    {
        width: 644px;
        direction: rtl;
    }
    .style2
    {
        width: 145px;
    }
    .style3
    {
        width: 342px;
        text-align: center;
    }
    .style4
    {
        height: 38px;
        text-align: right;
    }
    .style5
    {
        width: 342px;
        text-align: center;
        height: 38px;
    }
    .style6
    {
        height: 38px;
    }
    .style7
    {
        width: 145px;
        height: 34px;
        text-align: right;
    }
    .style8
    {
        width: 342px;
        text-align: center;
        height: 34px;
    }
    .style9
    {
        height: 34px;
    }
    .style10
    {
        width: 145px;
        height: 39px;
        text-align: right;
    }
    .style11
    {
        width: 342px;
        text-align: center;
        height: 39px;
    }
    .style12
    {
        height: 39px;
    }
    .style13
    {
        width: 145px;
        height: 36px;
        text-align: right;
    }
    .style14
    {
        width: 342px;
        text-align: center;
        height: 36px;
    }
    .style15
    {
        height: 36px;
    }
    .style16
    {
        width: 420px;
    }
    .style18
    {
        height: 30px;
    }
    .style19
    {
        width: 337px;
        text-align: center;
        height: 30px;
    }
    .style20
    {
        height: 29px;
    }
    .style21
    {
        width: 337px;
        text-align: center;
        height: 29px;
    }
    .style22
    {
        height: 32px;
    }
    .style23
    {
        width: 337px;
        text-align: center;
        height: 32px;
    }
    .style25
    {
        width: 337px;
        text-align: center;
        height: 33px;
    }
    .style26
    {
        height: 33px;
    }
    .style27
    {
        width: 110px;
        text-align: center;
        height: 30px;
    }
    .style28
    {
        width: 110px;
        text-align: center;
        height: 29px;
    }
    .style29
    {
        width: 110px;
        text-align: center;
        height: 32px;
    }
    .style30
    {
        width: 110px;
        text-align: center;
        height: 33px;
    }
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server">
<Services>
<asp:ServiceReference Path="~/AutoComplete.asmx" />
</Services>
</asp:ScriptManager>
<table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td colspan="2" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        
        <td class="style6">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4">
            <asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="الشركة" 
                ForeColor="Black" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        
        <td class="style5">
            <asp:DropDownList ID="Drop_company" runat="server" Height="26px" Width="283px">
            </asp:DropDownList>
            
        </td>
        <td class="style6">
            <asp:Label ID="lbl_dropcom" runat="server" style="color: #FF0000" Text="*" 
                Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label2" runat="server" style="font-weight: 700" 
                Text="رقم البلاغ" ForeColor="Black" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        <td class="style8">
            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                runat="server" FilterType="Numbers" TargetControlID="txt_AnnounceNum">
            </ajaxToolkit:FilteredTextBoxExtender>
            <asp:TextBox ID="txt_AnnounceNum" runat="server" Width="284px" 
                ValidationGroup="addgroup"></asp:TextBox>
        </td>
        <td class="style9">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txt_AnnounceNum" ErrorMessage="*" ValidationGroup="addgroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style4">
            <asp:Label ID="Label3" runat="server" style="font-weight: 700" 
                Text="طريقة البلاغ" ForeColor="Black" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        <td class="style5">
            <asp:DropDownList ID="Drop_AnnounceWay" runat="server" Height="28px" 
                Width="286px">
            </asp:DropDownList>
        </td>
        <td class="style6">
            <asp:Label ID="lbl_dropway" runat="server" style="color: #FF0000" Text="*" 
                Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style10">
            <asp:Label ID="Label4" runat="server" style="font-weight: 700" 
                Text="تاريخ البلاغ" ForeColor="Black" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        <td class="style11">
            <asp:TextBox ID="txt_announceDate" runat="server" Width="288px" 
                ValidationGroup="addgroup"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="txt_announceDate_CalendarExtender" runat="server" 
                TargetControlID="txt_announceDate" Format="dd/MM/yyyy">
            </ajaxToolkit:CalendarExtender>
        </td>
        <td class="style12">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txt_announceDate" ErrorMessage="*" 
                ValidationGroup="addgroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label5" runat="server" style="font-weight: 700" Text="العميل" 
                ForeColor="Black" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        <td class="style8">
            <asp:ImageButton ID="btnAddClient" runat="server" CausesValidation="False" 
                ImageUrl="~/Images/Add.gif" OnClick="btnAddClient_Click" />
            <asp:ImageButton ID="btnSelectAccount" runat="server" CausesValidation="False" 
                ImageUrl="~/Images/select.gif" OnClick="btnSelectAccount_Click" />
            <asp:TextBox ID="txt_Customer" runat="server" Width="234px" Height="22px" 
                ValidationGroup="addgroup"></asp:TextBox>
        </td>
        <td class="style9">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txt_VisitDate" ErrorMessage="*" ValidationGroup="addgroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style13">
            <asp:Label ID="Label6" runat="server" style="font-weight: 700" 
                Text="تاريخ الزيارة" ForeColor="Black" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        <td class="style14">
            <asp:TextBox ID="txt_VisitDate" runat="server" Width="292px" 
                ValidationGroup="addgroup"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="txt_VisitDate_CalendarExtender" runat="server" 
                TargetControlID="txt_VisitDate" Format="dd/MM/yyyy">
            </ajaxToolkit:CalendarExtender>
        </td>
        <td class="style15">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="txt_VisitDate" ErrorMessage="*" ValidationGroup="addgroup"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style13">
            <asp:Label ID="Label23" runat="server" style="font-weight: 700" 
                Text="مستلم البلاغ" ForeColor="Black" Font-Bold="True" Font-Size="14px"></asp:Label>
        </td>
        <td class="style14">
            <asp:DropDownList ID="DDLCommRecive" runat="server" Height="26px" Width="283px">
            </asp:DropDownList>
            
        </td>
        <td class="style15">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="Label7" runat="server" style="font-weight: 700" Text="ملاحظات" 
                ForeColor="Black" Font-Bold="True" Font-Size="14px"></asp:Label>
        </td>
        <td class="style3">
            <asp:TextBox ID="txt_Note" runat="server" Height="73px" TextMode="MultiLine" 
                Width="296px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            </td>
        <td class="style3">
             <asp:Panel ID="PnlManinLead" runat="server" Height="400px" Width="500px" Style="display: none"
            CssClass="modalPopup" meta:resourcekey="PnlManinLeadResource1">
              <asp:ImageButton ID="btnSearchCancel" runat="server" Text="ْX" ImageUrl="~/Images/x.png" style="z-index: 1; left: 5px; top: 5px; position: absolute" />
            <asp:Panel ID="pnlDragLead" runat="server" Height="25px" Width="500px" Style="cursor: move;
                background-color: #DDDDDD; border: solid 1px Gray; color: Black">
                <div>
                  <b>  <p>
                        اختر العميل</p></b>
                </div>
            </asp:Panel>
            <div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                <asp:Panel ID="pnlDataLead" runat="server" Height="330px" Width="500px" ScrollBars="Vertical">
            <asp:TextBox ID="txt_ClientName" runat="server" Height="23px" Width="200px" 
               ></asp:TextBox>
                
                <asp:HiddenField ID="HiddenField1"
                    runat="server" />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="بحث" 
                        OnClick="txt_ClientName_TextChanged" Font-Bold="True" />
                    <asp:Panel ID="Panel_CustDetial" runat="server" Width="421px" Visible="False">
    <table cellpadding="0" cellspacing="0" class="style16">
        <tr>
            <td class="style19">
                <asp:Label ID="lbl_CustomerName" runat="server" 
                style="font-weight: 700; color: #000099"></asp:Label>
            </td>
            <td class="style18" style="text-align: right">
                <asp:Label ID="Label8" runat="server" 
                style="font-weight: 700; text-align: right" Text="اســـم العميـــل " ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style21">
                <asp:Label ID="lbl_CustomerAddress" runat="server" 
                style="font-weight: 700; color: #000099"></asp:Label>
            </td>
            <td class="style20" style="text-align: right">
                <asp:Label ID="Label9" runat="server" 
                style="font-weight: 700" Text="العنــــــــــــوان" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style23">
                <asp:Label ID="lbl_CustomerGov" runat="server" 
                style="font-weight: 700; color: #000099"></asp:Label>
            </td>
            <td class="style22" style="text-align: right">
                <asp:Label ID="Label12" runat="server" 
                style="font-weight: 700" Text="محــــــافـــــظة" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:Label ID="lbl_CustomerMobile1" runat="server" 
                style="font-weight: 700; color: #000099"></asp:Label>
            </td>
            <td class="style26" style="text-align: right">
                <asp:Label ID="Label10" runat="server" 
                style="font-weight: 700" Text="رقــم الموبيــل" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style21">
                <asp:Label ID="lbl_CustomerPhone" runat="server" 
                style="font-weight: 700; color: #000099"></asp:Label>
            </td>
            <td class="style20" style="text-align: right">
                <asp:Label ID="Label11" runat="server" 
                style="font-weight: 700" Text="تليفون ارضى" ForeColor="Black"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Panel>
  <ajaxToolkit:AutoCompleteExtender ID="txt_ClientName_AutoCompleteExtender" 
                runat="server" TargetControlID="txt_ClientName" 
                ServicePath="~/AutoComplete.asmx" 
                ServiceMethod="GetCompletionList"
                MinimumPrefixLength="1" 
                CompletionInterval="1000"
                EnableCaching="true"
                CompletionSetCount="12">
            </ajaxToolkit:AutoCompleteExtender>
                </asp:Panel>
                </ContentTemplate>
                </asp:UpdatePanel>
                
                <br />
                <asp:Button ID="Ok" runat="server" onclick="Button2_Click" Text="OK" />
                    
                        </asp:Panel>

                <asp:LinkButton ID="btnTargetLead" runat="server"></asp:LinkButton>
            
             <asp:Label ID="lbl_error" runat="server" ForeColor="Red" 
                 style="color: #FF0000; font-weight: 700"></asp:Label>
            
             <ajaxToolkit:ModalPopupExtender ID="ajxPopupLead" runat="server" TargetControlID="btnTargetLead"
                PopupControlID="PnlManinLead" BackgroundCssClass="modalBackground"   CancelControlID="btnSearchCancel"
                 DropShadow="True" PopupDragHandleControlID="pnlDragLead"
                DynamicServicePath="" Enabled="True" />
        
        <%--------------%>
        
        
       
             <asp:Panel ID="Pane2" runat="server" Height="440px" Width="400px" Style="display: none"
            BackColor="Info">
            <asp:Panel ID="Pane3" runat="server" Height="20px" Width="400px" Style="cursor: move;
                background-color: #DDDDDD; border: solid 1px Gray; color: Green">
                <p style="text-align: center;">
                    Edit Buy status</p>
            </asp:Panel>
            <div>
                <asp:Panel ID="Panel1" runat="server">
                 <asp:Panel ID="Panel4" runat="server" Width="421px" Visible="False">
   
</asp:Panel>
                </asp:Panel>
                <p style="text-align: center;">
                   
                </p>
            </div>
        </asp:Panel>
        <asp:Button ID="hiddenButton" runat="server" Text="" Style="display: none"></asp:Button>       
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" runat="server" TargetControlID="btnTargetLead"
                PopupControlID="Pane2" BackgroundCssClass="modalBackground"   CancelControlID="CancelButton"
                 DropShadow="True" PopupDragHandleControlID="Pane3"
                DynamicServicePath="" Enabled="True" />
        
        
           </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            <asp:Button ID="btn_Save" runat="server" onclick="btn_Save_Click" 
                style="font-weight: 700" Text="حـــــفــــــظ" Width="86px" 
                ValidationGroup="addgroup" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            
            <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px" 
                ForeColor="Green"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            
          
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>

<p>
    &nbsp;</p>
<p>
        
    &nbsp;</p>



   <asp:LinkButton ID="LinkButton1" runat="server" Text="" />
        
        <asp:Panel ID="Panel2" runat="server" Style="display: none" CssClass="modalPopup" Width="500px">
            <asp:ImageButton ID="CancelButton" runat="server" Text="ْX" ImageUrl="~/Images/x.png" style="z-index: 1; left: 5px; top: 5px; position: absolute" />
            <asp:Panel ID="Panel3" runat="server" Height="30px" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div style="text-align:center">
                    <b><p>اضافة عميل جديد </p> </b>
                </div>
            </asp:Panel>
                <div>
                  
                  
                   <table cellpadding="0" cellspacing="0" class="style16">
        <tr>
            <td class="style27">
                &nbsp;</td>
            <td class="style19">
                <asp:TextBox ID="txt_NewCustomer" runat="server" Width="191px"></asp:TextBox>
            </td>
            <td class="style18" style="text-align: right">
                <asp:Label ID="Label14" runat="server" 
                style="font-weight: 700; text-align: right" Text="اســـم العميـــل " ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style28">
                &nbsp;</td>
            <td class="style21">
                <asp:TextBox ID="txt_newAddress" runat="server" Width="191px"></asp:TextBox>
            </td>
            <td class="style20" style="text-align: right">
                <asp:Label ID="Label16" runat="server" 
                style="font-weight: 700" Text="العنــــــــــــوان" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style29">
                &nbsp;</td>
            <td class="style23">
                <asp:DropDownList ID="Drop_newGov" runat="server" Height="27px" Width="189px">
                </asp:DropDownList>
            </td>
            <td class="style22" style="text-align: right">
                <asp:Label ID="Label18" runat="server" 
                style="font-weight: 700" Text="محــــــافـــــظة" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style30">
                &nbsp;</td>
            <td class="style25">
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                    runat="server" FilterType="Numbers" TargetControlID="txt_newmobile1">
                </ajaxToolkit:FilteredTextBoxExtender>
                <asp:TextBox ID="txt_newmobile1" runat="server" Width="191px"></asp:TextBox>
            </td>
            <td class="style26" style="text-align: right">
                <asp:Label ID="Label20" runat="server" 
                style="font-weight: 700" Text="رقــم الموبيــل" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style28">
                &nbsp;</td>
            <td class="style21">
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" 
                    runat="server" FilterType="Numbers" TargetControlID="txt_newphone">
                </ajaxToolkit:FilteredTextBoxExtender>
                <asp:TextBox ID="txt_newphone" runat="server" Width="191px"></asp:TextBox>
            </td>
            <td class="style20" style="text-align: right">
                <asp:Label ID="Label22" runat="server" 
                style="font-weight: 700" Text="تليفون ارضى" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style28">
                &nbsp;</td>
            <td class="style21">
                <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
                    style="font-weight: 700" Text="اضافة عميل جديد" />
            </td>
            <td class="style20" style="text-align: right">
                &nbsp;</td>
        </tr>
    </table>
                                        
                       
                   
                </div>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" 
            TargetControlID="LinkButton1"
            PopupControlID="Panel2" 
            BackgroundCssClass="modalBackground" 
            
            OnOkScript="onOk()" 
            CancelControlID="CancelButton" 
            DropShadow="true"
            PopupDragHandleControlID="Panel3" />

