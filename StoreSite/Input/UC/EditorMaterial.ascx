<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorMaterial.ascx.cs" Inherits="EditorMaterial" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .materstyle1
    {
        width: 508px;
        height: 57px;
    }
    .materstyle2
    {
        height: 22px;
        width: 271px;
    }
    .materstyle4
    {
        height: 22px;
        }
    .materstyle5
    {
        width: 271px;
        text-align: right;
    }
    .materstyle6
    {
        width: 50%;
    }
    .materstyle7
    {
        width: 142px;
    }
    .materstyle8
    {
        width: 76px;
    }
    .style1
    {
        height: 22px;
        text-align: center;
    }
    .style2
    {
        height: 22px;
        width: 108px;
        text-align: center;
    }
    .style4
    {
        width: 100px;
    }
    .style5
    {
        text-align: right;
    }
</style>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
                <table class="materstyle1" dir="rtl" align="center">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label1" runat="server" Text="اسم الصنف" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="materstyle5">
                <asp:TextBox ID="TxtMaterial" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label4" runat="server" Text="حد الطلب" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="materstyle5">
                <asp:TextBox ID="TxtRestorePoint" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label5" runat="server" Text="سعر  البيع" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="materstyle5">
                <asp:TextBox ID="TxtOutPrice" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="materstyle5">
                <asp:CheckBox ID="CheckBoxSerNotNull" runat="server" Checked="True" 
                    Font-Bold="True" Font-Size="14px" Text="ادخال السريال" ForeColor="Black" />
            </td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label7" runat="server" Text="مسار الصورة" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="materstyle5" dir="ltr">
                <telerik:RadUpload ID="RadUploadPicUrl" Runat="server" 
                    ControlObjectsVisibility="None" EnableTheming="True" Font-Bold="True" 
                    Font-Size="14px" Font-Strikeout="False" InputSize="20" Language="Arabic" 
                    MaxFileInputsCount="2" MaxFileSize="524288" Skin="Default" 
                    style="text-align: right" 
                    OverwriteExistingFiles="True" ReadOnlyFileInputs="True" 
                    ForeColor="Black" />
            </td>
        </tr>
        </table>
<table align="center" class="style4">
    <tr>
        <td>
            <asp:Panel ID="PnlPopCus" ScrollBars="Both"
                        runat="server" Width="230px" Height="200px" CssClass="modalPopup" 
                                BorderColor="#3399FF" BorderStyle="Solid"  >
                        <telerik:RadTreeView ID="RadTreeViewCat" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
                            Skin="Hay" style="text-align: left; direction: ltr;" Font-Bold="True" 
                            Font-Size="14px" AllowNodeEditing="True" 
                            onnodeclick="RadTreeViewCat_NodeClick">
                            <ExpandAnimation Duration="100" />
                            <CollapseAnimation Duration="100" Type="OutQuint" />
                        </telerik:RadTreeView>
            </asp:Panel>
        </td>
    </tr>
</table>
<table class="materstyle1" dir="rtl" align="center">
        <tr>
            <td class="style2">
                </td>
            <td>
                <asp:Button ID="BtnAdd" runat="server" Text="اضافة" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" 
                    onclick="BtnAdd_Click" />
                <asp:Button ID="BtnUpdate" runat="server" Text="تعديل" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" Enabled="False" 
                    onclick="BtnUpdate_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1" bgcolor="Yellow" colspan="2">
                <asp:Label ID="LblState" runat="server" Visible="False" Font-Bold="True" 
                    Font-Size="16px"></asp:Label>
                </td>
        </tr>
    </table>
<table align="center">
        <tr>
            <td>
        <asp:GridView ID="GridViewMaterial" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" EnableModelValidation="True" Font-Bold="True" 
            Font-Size="14px" GridLines="None" Width="564px" 
            EmptyDataText="لا يوجد اصناف" style="text-align: center; direction: rtl;" 
                    ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Material" HeaderText="اسم الصنف" />
                <asp:BoundField DataField="RestorePoint" HeaderText="حد الطلب" />
                <asp:BoundField DataField="OutPrice" HeaderText="سعر اليع" />
                <asp:BoundField DataField="SerNotNull" HeaderText="دخول السريال" />
                <asp:TemplateField HeaderText="مسار الصورة">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PicUrl") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="39px" 
                            ImageUrl='<%# Bind("PicUrl") %>' Width="38px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تعديل" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenFieldEditMaterialId" runat="server" 
                            Value='<%# Bind("MaterialId") %>' />
                        <asp:ImageButton ID="ImageButtonEdit" runat="server" Height="26px" 
                            ImageUrl="~/Images/Edit.png" onclick="ImageButtonEdit_Click" 
                            Width="33px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="حذف" ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButtonDelete" runat="server" Height="26px" 
                            ImageUrl="~/Images/Delete.png" onclick="ImageButtonDelete_Click" 
                            onclientclick="javascript: return confirm('هل انت متاكد ؟')" 
                            Width="33px" />
                        <asp:HiddenField ID="HiddenFieldDeletePicUrl" runat="server" 
                            Value='<%# Bind("PicUrl") %>' />
                        <asp:HiddenField ID="HiddenFieldDeleteMaterialId" runat="server" 
                            Value='<%# Bind("MaterialId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
                </td>
        </tr>
    </table>



