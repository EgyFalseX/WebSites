﻿<%@ Page Title="فرسان الثقافة _مدارس كريم الخاصة" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="AboutPageViewer.aspx.cs" Inherits="AboutPageViewer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 649px;
        height: 60px;
    }
</style>
    <table align="center" class="style1">
    <tr>
        <td style="text-align: center">
            <%= LoadContain() %>
        </td>
    </tr>
     <td>
            <!-- AddThis Button BEGIN -->
<script type="text/javascript">
    //<!--
    var addthis_product = 'wpp-250';
    var addthis_append_data = 'true';

    //-->
</script>
<div class="addthis_container addthis_toolbox addthis_default_style" addthis:url="<% =Server.UrlEncode(Request.Url.ToString()).ToString() %>" addthis:title="فرسان كريم"><a href="http://www.addthis.com/bookmark.php?v=250&amp;username=" class="addthis_button_compact">Share</a><span class="addthis_separator">|</span><a class="addthis_button_tweet"></a><a class="addthis_button_facebook_like"></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username="></script></div>
<!-- AddThis Button END --> 
        </td>
</table>
</asp:Content>
