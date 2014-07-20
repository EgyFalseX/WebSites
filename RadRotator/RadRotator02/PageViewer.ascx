<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageViewer.ascx.cs" Inherits="PageViewer" %>
<style type="text/css">
    .style1
    {
        width: 649px;
        height: 60px;
    }
</style>
<img class="style2" src="../header_bg.jpg" /></p>
<table align="center" class="style1">
    <tr>
        <td style="text-align: center">
            <%= LoadContain() %>
        </td>
    </tr>
    <tr>
        <td>
            <iframe src="http://www.facebook.com/plugins/like.php?
                href=<% =Server.UrlEncode(Request.Url.ToString()).ToString() %>
                &amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like
                &amp;colorscheme=light&amp;height=80" scrolling="no" frameborder="0" style="border: none; overflow: hidden;
                width: 450px; height: 80px;" allowtransparency="true">
            </iframe>
        </td>
    </tr>
</table>
