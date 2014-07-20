<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccTreeBuilder.ascx.cs" Inherits="UC_AccTreeBuilder" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style3
    {
        width: 30%;
        height: 47px;
    }
    .style4
    {
        height: 28px;
    }
    .style6
    {
        height: 28px;
        width: 110px;
    }
    .style8
    {
    }
    .style9
    {
        width: 100px;
    }
</style>

<div>
                    

                    

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
                <table align="center" class="style9">
                    <tr>
                        <td style="text-align: right">
                    

                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
                    
                
                    

                        </td>
                    </tr>
                    <tr>
                        <td>
                    

                <asp:Panel ID="PnlPopCus" ScrollBars="Both"
                        runat="server" Width="230px" Height="350px" CssClass="modalPopup" 
                                BorderColor="#3399FF" BorderStyle="Solid"  >
                        <telerik:RadTreeView ID="RadTreeViewCat" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
                            Skin="Hay" style="text-align: left; direction: ltr;" 
                            onnodeclick="RadTreeViewCat_NodeClick" Font-Bold="True" Font-Size="14px">
                            <ExpandAnimation Duration="100" />
                            <CollapseAnimation Duration="100" Type="OutQuint" />
                        </telerik:RadTreeView>
                </asp:Panel>
                    
                
                    

                        </td>
                    </tr>
                </table>
    <table cellpadding="0" cellspacing="0" class="style3" 
    dir="rtl" align="center">
                        <tr>
                            <td class="style8">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="14px" 
                                    Text="اسم الحساب" ForeColor="Black"></asp:Label>
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="TxtAccountName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                                    Text="طبيعة الحساب" ForeColor="Black"></asp:Label>
                            </td>
                            <td colspan="3">
                                <telerik:RadComboBox ID="RadComboBoxAccountNatureId" Runat="server" 
                                    AllowCustomText="True" LoadingMessage="تحميل..." Skin="Sunset" 
                                    Width="200px">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                                    Text="طبيعة الرصيد" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="style4" colspan="3">
                                <telerik:RadComboBox ID="RadComboBoxAccountRasidId" Runat="server" 
                                    AllowCustomText="True" LoadingMessage="تحميل..." Skin="Sunset" 
                                    Width="200px">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                                    Text="حساب الاقفال" ForeColor="Black"></asp:Label>
                            </td>
                            <td colspan="3">
                                <telerik:RadComboBox ID="RadComboBoxCloseAccountID" Runat="server" 
                                    AllowCustomText="True" LoadingMessage="تحميل..." Skin="Sunset" 
                                    Width="200px">
                                </telerik:RadComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="14px" 
                                    Text="كود الشجره" ForeColor="Black"></asp:Label>
                            </td>
                            <td colspan="3" style="text-align: right">
                                <asp:Label ID="LblAccountTreeId" runat="server" Font-Bold="True" 
                                    Font-Size="14px" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                &nbsp;</td>
                            <td style="margin-right: 40px">
                                <asp:ImageButton ID="BtnAdd" runat="server" Height="32px" 
                                    ImageUrl="~/Images/Add.png" Width="32px" onclick="BtnAdd_Click" />
                            </td>
                            <td style="text-align: left">
                                <asp:ImageButton ID="BtnUpdate" runat="server" Height="24px" 
                                    ImageUrl="~/Images/Edit.png" Width="24px" 
                                    onclientclick="javascript: return confirm('هل انت متاكد ؟')" 
                                    onclick="BtnUpdate_Click" />
                            </td>
                            <td style="text-align: right">
                                <asp:ImageButton ID="BtnDelete" runat="server" Height="24px" 
                                    ImageUrl="~/Images/Delete.png" Width="24px" 
                                    onclientclick="javascript: return confirm('هل انت متاكد ؟')" 
                                    onclick="BtnDelete_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="Yellow" colspan="4" style="text-align: center">
                                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="Yellow" colspan="4" style="text-align: center">
                                &nbsp;</td>
                        </tr>
                    </table>
    
</div>
                    

                
                    
                
                    

                