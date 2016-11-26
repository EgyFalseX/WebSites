<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpAddhomework.ascx.cs" Inherits="UserControls_EmpAddhomework" %>
<%@ Register Src="emgPerviousPage.ascx" TagName="emgPerviousPage" TagPrefix="uc1" %>
<center>
    &nbsp;</center>
<center>
    &nbsp;</center>
<center>
    <table style="width: 422px">
    <tr>
        <td >
            <center>
            <asp:Label ID="Label2" runat="server" Text="ÇáÕÝ" Font-Bold="True"></asp:Label></center>
            <center>
                <asp:DropDownList ID="ddl_Elsaf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_Elsaf_SelectedIndexChanged" ValidationGroup="HWG"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_Elsaf"
                    ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáÕÝ" InitialValue="0" ValidationGroup="HWG" Width="111px"></asp:RequiredFieldValidator></center>
        </td>
        <td >
            <center>
            <asp:Label ID="Label3" runat="server" Text="ÇáÝÕá" Font-Bold="True"></asp:Label></center>
            <center>
                <asp:DropDownList ID="ddlFasl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFasl_SelectedIndexChanged" ValidationGroup="HWG" >
                </asp:DropDownList>&nbsp;</center>
            <center>
                <asp:RequiredFieldValidator ID="RVFasl" runat="server" ControlToValidate="ddlFasl"
                    ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáÝÕá" InitialValue="0" ValidationGroup="HWG"></asp:RequiredFieldValidator>
                &nbsp;</center>
        </td>
    </tr>
    <tr>
        <td>
            <center>
                <asp:Label ID="Label5" runat="server" Text="ÇáãÇÏÉ" Font-Bold="True"></asp:Label></center>
            <center>
                <asp:DropDownList ID="ddlMadah" runat="server" appenddatabounditems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlMadah_SelectedIndexChanged" ValidationGroup="HWG" >
            </asp:DropDownList>
                </center>
            <center>
                <asp:RequiredFieldValidator ID="RVMada" runat="server" ControlToValidate="ddlMadah"
                    ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáãÇÏÉ" ValidationGroup="HWG" Width="102px"></asp:RequiredFieldValidator>&nbsp;</center>
        </td>
        <td >
            <center>
                <asp:Label ID="Label4" runat="server" Text="ÇáÍÕÉ" Font-Bold="True"></asp:Label></center>
            <center>
                <asp:DropDownList ID="ddlHesa" runat="server" appenddatabounditems="True" AutoPostBack="True" ValidationGroup="HWG" >
                </asp:DropDownList>&nbsp;</center>
            <center>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáÍÕÉ"
                    InitialValue="0" ValidationGroup="HWG" ControlToValidate="ddlHesa"></asp:RequiredFieldValidator></center>
        </td>
    </tr>
    <tr>
        <td dir="rtl">
            &nbsp;<asp:Label ID="Label1" runat="server" Text="ÇáÊÇÑíÎ" Font-Bold="True"></asp:Label>
                <asp:Label ID="lblDate" runat="server"></asp:Label></td>
        <td  >
            <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="#0000C0"
                Width="184px"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHomework"
                ErrorMessage="íÌÈ ßÊÇÈÉ ÇáæÇÌÈ" InitialValue="0" ValidationGroup="HWG" Width="133px"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td colspan="2" style="height: 21px">
          <center>  <asp:TextBox ID="txtHomework" runat="server" Height="75px" TextMode="MultiLine" Width="417px" ForeColor="Navy" ValidationGroup="HWG"></asp:TextBox></center></td>
    </tr>
    <tr>
        <td >
          <center>  <asp:Button ID="btnInsert" runat="server" Text="ÇÑÓÇá ÇáæÇÌÈ" onclick="btnInsert_Click" Font-Bold="True" BorderColor="Navy" BorderStyle="Groove" Font-Size="Small" ForeColor="Navy" ValidationGroup="HWG" />&nbsp;</center></td>
        <td >
           <center> <asp:Button ID="btnRemove" runat="server" Text="ãÓÍ ÇáæÇÌÈ" Font-Bold="True" OnClick="btnRemove_Click" BorderColor="Navy" BorderStyle="Groove" Font-Size="Small" ForeColor="Navy" />
           </center></td>
    </tr>
</table>
</center>
