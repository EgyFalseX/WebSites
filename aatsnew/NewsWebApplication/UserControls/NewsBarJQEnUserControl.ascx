<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsBarJQEnUserControl.ascx.cs" Inherits="ArabTeacher.UserControls.NewsBarJQEnUserControl" %>
<link href="../Styles/NewsBar/ticker-style.css" rel="stylesheet" />
<%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.0/jquery.min.js"></script> --%>
<script src="../Scripts/jquery-1.7.1.min.js"></script>
<script src="../Scripts/NewsBar/includes/jquery.ticker.js"></script>

<script type="text/javascript">
 
        $(function () {
            $('#js-news').ticker({
                speed: 0.10,           // The speed of the reveal
                ajaxFeed: false,       // Populate jQuery News Ticker via a feed
                feedUrl: false,        // The URL of the feed
                // MUST BE ON THE SAME DOMAIN AS THE TICKER
                feedType: 'xml',       // Currently only XML
                htmlFeed: true,        // Populate jQuery News Ticker via HTML
                debugMode: true,       // Show some helpful errors in the console or as alerts
                // SHOULD BE SET TO FALSE FOR PRODUCTION SITES!
                controls: true,        // Whether or not to show the jQuery News Ticker controls
                titleText: 'آخر الاخبار',   // To remove the title set this to an empty String
                displayType: 'reveal', // Animation type - current options are 'reveal' or 'fade'
                direction: 'rtl' ,      // Ticker direction - current options are 'ltr' or 'rtl'
                pauseOnItems: 2000,    // The pause on a news item before being replaced
                fadeInSpeed: 600,      // Speed of fade in animation
                fadeOutSpeed: 300      // Speed of fade out animation
            });
        });
</script>



<ul id="js-news" class="js-hidden" >
<%
    
 
    NewsWebApplication_NewsClass eventdata = new NewsWebApplication_NewsClass();
    System.Data.DataTable dt = eventdata.GetData();
    string x;
    foreach (System.Data.DataRow row in dt.Rows)
    {
        x = "<li class='news-item'><a href='../NewsDetails.aspx?ID=" + row["ID"] + "' target='_blank'>" + row["TitleAr"] + "</a></li>";
        Response.Write(x);
    }
    
     %>
    </ul>


<%--<ul id="js-news" class="js-hidden">
    <li class="news-item"><a href="#">This is the 1st latest news item.</a></li>
    <li class="news-item"><a href="#">This is the 2nd latest news item.</a></li>
    <li class="news-item"><a href="#">This is the 3rd latest news item.</a></li>
    <li class="news-item"><a href="#">This is the 4th latest news item.</a></li>
</ul>--%>