<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageViewer.ascx.cs" Inherits="PageViewer" %>
<style type="text/css">
    .style1
    {
        width: 959px;
        height: 60px;
    }
    .style2
    {
        width: 896px;
    }
</style>
<body style="text-align: center">
<img src="../banar.jpg" align="middle" /></p>
<table align="center" class="style1" border="2">
    <tr>
        <td style="text-align: center" valign="middle">
            <%= LoadContain() %>
        </td>
    </tr>
    <tr>
        <td>
            <iframe src="http://www.facebook.com/plugins/like.php?
                href=<% =Server.UrlEncode(Request.Url.ToString()).ToString() %>
                &amp;layout=standard&amp;show_faces=true&amp;width=450&amp;action=like
                &amp;colorscheme=light&amp;height=80" scrolling="no" frameborder="0" style="border-style: none; border-color: inherit; border-width: medium; overflow: hidden;
                width: 450px; height: 80px; text-align: center;" allowtransparency="true">
            </iframe>
        </td>
    </tr>
</table>
    <p>
        <img border="0" 
            src="http://cc.amazingcounters.com/counter.php?i=3099645&amp;c=9299248" 
            alt="invisible statistics" style="float: right; width: 6px" /></p>

