<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SliderUserControl.ascx.cs" Inherits="SliderUserControl" %>

<link rel="stylesheet" href="Styles/themes/light/light.css" type="text/css" media="screen" />
<link href="Styles/themes/default/default.css" rel="stylesheet" />
<%--<link href="/Styles/themes/dark/dark.css" rel="stylesheet" />
<link href="/Styles/themes/light/light.css" rel="stylesheet" />
<link href="/Styles/themes/bar/bar.css" rel="stylesheet" />--%>
<link rel="stylesheet" href="Styles/nivo-slider.css" type="text/css" media="screen" />
<script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript" src="Scripts/jquery.nivo.slider.js"></script>
<script type="text/javascript" src="Scripts/jquery.nivo.slider.pack.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $('#slider').nivoSlider();
            });
</script>
<div id="wrapper" >
<div class="slider-wrapper theme-light">
<div id="slider" class="nivoSlider">

 <%
    
 
    ThumbnailSliderWebApplication_SliderClass slider = new ThumbnailSliderWebApplication_SliderClass();
    System.Data.DataTable dt = slider.GetSlidersData() ;
    string x;
    foreach (System.Data.DataRow row in dt.Rows)
    {
        x = "<a href='ViewDetails.aspx?id=" + row["ID"] + "' target='_blank'><img src='../" + row["ImageLink"] + "' data-thumb='" + row["ImageLink"] + "' alt='" + row["Caption"] + "' title='" + row["Caption"] + "' /></a>";
        Response.Write(x);
    }
    
     %>
    </div>
    </div>
    </div>
<%--<div id="slider" class="nivoSlider"> 
<img src="/images/slider/20141025142217.jpg" data-thumb="images/slider/20141025142217.jpg" alt="" width=""/> 
<img src="/images/slider/20141025142218.jpg" data-thumb="images/slider/20141025142218.jpg" alt="" title="This is an example of a caption" />
<img src="images/walle.jpg" data-thumb="images/walle.jpg" alt="" data-transition="slideInLeft" /> 
<img src="images/nemo.jpg" data-thumb="images/nemo.jpg" alt="" title="#htmlcaption" /> 
</div>--%>

<%----%>