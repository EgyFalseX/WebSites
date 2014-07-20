<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddNewsInputs.ascx.cs" Inherits="UserControls_AddNewsInputs" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">

        .style1
        {
            width: 771px;
        }
        .style2
        {
            width: 771px;
            height: 173px;
        }
        .style3
        {
            height: 173px;
        }
        </style>
<table align="right" style="width:100%;">
        <tr>
            <td class="style1">&nbsp;
                </td>
            <td align="right">
                <asp:TextBox ID="TxtTitle" runat="server" Width="387px" style="direction: rtl"></asp:TextBox>
            </td>
            <td align="right">
                <asp:Label ID="Label1" runat="server" Text="العنوان"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
            </td>
            <td align="right" class="style3">
                <asp:TextBox ID="TxtDetails" runat="server" Height="158px" Width="388px" 
                    TextMode="MultiLine" style="direction: rtl"></asp:TextBox>
            </td>
            <td align="right" class="style3">
                <asp:Label ID="Label2" runat="server" Text="التفاصيل"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">&nbsp;
                </td>
            <td align="right">
                <br />
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    TargetControlID="TxtDate">
                </cc1:CalendarExtender>
                <asp:CheckBox ID="CBShow" runat="server" Text="لا يعرض" />
                <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox>
                <br />
            </td>
            <td align="right">
                <asp:Label ID="Label3" runat="server" Text="التاريــخ"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="style1" align="right">&nbsp;
                </td>
            <td align="right">
                <asp:Label ID="LblStatus" runat="server" Text="."></asp:Label>
                <asp:Button ID="BtnAddNews" runat="server" onclick="BtnAddNews_Click" 
                    Text="اضافه" />
             </td>
            <td align="right">&nbsp;
                </td>
        </tr>
        
    </table>
    