<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SchoolInBriefUser.ascx.cs" Inherits="SchoolInBriefUser" %>

<style type="text/css">
    .style2
    {
        width: 176px;
    }
    .RadListView_Default
    {
        width: 662px;
    }
    .style3
    {
        width: 100px;
    }
    .rlvBDel
    {}
    .rlvEditTable
    {
        width: 651px;
    }
    .style5
    {
        width: 110px;
    }
    .rlvI
    {
        width: 663px;
    }
</style>


<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>


<table align="center" class="style3">
    <tr>
        <td>


<telerik:RadListView ID="RadListView1" runat="server" AllowPaging="True" 
    DataKeyNames="vid" DataSourceID="AboutAccessDataSource" 
    Font-Names="Tahoma" Skin="Forest">
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
        <table style="height: 212px; width: 651px">
            <tr>
                <td class="style2" rowspan="4" valign="top">
                    <asp:Image ID="Image1" runat="server" Height="150px" Width="180px" 
                        ImageUrl="<%# Bind('imageline1') %>" />
                </td>
                <td>
                    <asp:Label ID="LblEngAddress" runat="server" Text='<%# Bind("addresline_e") %>' 
                        Font-Bold="True" Font-Size="17pt" ForeColor="#CC0000" 
                        style="direction: ltr"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    &nbsp;
                    <asp:Label ID="LblTxtEngDetails" runat="server" Font-Size="14pt" 
                        ForeColor="Blue" Text='<%# Bind("line_e") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    <asp:Label ID="LblArAddress" runat="server" Text='<%# Bind("addresline_a") %>' 
                        Font-Bold="True" Font-Size="17pt" ForeColor="#CC0000" 
                        Font-Strikeout="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="LblArDetails" runat="server" Font-Size="15pt" ForeColor="Blue" 
                        style="direction: rtl" Text='<%# Bind("line_a") %>' Font-Strikeout="False"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    </ItemTemplate>
     <EditItemTemplate>
         <table border="1" cellspacing="0" class="rlvEditTable">
             <tr>
                 <td>
                     <asp:Label ID="addresline_eLabel2Edit" runat="server" Text="English Title"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="addresline_eTextBoxEdit" runat="server" CssClass="rlvInput" 
                         Text='<%# Bind("addresline_e") %>' />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="line_eLabel2Edit" runat="server" Text="Details"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="line_eTextBoxEdit" runat="server" CssClass="rlvInput" 
                         Height="70px" Text='<%# Bind("line_e") %>' TextMode="MultiLine" 
                         Width="460px" />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="addresline_aLabel2Edit" runat="server" Text="العنوان بالعربي"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="addresline_aTextBoxEdit" runat="server" CssClass="rlvInput" 
                         Text='<%# Bind("addresline_a") %>' />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="line_aLabel2Edit" runat="server" Text="التفاصيل"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="imageline1TextBox0Edit" runat="server" CssClass="rlvInput" 
                         Height="70px" Text='<%# Bind("line_a") %>' TextMode="MultiLine" 
                         Width="460px" />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="imageline1Label2Edit" runat="server" Text="الصوره"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="imageline1TextBoxEdit" runat="server" CssClass="rlvInput" 
                         Text='<%# Bind("imageline1") %>' />
                 </td>
             </tr>
             <tr>
                 <td colspan="2">
                     <asp:Button ID="PerformUpdateButton" runat="server" CommandName="Update" 
                         Text="Update" ToolTip="Update" Width="100px" />
                     <asp:Button ID="CancelUpdateButton" runat="server" CausesValidation="False" 
                         CommandName="Cancel" Text="Cancel" ToolTip="Cancel" Width="100px" />
                 </td>
             </tr>
         </table>
    </EditItemTemplate>
     <InsertItemTemplate>
        <div class="rlvIEdit">
            <table cellspacing="0" class="rlvEditTable" border="1">
                <tr>
                    <td class="style5">
                        <asp:Label ID="addresline_eLabel2Add" runat="server" Text="English Title"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="addresline_eTextBoxAdd" runat="server" CssClass="rlvInput" 
                            Text='<%# Bind("addresline_e") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:Label ID="line_eLabel2Add" runat="server" 
                            Text="Details"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="line_eTextBoxAdd" runat="server" CssClass="rlvInput" 
                            Height="70px" Text='<%# Bind("line_e") %>' TextMode="MultiLine" 
                            Width="460px" />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:Label ID="addresline_aLabel2Add" runat="server" Text="العنوان بالعربي"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="addresline_aTextBoxAdd" runat="server" CssClass="rlvInput" 
                            Text='<%# Bind("addresline_a") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:Label ID="line_aLabel2Add" runat="server" 
                            Text="التفاصيل"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="imageline1TextBox0Add" runat="server" CssClass="rlvInput" 
                            Height="70px" Text='<%# Bind("line_a") %>' TextMode="MultiLine" 
                            Width="460px" />
                    </td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:Label ID="imageline1Label2Add" runat="server" Text="الصوره"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="imageline1TextBoxAdd" runat="server" CssClass="rlvInput" 
                            Text='<%# Bind("imageline1") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="PerformInsertButton" runat="server" CommandName="PerformInsert" 
                            Text="Insert" ToolTip="Insert" Width="100px" />
                        <asp:Button ID="CancelInsertButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" ToolTip="Cancel" 
                            Width="100px" />
                    </td>
                </tr>
            </table>
        </div>
    </InsertItemTemplate>
     <EmptyDataTemplate>
        <div class="RadListView RadListView_Default">
            <div class="rlvEmpty">
                There are no items to be displayed.</div>
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
<p>
    &nbsp;</p>

