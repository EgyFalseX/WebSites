<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuEditor.ascx.cs" Inherits="QAMenuEditor" %>
<style type="text/css">
    .style1
    {
        width: 600px;
        height: 200px;
    }
    .style2
    {
        width: 144px;
    }
    .style3
    {
        width: 144px;
        height: 36px;
    }
    .style4
    {
        height: 36px;
    }
</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td bgcolor="#33CC33" colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" style="font-size: x-large" 
                    Text="ادخال صفحه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="اسم الصفحه"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAdd" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="مسار الصوره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAddImg" runat="server" Width="300px" TabIndex="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label7" runat="server" Text="معلومه مختصره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAddInfo" runat="server" Width="300px" Height="90px" 
                    TextMode="MultiLine" TabIndex="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label16" runat="server" Text="اللجنــــــه"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLAddLagnaa" runat="server" DataTextField="LagnaName" 
                    DataValueField="LagnaId" Width="300px" TabIndex="8" 
                    DataSourceID="AccessDSCDLagna">
                </asp:DropDownList>
                <asp:AccessDataSource ID="AccessDSCDLagna" runat="server" 
                    DataFile="../Data/FlexibleData.mdb" 
                    SelectCommand="SELECT [LagnaId], [LagnaName] FROM [CDLagna]">
                </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:LinkButton ID="LinkButton1" runat="server" EnableViewState="False" 
                    PostBackUrl="Uploader.aspx" TabIndex="6">صورة</asp:LinkButton>
            </td>
            <td>
                <asp:ImageButton ID="IBAdd" runat="server" Height="32px" 
                    ImageUrl="../images/add.png" onclick="IBAdd_Click" ToolTip="ادخال" 
                    Width="32px" TabIndex="7" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#33CC33" colspan="2" style="text-align: center">
                <asp:Label ID="Label3" runat="server" style="font-size: x-large" 
                    Text="تعديل صفحه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label4" runat="server" Text="اختار صفحه للتعديل"></asp:Label>
            </td>
            <td class="style4">
                <asp:DropDownList ID="DDLItems" runat="server" DataTextField="ItemName" 
                    DataValueField="ItemID" Width="300px" AutoPostBack="True" 
                    onselectedindexchanged="DDLItems_SelectedIndexChanged" TabIndex="8">
                </asp:DropDownList>
                <asp:ImageButton ID="IBDelete" runat="server" Height="32px" 
                    ImageUrl="../images/delete.png"
                    onclientclick="javascript: return confirm('هل انت متاكد ؟')"
                    onclick="IBDelete_Click" ToolTip="حذف" 
                    Width="32px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="اسم الصفحه"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEdit" runat="server" Width="300px" TabIndex="9"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label8" runat="server" Text="مسار الصوره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEditImg" runat="server" Width="300px" TabIndex="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label9" runat="server" Text="معلومه مختصره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEditInfo" runat="server" Width="300px" Height="90px" 
                    TextMode="MultiLine" TabIndex="11"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label17" runat="server" Text="اللجنــــــه"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLEditLagnaa" runat="server" DataTextField="LagnaName" 
                    DataValueField="LagnaId" Width="300px" TabIndex="8" 
                    DataSourceID="AccessDSCDLagna">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:ImageButton ID="IBEdit" runat="server" Height="32px" 
                    ImageUrl="../images/edit.png" onclick="IBEdit_Click" ToolTip="تعديل" 
                    Width="32px" TabIndex="15" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblMsg" runat="server" style="font-size: x-large"></asp:Label>
            </td>
        </tr>
    </table>
</div>