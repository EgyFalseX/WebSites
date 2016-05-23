<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewDetails.ascx.cs" Inherits="ViewDetails" %>
<style type="text/css">
    .style1
    {
        width: 826px;
        height: 60px;
    }
    .style2
    {
        width: 388px;
    }
</style>

<table align="center" class="style1">
    <tr>
        <td style="text-align: center" colspan="2">
            <%= LoadContain() %>
        </td>
    </tr>
<tr>
        <td align="right" class="style2">
            <!-- AddThis Button BEGIN -->
<!-- AddThis Button END -->
          <iframe src="//www.facebook.com/plugins/like.php?href=https://www.facebook.com/Egycs4s&amp;width&amp;layout=button&amp;action=like&amp;show_faces=false&amp;share=false&amp;height=35" 
                scrolling="no" frameborder="0" 
                
                                
                style="border-style: none; border-color: inherit; border-width: medium; overflow:hidden; height:26px; text-align: center; width: 88px;" allowTransparency="true" 
                align="middle" id="I1" name="I1"></iframe>
            </br> 
        </td>
        <td>
<div class="addthis_container addthis_toolbox addthis_default_style" 
                    addthis:url="<% =Server.UrlEncode(Request.Url.ToString()).ToString() %>" 
                    addthis:title="" align="left"><a href="http://www.addthis.com/bookmark.php?v=250&amp;username=" class="addthis_button_compact">Share</a><span class="addthis_separator"></span><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username="></script></div>
        </td>
    </tr>
</table>

