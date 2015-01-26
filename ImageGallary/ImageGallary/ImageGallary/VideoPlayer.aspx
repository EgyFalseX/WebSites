<%@ Page Title="" Language="C#" MasterPageFile="masterVideo.master" AutoEventWireup="true" CodeFile="VideoPlayer.aspx.cs" Inherits="VideoPlayer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center">
                <asp:Button ID="btnBacktoCategory" runat="server" OnClick="btnBacktoCategory_Click" Text="الي مجلد الفيديو" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div style="text-align: center">
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lblDesc" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Blue"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; direction: rtl;">
                <asp:Label ID="lblvcount" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </td>
        </tr>
    </table>


</asp:Content>

