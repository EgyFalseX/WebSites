<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsUserControl.ascx.cs" Inherits="UserControls.NewsUserControl" %>
<!-- Page generated at 2015-06-24 11:12:29 +0000 -->
   

    <!-- Latest compiled and minified CSS -->

<link href="../Styles/Events/foundation.min.css" media="all" rel="stylesheet" />
<link href="../Styles/Events/site-widgets.css" media="all" rel="stylesheet" />
<link href="../Styles/Events/v2_style.css" media="all" rel="stylesheet" />

    
 
 

    <!-- Main Scripts -->

<script type="text/javascript" async="" src="../Scripts/Events/dc.js"></script>
<script type="text/javascript" src="../Scripts/Events/jquery-2.1.1.min.js"></script>


<style type="text/css">

        #content{
            padding:0;
            min-height:initial;
        }
        .widget-scrolling-area {
            height: 400px;
            overflow: hidden;
        }

        .iframegenrator {
            text-align: right;
            direction: rtl;
        }
    
</style>
  <script type="text/javascript">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-2072328-16']);
      _gaq.push(['_trackPageview']);
      (function () {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          //ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

</script>



<div id="content" class="iframegenrator">
    <h1 class="title title-s4 nm" data-include-height="">الأخبار <i class="ico logo-small"></i></h1>
     <div class="widget-scrolling-area media-default" style="height: 70px;">

<%
    
 
    NewsWebApplication_NewsClass eventdata = new NewsWebApplication_NewsClass();
    System.Data.DataTable dt = eventdata.GetData();
    string x;
    foreach (System.Data.DataRow row in dt.Rows)
    {
        x = "<article class='media media-style1 media-style1-s1 btw clearfix'><div class='media-object'>";
        x += "<a href='../ViewDetails.aspx?ID=" + row["ID"] + "' target='_blank' class='l'><img  class='media-image' src='../../" + row["EventImage"] + "'/></a></div>";
        x += "<div class='media-body clearfix'><h4 class='media-heading'><a href='../ViewDetails.aspx?ID=" + row["ID"] + "' target='_blank' class='l'>" + row["TitleAr"] + "</a></h4>";
        x += "<div class='time'><i class='ico ico-time-elapsed ml'></i><span class='time-elapsed' title='" + row["EventDate"] + "'>" + String.Format("{0:yyyy/MM/dd}", row["EventDate"]) + "</span></div></div></article>";
        Response.Write(x);
    }
    
     %>

<%--<article class="media media-style1 media-style1-s1 btw clearfix">
        <div class="media-object"><a href="http://www.akhbarak.net/articles/19090208-%D8%A7%D9%84%D9%85%D9%82%D8%A7%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D9%85%D8%B5%D8%AF%D8%B1-%D8%A8%D8%A7%D9%84%D9%81%D9%8A%D8%AF%D9%8A%D9%88%D8%8C-%D9%85%D8%A7-%D8%B3%D8%B1%D9%91-%D8%A7%D8%B2%D8%AF%D9%88%D8%A7%D8%AC%D9%8A%D8%A9?sec=world&src=%D9%82%D9%86%D8%A7%D8%A9+%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85" class="l">
            <img alt="19090208-small" class="media-image"  src="./default_files/19090208-small.jpg"></a></div>
        <div class="media-body clearfix">
          <h4 class="media-heading">
            <a href="http://www.akhbarak.net/articles/19090208-%D8%A7%D9%84%D9%85%D9%82%D8%A7%D9%84-%D9%85%D9%86-%D8%A7%D9%84%D9%85%D8%B5%D8%AF%D8%B1-%D8%A8%D8%A7%D9%84%D9%81%D9%8A%D8%AF%D9%8A%D9%88%D8%8C-%D9%85%D8%A7-%D8%B3%D8%B1%D9%91-%D8%A7%D8%B2%D8%AF%D9%88%D8%A7%D8%AC%D9%8A%D8%A9?sec=world&src=%D9%82%D9%86%D8%A7%D8%A9+%D8%A7%D9%84%D8%B9%D8%A7%D9%84%D9%85" target="_blank">بالفيديو، ما سرّ ازدواجية ايصال مساعدات لبلدات سورية، ومن يقف خلفها؟</a>
          </h4>
          <div class="time"><i class="ico ico-time-elapsed ml"></i>
				<span class="time-elapsed" title="2015-06-24T12:16:39+02:00">06/24 12:16</span>
			</div>

        </div>
      </article>--%>

         </div>
           <a href="../ViewDetails.aspx" target="_blank" class="btn-s2 block btw block text-left" data-include-height="">المزيد</a>
         </div>
<%--<script src="./default_files/widgetgen.js" type="text/javascript"></script>
<script src="./default_files/main.manifest.js" type="text/javascript"></script>--%>

<script src="../Scripts/Events/main.manifest.js"></script>
<script src="../Scripts/Events/widgetgen.js"></script>
