<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpAddhomeworkForAstudent.ascx.cs" Inherits="UserControls_EmpAddhomework" %>
<center><table >
    <tr>
        <td >
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="ÇáÕÝ"></asp:Label><br />
            <asp:DropDownList ID="ddl_Elsaf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_Elsaf_SelectedIndexChanged" ValidationGroup="SHWG">
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddl_Elsaf"
                ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáÕÝ" InitialValue="0" ValidationGroup="SHWG" ></asp:RequiredFieldValidator></td>
        <td >
        </td>
        <td >
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="ÇáÝÕá"></asp:Label><br />
            <asp:DropDownList ID="ddlFasl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFasl_SelectedIndexChanged" ValidationGroup="SHWG">
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ID="RVFasl" runat="server" ControlToValidate="ddlFasl"
                ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáÝÕá" InitialValue="0" ValidationGroup="SHWG"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td >
            <center>
                <asp:Label ID="Label5" runat="server" Text="ÇáãÇÏÉ" Font-Bold="True"></asp:Label></center>
            <center>
               
                <asp:DropDownList ID="ddlMadah" runat="server" appenddatabounditems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlMadah_SelectedIndexChanged" ValidationGroup="SHWG" >
            </asp:DropDownList>
                </center>
            <center>
                <asp:RequiredFieldValidator ID="RVMada" runat="server" ControlToValidate="ddlMadah"
                    ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáãÇÏÉ" InitialValue="0" ValidationGroup="SHWG" ></asp:RequiredFieldValidator>&nbsp;</center>
        </td>
        <td  >
            <center>
            <asp:Label ID="Label4" runat="server" Text="ÇáÍÕÉ" Font-Bold="True"></asp:Label>&nbsp;</center>
            <center><asp:DropDownList ID="ddlHesa" runat="server" appenddatabounditems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlHesa_SelectedIndexChanged" ValidationGroup="SHWG" >
                </asp:DropDownList>&nbsp;</center>
            <center>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlHesa"
                    ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇáÍÕÉ" InitialValue="0" ValidationGroup="SHWG"></asp:RequiredFieldValidator></center>
        </td>
        <td  >
            
            <asp:Label ID="Label3" runat="server" Text="ÇÓã ÇáØÇáÈ" Font-Bold="True"></asp:Label><br />
           <asp:DropDownList ID="ddlStudent" runat="server" appenddatabounditems="True" AutoPostBack="True" ValidationGroup="SHWG" >
                </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ID="SRV" runat="server" ControlToValidate="ddlStudent"
                ErrorMessage="íÌÈ ÇÎÊíÇÑ ÇÓã ÇáÊáãíÐ" InitialValue="0" ValidationGroup="SHWG" ></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td  >
           
            <asp:Label ID="Label1" runat="server" Text="ÇáÊÇÑíÎ" Font-Bold="True"></asp:Label>
            <asp:Label ID="lblDate" runat="server" Font-Bold="True"></asp:Label></td>
        <td  >
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtHomework"
                ErrorMessage="íÌÈ ßÊÇÈÉ ÇáæÇÌÈ" InitialValue="0" ValidationGroup="SHWG" Width="133px"></asp:RequiredFieldValidator></td>
        <td >
            <div dir="rtl">
                <asp:Label ID="lblMessage" runat="server" Font-Size="Larger" ForeColor="#0000C0"></asp:Label>&nbsp;</div></td>
    </tr>
    <tr>
        <td colspan="3" >
          <center>  <asp:TextBox ID="txtHomework" runat="server" Height="75px" TextMode="MultiLine" Width="460px" ValidationGroup="SHWG"></asp:TextBox></center>
        </td>
    </tr>
    <tr>
        <td style="height: 25px" >
          <center>  <asp:Button ID="btnInsert" runat="server" Text="ÇÑÓÇá ÇáæÇÌÈ" onclick="btnInsert_Click" Font-Bold="True" BorderColor="Navy" BorderStyle="Groove" Font-Size="Small" ForeColor="Navy" ValidationGroup="SHWG" />&nbsp;</center></td>
        <td style="height: 25px" >
           <center> &nbsp;</center></td>
        <td style="width: 210px; height: 25px">
            <asp:Button ID="btnRemove" runat="server" Text="ãÓÍ ÇáæÇÌÈ" Font-Bold="True" OnClick="btnRemove_Click" BorderColor="Navy" BorderStyle="Groove" Font-Size="Small" ForeColor="Navy" /></td>
    </tr>
</table></center>
