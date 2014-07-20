<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddInfoInputs.ascx.cs" Inherits="UserControls_AddInfoInputs" %>
<style type="text/css">

        .style2
        {
            width: 771px;
            height: 173px;
        }
        .style3
        {
            height: 173px;
        }
        .style1
        {
            width: 771px;
        }
        </style>
    <table align="right" style="width:100%;">
        <tr>
            <td class="style2">
            </td>
            <td align="right" class="style3">
                <asp:TextBox ID="TxtDetails" runat="server" Height="158px" Width="388px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td align="right" class="style3">
                <asp:Label ID="Label2" runat="server" Text="معلــومه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td align="right">
                <asp:ListBox ID="LBDay" runat="server" Height="24px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                </asp:ListBox>
            </td>
            <td align="right">
                <asp:Label ID="Label3" runat="server" Text="تاريخ العرض"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="style1" align="right">
                &nbsp;</td>
            <td align="right">
                <asp:Label ID="LblStatus" runat="server" Text="."></asp:Label>
                <asp:Button ID="BtnAddNews" runat="server" onclick="BtnAddInfo_Click" 
                    Text="اضافه" />
             </td>
            <td align="right">
                &nbsp;</td>
        </tr>
    </table>
    