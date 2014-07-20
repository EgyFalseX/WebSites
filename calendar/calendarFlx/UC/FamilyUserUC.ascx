<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FamilyUserUC.ascx.cs" Inherits="FamilyUserUC" %>
<style type="text/css">
    .style1
    {
        text-align: right;
    }
    .style3
    {
        width: 100px;
    }
    .style4
    {
        width: 1px;
    }
</style>


<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>


<table align="center" class="style3">
    <tr>
        <td>
            <telerik:RadListView ID="RadListView1" runat="server" AllowPaging="True" 
                DataKeyNames="vid" DataSourceID="AboutAccessDataSource" Font-Names="Tahoma" 
                Skin="Forest">
                <LayoutTemplate>
                    <LayoutTemplate>
                        <div class="RadListView RadListViewFloated RadListView_Default">
                            <div class="rlvFloated">
                                <div ID="itemPlaceholder" runat="server">
                                </div>
                            </div>
                            <telerik:RadDataPager ID="RadDataPager1" runat="server" 
                                PagedControlID="RadListView1" PageSize="5" Skin="Forest">
                                <Fields>
                                    <telerik:RadDataPagerButtonField FieldType="FirstPrev" />
                                    <telerik:RadDataPagerButtonField FieldType="NextLast" />
                                </Fields>
                            </telerik:RadDataPager>
                        </div>
                    </LayoutTemplate>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="rlvI">
                        <table align="center" border="0" cellpadding="0" cellspacing="0" 
                            style="display: inline-table;" width="512">
                            <!-- fwtable fwsrc="FalseX" fwpage="Page 1" fwbase="swirly_frame_vector.jpg" fwstyle="Dreamweaver" fwdocid = "1712576410" fwnested="0" -->
                            <tr>
                                <td>
                                    <img src="../images/spacer.gif" width="69" height="1" 
           border="0" alt="" />
                                </td>
                                <td colspan="2">
                                    <img src="../images/spacer.gif" width="151" 
           height="1" border="0" alt="" />
                                </td>
                                <td>
                                    <img src="../images/spacer.gif" width="292" height="1" 
           border="0" alt="" />
                                </td>
                                <td>
                                    <img src="../images/spacer.gif" width="1" height="1" 
           border="0" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <img name="swirly_frame_vector_r1_c1" 
           src="../images/swirly_frame_vector_r1_c1.jpg" width="220" height="165" 
           border="0" id="swirly_frame_vector_r1_c1" alt="" />
                                </td>
                                <td rowspan="3">
                                    <img name="swirly_frame_vector_r1_c3" 
           src="../images/swirly_frame_vector_r1_c3.jpg" width="292" height="410" 
           border="0" id="swirly_frame_vector_r1_c3" alt="" />
                                </td>
                                <td>
                                    <img src="../images/spacer.gif" width="1" height="165" 
           border="0" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2">
                                    <img name="swirly_frame_vector_r2_c1" 
           src="../images/swirly_frame_vector_r2_c1.jpg" width="69" height="245" 
           border="0" id="swirly_frame_vector_r2_c1" alt="" />
                                </td>
                                <td colspan="2">
                                    <asp:Image ID="Img" runat="server" Height="200px" Width="144px" />
                                </td>
                                <td>
                                    <img src="../images/spacer.gif" width="1" height="202" 
           border="0" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <img name="swirly_frame_vector_r3_c2" 
           src="../images/swirly_frame_vector_r3_c2.jpg" width="151" height="43" 
           border="0" id="swirly_frame_vector_r3_c2" alt="" />
                                </td>
                                <td>
                                    <img src="../images/spacer.gif" width="1" height="43" 
           border="0" alt="" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" colspan="2">
                                    <asp:Label ID="Label5" runat="server"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" colspan="2">
                                    <asp:Label ID="Label6" runat="server"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" colspan="2">
                                    <asp:Label ID="Label7" runat="server"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" colspan="2">
                                    <asp:Label ID="Label8" runat="server"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
                <InsertItemTemplate>
                    <div class="rlvIEdit">
                    </div>
                </InsertItemTemplate>
                <EmptyDataTemplate>
                    <div class="RadListView RadListView_Default">
                        <div class="rlvEmpty">
                            There are no items to be displayed.There are no items to be displayed.</div>
                    </div>
                </EmptyDataTemplate>
                <SelectedItemTemplate>
                    <div class="rlvISel">
            <br />
                        <asp:Label ID="vidLabel" runat="server" Text='<%# Eval("vid") %>' />
            <br />
                        <asp:Label ID="addresline_eLabel" runat="server" 
                            Text='<%# Eval("addresline_e") %>' />
            <br />
                        <asp:Label ID="line_eLabel" runat="server" Text='<%# Eval("line_e") %>' />
            <br />
                        <asp:Label ID="addresline_aLabel" runat="server" 
                            Text='<%# Eval("addresline_a") %>' />
            <br />
                        <asp:Label ID="line_aLabel" runat="server" Text='<%# Eval("line_a") %>' />
            <br />
                        <asp:Label ID="imageline1Label" runat="server" 
                            Text='<%# Eval("imageline1") %>' />
                    </div>
                </SelectedItemTemplate>
            </telerik:RadListView>
        </td>
    </tr>
</table>
<asp:AccessDataSource ID="AboutAccessDataSource" runat="server" 
    DataFile="../App_Data/ABOUT.mdb" 
    DeleteCommand="DELETE FROM [lines] WHERE [vid] = ?" 
    InsertCommand="INSERT INTO [lines] ([addresline_e], [line_e], [addresline_a], [line_a], [imageline1]) VALUES (?, ?, ?, ?, ?)" 
    SelectCommand="SELECT [vid], [addresline_e], [line_e], [addresline_a], [line_a], [imageline1] FROM [lines]" 
    UpdateCommand="UPDATE [lines] SET [addresline_e] = ?, [line_e] = ?, [addresline_a] = ?, [line_a] = ?, [imageline1] = ? WHERE [vid] = ?">
    <DeleteParameters>
        <asp:Parameter Name="vid" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="addresline_e" Type="String" />
        <asp:Parameter Name="line_e" Type="String" />
        <asp:Parameter Name="addresline_a" Type="String" />
        <asp:Parameter Name="line_a" Type="String" />
        <asp:Parameter Name="imageline1" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="addresline_e" Type="String" />
        <asp:Parameter Name="line_e" Type="String" />
        <asp:Parameter Name="addresline_a" Type="String" />
        <asp:Parameter Name="line_a" Type="String" />
        <asp:Parameter Name="imageline1" Type="String" />
        <asp:Parameter Name="vid" Type="Int32" />
    </UpdateParameters>
</asp:AccessDataSource>
