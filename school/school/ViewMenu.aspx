<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ViewMenu.aspx.cs" Inherits="ViewMenu" Title="بيانات ومعلومات" %>


<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
          .style1
    {
        width: 560px;
        height: 112px;
    }
    .style2
    {
        width: 117px;
        height: 80px;
    }
    .style3
    {        height: 100px;
        width: 376px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="اختر الادارة">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxComboBox ID="cbEdara" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbEdara_SelectedIndexChanged" ValueType="System.String">
                </dx:ASPxComboBox>
            <asp:AccessDataSource ID="DSDataEdara" runat="server" 
                DataFile="Data/FlexibleData.mdb" 
                SelectCommand="SELECT [edaraid], [edara] FROM [cdedara]" 
                OnSelecting="DSData_Selecting" oninserting="DSData_Inserting" 
                onupdating="DSData_Updating">
            </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="اختر المدرسة">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxComboBox ID="cbSchool" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbSchool_SelectedIndexChanged" ValueType="System.String">
                </dx:ASPxComboBox>
            <asp:AccessDataSource ID="DSDataSchool" runat="server" 
                DataFile="Data/FlexibleData.mdb" 
                SelectCommand="SELECT [schoolid], [schoolname], [edaraid] FROM [cdschool] WHERE ([edaraid] = ?)" 
                OnSelecting="DSData_Selecting" oninserting="DSData_Inserting" 
                onupdating="DSData_Updating">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cbEdara" DefaultValue="0" Name="edaraid" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
        <table align="center" style="height: 90px" class="style1">
            <tr>
                <td class="style2" valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic", "files/{0}") %>' runat="server" 
                        Height="94px" Width="102px" />
                </td>
                <td align="right" class="style3" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text = '<%# bind("ItemName") %>' 
                        NavigateUrl = '<%# bind("ItemID") %>' Font-Bold="True"></asp:HyperLink>
                    <br />
                   
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfo") %>' 
                        BorderStyle="None" Height="61px" Width="445px" style="direction: rtl" 
                        TextMode="MultiLine" Font-Bold="True"></asp:TextBox>
                
          
        </table>   
    </ItemTemplate>
    </asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="Data/FlexibleData.mdb" 
    SelectCommand="SELECT 'ViewDetails.aspx?id=' &amp; ItemID AS ItemID, ItemName, Data_Path, ItemInfo, ItemPic FROM MenuItem WHERE (schoolid = ?)">
    <SelectParameters>
        <asp:ControlParameter ControlID="cbSchool" DefaultValue="0" Name="?" PropertyName="Value" />
    </SelectParameters>
</asp:AccessDataSource>
            </td>
        </tr>
    </table>
    </asp:Content>

