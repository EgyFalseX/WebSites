<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ServiceQeury.ascx.cs"
    Inherits="ServiceQeury" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }
    .style2
    {
        text-align: right;
        direction: rtl;
        height: 40px;
    }
    .style4
    {
        text-align: center;
        width:18px;
    }
    .style6
    {
        text-align: right;
        height: 47px;
    }
</style>
<table align="center" class="style1">
    <tr>
        <td style="direction: rtl">
            <asp:Label ID="Label1" runat="server" Text="اكتب رقم الاستعلام عن الخدمة :"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="direction: rtl">
            <asp:TextBox ID="TextBox1" runat="server" Width="200px" MaxLength="6"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="direction: rtl; text-align: center">
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="عرض النتيجة" />
        </td>
    </tr>
</table>
<table align="center">
    <tr>
        <td>
            <asp:FormView ID="FormViewDetails" runat="server" CellPadding="4" DataSourceID="AccessDS"
                EmptyDataText="لا يوجد رد على استعلامك أو أنه لا يوجد طلب بهذا الرقم" ForeColor="#333333"
                Visible="False">
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <table>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblserviceId" runat="server" Text='<%# Eval("serviceId") %>'></asp:Label>
                            </td>
                            <td class="style6">
                                :
                            </td>
                            <td class="style2">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="#003399"
                                    Text="رقم الاستعلام "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblservicesType" runat="server" Text='<%# Eval("servicesType") %>'></asp:Label>
                            </td>
                            <td class="style4">
                                :
                            </td>
                            <td class="style2">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="#003399"
                                    Text="الخدمة  "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblcomedate" runat="server" Text='<%# Eval("comedate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </td>
                            <td class="style4">
                                :
                            </td>
                            <td class="style2">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="#003399"
                                    Text="تاريخ الوارد "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblReply" runat="server" Text='<%# Eval("Reply") %>'></asp:Label>
                            </td>
                            <td class="style4">
                                :
                            </td>
                            <td class="style2">
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="#003399"
                                    Text="الرد "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblrremark" runat="server" Text='<%# Eval("rremark") %>'></asp:Label>
                            </td>
                            <td class="style4">
                                :
                            </td>
                            <td class="style2">
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="#003399"
                                    Text="ملاحظات "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <asp:Label ID="lblrplydate" runat="server" Text='<%# Eval("rplydate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </td>
                            <td class="style4">
                                :
                            </td>
                            <td class="style2">
                                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="#003399"
                                    Text="تاريخ الرد "></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:FormView>
        </td>
    </tr>
</table>
<asp:AccessDataSource ID="AccessDS" runat="server" DataFile="../App_Data/services.mdb"
    SelectCommand="SELECT [serviceId], [serviceTypeId], [comedate], [rplydate], [Replyid], [rremark], 
(SELECT servicesType FROM CDserviceType WHERE serviceTypeId = TBLservice.serviceTypeId) AS servicesType, 
(SELECT Reply FROM CDReply WHERE Replyid = TBLservice.Replyid) AS Reply
FROM [TBLservice]
WHERE
serviceId = ?">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" DefaultValue="-1" Name="?" PropertyName="Text" />
    </SelectParameters>
</asp:AccessDataSource>
