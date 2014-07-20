<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SBResearchSearch.ascx.cs" Inherits="UserControls_SBResearchSearch" %>
<style type="text/css">
    .SBBooksSearchstyle1 {
        width: 31%;
        height: 354px;
    }
    .SBBooksSearchstyle2
    {        text-align: center;
    }
    .SBBooksSearchstyle3
    {
        width: 139px;
    }
    .SBBookDetialsstyle1
    {
        width: 27%;
    }
    .SBBookDetialsstylestyle5
    {
        width: 90px;
    }
    .SBBookDetialsstyle2
    {
        height: 23px;
        text-align: right;
    }
    .SBBookDetialsstylestyle6
    {
        height: 23px;
        width: 90px;
    }
    .SBBookDetialsstylestyle7
    {
    }
    .SBBookDetialsstylestyle8
    {
        width: 123px;
    }
</style>
<div dir="rtl">

    <table dir="rtl" class="SBBooksSearchstyle1" >
        <tr>
            <td valign="top" class="SBBookDetialsstylestyle7">
                <asp:Label ID="Label9" runat="server" Text="موضوع البحث"></asp:Label>
            </td>
            <td valign ="top">
                <asp:TextBox ID="TxtSearchText" runat="server" Width="240px"></asp:TextBox>
                <br />
                <asp:Button ID="BtnSearch" runat="server" Text="بحـــث" Width="50px" 
                    onclick="BtnSearch_Click" TabIndex="1" />
                <asp:Label ID="LblError" runat="server" ForeColor="Red" Text="كلمة البحث فارغة" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:Label ID="Label1" runat="server" Text="النتائج"></asp:Label>
            </td>
            <td valign="top">
                <asp:ListBox ID="LBBooksResult" runat="server" Height="176px" Width="240px" 
                    AutoPostBack="True" 
                    onselectedindexchanged="LBBooksResult_SelectedIndexChanged" TabIndex="2">
                </asp:ListBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="SBBookDetialsstylestyle7" colspan="2">
                <asp:Panel ID="PnlResearchDetial" runat="server" Height="91px" Visible="False" 
                    Width="423px">
                    <table class="SBBookDetialsstylestyle7">
                        <tr>
                            <td class="SBBookDetialsstylestyle8">
                                <asp:Label ID="Label8" runat="server" Text="مقدم البحث"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LblReOwner" runat="server" Text="None"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SBBookDetialsstylestyle8">
                                <asp:Label ID="Label2" runat="server" Text="موضوع البحث"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LblReSubject" runat="server" Text="None"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SBBookDetialsstylestyle8">
                                <asp:Label ID="Label3" runat="server" Text="تاريخ البحث"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LblReDate" runat="server" Text="None"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="SBBookDetialsstylestyle8">
                                <asp:Label ID="Label4" runat="server" Text="هدف البحث"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtReAim" runat="server" Height="112px" ReadOnly="True" 
                        TextMode="MultiLine" Width="282px" TabIndex="3"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        </table>
        <br />
</div>