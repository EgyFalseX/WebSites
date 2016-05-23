<%@ Page Title="مكتبة الفيديو" Language="C#" MasterPageFile="masterVideo1.master" AutoEventWireup="true" CodeFile="VideoPlayer.aspx.cs" Inherits="VideoPlayer" %>

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
                <asp:Button ID="btnBacktoCategory" runat="server" OnClick="btnBacktoCategory_Click" Text="السابق" />
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
<tr>
        <td>
            <!-- AddThis Button BEGIN -->
<script type="text/javascript">
//<!--
var addthis_product = 'wpp-250';
var addthis_append_data = 'true';

//-->
</script>
<div class="addthis_container addthis_toolbox addthis_default_style" addthis:url="<% =Server.UrlEncode(Request.Url.ToString()).ToString() %>" addthis:title="نقابة المهن التعليمية"><a href="http://www.addthis.com/bookmark.php?v=250&amp;username=" class="addthis_button_compact">Share</a><span class="addthis_separator">|</span><a class="addthis_button_tweet"></a><a class="addthis_button_facebook_like"></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username="></script></div>
<!-- AddThis Button END --></br> 
        </td>
    </tr>
    </table>


</asp:Content>

