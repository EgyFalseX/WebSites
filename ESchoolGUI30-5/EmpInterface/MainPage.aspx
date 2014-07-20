<%@ Page Language="C#" MasterPageFile="~/EmpInterface/EmpMasterPage.master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="EmpInterface_MainPage" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EmpGadwal.ascx" TagName="EmpGadwal" TagPrefix="uc2" %>

<%@ Register Src="../UserControls/EmpAddhomework.ascx" TagName="EmpAddhomework" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="height: 56px; width: 563px;" >
                <table >
                    <tr>
                        <td style="width: 141px; height: 50px">
                            <asp:Button ID="Button2" runat="server" BackColor="LightSteelBlue" BorderColor="#0000C0"
                                Font-Bold="True" Font-Size="Larger" ForeColor="#0000C0" Text="ÇáãÊÇÈÚÉ ÇáíæãíÉ"
                                Width="109px" OnClick="Button2_Click1" /></td>
                        <td style="height: 50px" >
                            <asp:Button ID="Button1" runat="server" BackColor="LightSteelBlue" BorderColor="#0000C0"
                                Font-Bold="True" Font-Overline="False" Font-Size="Larger" ForeColor="#0000C0"
                                Text="ÔÆæä ÇáÚÇãáíä" Width="115px" OnClick="Button1_Click" /></td>
                    </tr>
                    <tr>
                        <td style="width: 141px; height: 40px;">
                            <asp:Button ID="Button4" runat="server" BackColor="LightSteelBlue" BorderColor="#0000C0"
                                Font-Bold="True" Font-Size="Larger" ForeColor="#0000C0" Text="ÇáÌÏæá ÇáãÏÑÓí"
                                Width="109px" OnClick="Button4_Click" /></td>
                        <td style="width: 88px; height: 40px;">
                            <asp:Button ID="Button3" runat="server" BackColor="LightSteelBlue" BorderColor="#0000C0"
                                Font-Bold="True" Font-Size="Larger" ForeColor="#0000C0" Text="ÇáæÇÌÈ ÇáãÏÑÓí"
                                Width="115px" OnClick="Button3_Click" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 40px">
                            <asp:Button ID="Button5" runat="server" BackColor="LightSteelBlue" BorderColor="Navy"
                                BorderStyle="Groove" Font-Bold="True" Font-Size="Larger" ForeColor="#0000C0"
                                OnClick="Button5_Click" Text="ÊÓÌíá ÇáÎÑæÌ" /></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
   
    
</asp:Content>

