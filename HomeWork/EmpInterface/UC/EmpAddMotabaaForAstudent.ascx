<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpAddMotabaaForAstudent.ascx.cs" Inherits="UserControls_EmpAddhomework" %>
<div runat="server" id="asssd" dir="rtl">
<center><table style="width: 422px">
    <tr>
        <td style="width: 188px; height: 21px">
            <center>
                &nbsp; &nbsp;
            <asp:Label ID="Label5" runat="server" Text="ÇáÕÝ" Font-Bold="True" Width="35px"></asp:Label></center>
            <center>
                &nbsp;<asp:DropDownList ID="ddlAlsaf" runat="server" appenddatabounditems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlAlsaf_SelectedIndexChanged" ValidationGroup="SMG" >
                </asp:DropDownList></center>
            <center>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlAlsaf"
                    ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáÕÝ" InitialValue="0" ValidationGroup="SMG"></asp:RequiredFieldValidator></center>
        </td>
        <td style="height: 21px; width: 5px;">
            <center>
                &nbsp;<asp:Label ID="Label4" runat="server" Text="ÇáÝÕá" Font-Bold="True" Font-Underline="False" Width="59px"></asp:Label></center>
            <center>
            <asp:DropDownList ID="ddlAlfasl" runat="server" appenddatabounditems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlAlfasl_SelectedIndexChanged" ValidationGroup="SMG" >
                </asp:DropDownList>&nbsp;</center>
            <center>
                &nbsp;<asp:RequiredFieldValidator ID="RVFasl" runat="server" ControlToValidate="ddlAlfasl"
                    ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáÝÕá" InitialValue="0" ValidationGroup="SMG" Width="96px"></asp:RequiredFieldValidator></center>
        </td>
        <td style="width: 71px; height: 21px">
            &nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="ÇÓã ÇáØÇáÈ" Font-Bold="True" Font-Underline="False" Width="58px"></asp:Label><br />
                <asp:DropDownList ID="ddlStudent" runat="server" appenddatabounditems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlStudent_SelectedIndexChanged" ValidationGroup="SMG" >
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlStudent"
                ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇÓã ÇáÊáãíÐ" InitialValue="0" ValidationGroup="SMG" Width="131px"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td dir="rtl" style="width: 188px">
            &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Underline="False" Text="ÇáÚäæÇä"
                    Width="40px"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Title"
                ErrorMessage="íÌÈ ßÊÇÈÉ ÚäæÇä ÇáãÊÇÈÚÉ" InitialValue="0" ValidationGroup="SMG"></asp:RequiredFieldValidator><br />
            &nbsp;
            
                <asp:TextBox ID="txt_Title" runat="server" Width="151px"></asp:TextBox></td>
        <td dir="rtl">
            <asp:Label ID="lblMessage" runat="server"></asp:Label></td>
        <td dir="ltr">
            &nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="ÇáÊÇÑíÎ" Font-Bold="True" Font-Underline="False"></asp:Label><br />
            <asp:Label ID="lblDate" runat="server" Width="64px"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3" style="height: 21px">
          <center>  <asp:TextBox ID="txtMotabaa" runat="server" Height="101px" TextMode="MultiLine" Width="455px"></asp:TextBox></center>
        </td>
    </tr>
    <tr>
        <td style="width: 188px; height: 21px">
          <center>  <asp:Button ID="btnRemove" runat="server" Text="ãÓÍ ÇáãÊÇÈÚÉ" Font-Bold="True" Font-Underline="False" OnClick="btnRemove_Click" BorderColor="Navy" BorderStyle="Groove" Font-Size="Small" ForeColor="Navy" /></center></td>
        <td style="height: 21px; width: 5px;">
           <center> &nbsp;</center></td>
        <td style="width: 71px; height: 21px">
            <asp:Button ID="btnInsert" runat="server" Text="ÇÑÓÇá  ÇáãÊÇÈÚÉ" onclick="btnInsert_Click" Font-Bold="True" Font-Underline="False" BorderColor="Navy" BorderStyle="Groove" Font-Size="Small" ForeColor="Navy" ValidationGroup="SMG" /></td>
    </tr>
</table></center>
</div>