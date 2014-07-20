<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PopUpMessage.ascx.cs" Inherits="UC_PopUpMessage" %>
  <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
  <link href="../CSS/PopUpStyle.css" rel="stylesheet" type="text/css" />
  <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<br />
  <asp:LinkButton ID="LinkButton1" runat="server" Text="" />
        
        <asp:Panel ID="Panel2" runat="server" Style="display: none" CssClass="modalPopup" Width="500px">
            <asp:ImageButton ID="CancelButton" runat="server" Text="ْX" ImageUrl="~/Images/x.png" style="z-index: 1; left: 5px; top: 5px; position: absolute" />
            <asp:Panel ID="Panel3" runat="server" Height="30px" Style="cursor: move;background-color:#DDDDDD;border:solid 1px Gray;color:Black">
                <div style="text-align:center">
                    <b><p>
                        <asp:Label ID="lbl_MessageTitle" runat="server" Text=""></asp:Label> </p> </b>
                </div>
            </asp:Panel>
                <div>
                  
                  
                     <table id="table1" runat="server" cellpadding="0" cellspacing="0" class="style16" 
    style="height: 45px; width: 344px">
        <tr>
            <td class="style27">
                &nbsp;</td>
            <td class="style19">
                &nbsp;</td>
            <td class="style18" style="text-align: right">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style28">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
            <td class="style20" style="text-align: right">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style29">
                &nbsp;</td>
            <td class="style23">
            </td>
            <td class="style22" style="text-align: right">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style30">
                &nbsp;</td>
            <td class="style25">
                &nbsp;</td>
            <td class="style26" style="text-align: right">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style28">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
            <td class="style20" style="text-align: right">
            </td>
        </tr>
        <tr>
            <td class="style28">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
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
            
            
                                  <table id="table2" runat="server" 
    cellpadding="0" cellspacing="0" class="style16" 
    style="height: 45px; width: 344px; background-image: url('~/Images/Warning.png');">
                                      <tr>
                                          <td class="style27">
                                              &nbsp;</td>
                                          <td class="style19">
                                              &nbsp;</td>
                                          <td class="style18" style="text-align: right">
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td class="style28">
                                              &nbsp;</td>
                                          <td class="style21">
                                              &nbsp;</td>
                                          <td class="style20" style="text-align: right">
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td class="style29">
                                              &nbsp;</td>
                                          <td class="style23">
                                          </td>
                                          <td class="style22" style="text-align: right">
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td class="style30">
                                              &nbsp;</td>
                                          <td class="style25">
                                              &nbsp;</td>
                                          <td class="style26" style="text-align: right">
                                              &nbsp;</td>
                                      </tr>
                                      <tr>
                                          <td class="style28">
                                              &nbsp;</td>
                                          <td class="style21">
                                              &nbsp;</td>
                                          <td class="style20" style="text-align: right">
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="style28">
                                              &nbsp;</td>
                                          <td class="style21">
                                              &nbsp;</td>
                                          <td class="style20" style="text-align: right">
                                              &nbsp;</td>
                                      </tr>
</table>

            
            
                                  <asp:Panel ID="Panel4" runat="server">
</asp:Panel>


            
            
                                  