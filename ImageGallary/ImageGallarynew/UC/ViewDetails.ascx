<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewDetails.ascx.cs" Inherits="ViewDetails" %>
<style type="text/css">
    .style1
    {
        width: 937px;
        height: 60px;
    }
    .style2
    {
        text-align: center;
    }
</style>
<img src="../../banar.jpg" style="width: 934px" /></p>
<table align="center" class="style1" border="2" width="960">
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
