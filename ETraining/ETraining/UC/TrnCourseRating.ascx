<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrnCourseRating.ascx.cs" Inherits="UC_TrnCourseRating" %>
<style type="text/css">
    .style1
    {
        width: 471px;
    }
    .style2
    {
        width: 107px;
    }
    .style3
    {
        width: 491px;
        text-align: center;
    }
    .style4
    {
        text-align: center;
    }
    .style5
    {
        height: 30px;
    }
</style>
<div dir="rtl" class="style4">
<asp:Label ID="LblState" runat="server" Visible="False"></asp:Label>
<br />
    <table class="style3" dir="rtl">
        <tr>
            <td>
    <asp:GridView ID="GVRating" runat="server" AutoGenerateColumns="False" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" GridLines="None" Width="400px">
        <Columns>
            <asp:BoundField DataField="EvalItemId" HeaderText="EvalItemId" 
                Visible="False" />
            <asp:BoundField DataField="EvalItemName" HeaderText="اســم نوع التقييـــــم" />
            <asp:TemplateField HeaderText="التقييــــــــم">
                <ItemTemplate>
                    <asp:DropDownList ID="DDLRate" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="DDLRate_SelectedIndexChanged" Width="99px">
                        <asp:ListItem Selected="True">----لا شيء----</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="Tan" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="style5">
    <asp:Button ID="BtnSave" runat="server" Text="حفـــــــــظ" 
        onclick="BtnSave_Click" Width="100px" />
            </td>
        </tr>
    </table>
        <br />
        
    <div class="style4">
        
    <asp:DataList ID="DLEvalText" runat="server" DataKeyField="EvalItemTextId" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" ForeColor="Black" Width="500px">
        <FooterStyle BackColor="Tan" />
        <AlternatingItemStyle BackColor="PaleGoldenrod" />
        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <ItemTemplate>
            <table class="style1" dir="rtl">
                <tr>
                    <td valign="top" class="style2">
                        <asp:Label ID="LblComentName" runat="server" Text='<%# bind("EvalItemTextName") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TxtComment" runat="server" Height="110px" TextMode="MultiLine" 
                    Width="350px" Text='<%# bind("EvalText") %>' ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td style="text-align: Right">
                        <asp:Button ID="BtnSaveComment" runat="server" Text="حفـــــــظ" 
                    Width="100px" onclick="BtnSaveComment_Click" style="height: 26px" />
                        <asp:Label ID="LblNotify" runat="server" ForeColor="Green"></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    
    </asp:DataList>
    </div>
</div>