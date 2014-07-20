<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<%@ Register src="UserControls/InfoBar.ascx" tagname="InfoBar" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=windows-1256" />
<title>&#1575;&#1604;&#1605;&#1583;&#1585;&#1587;&#1577; &#1575;&#1604;&#1575;&#1604;&#1603;&#1578;&#1585;&#1608;&#1606;&#1610;&#1577;</title>
<style type="text/css">
<!--
body {
	background-color: #EAEAEA;
	background-image: url(images/background.gif);
	background-repeat: repeat;
}
-->
</style>
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
a:link {
	color: #FFFFFF;
	font-weight: bold;
	text-decoration: none;
}
a:visited {
	color: #FFFFFF;
	text-decoration: none;
}
a:hover {
	color: #FFFFFF;
	text-decoration: none;
}
a:active {
	color: #FFFFFF;
	text-decoration: none;
}
-->
</style>
<link href="css/head.css" rel="stylesheet" type="text/css" />
<link href="css/text_header.css" rel="stylesheet" type="text/css" />
<link href="css/bottom.css" rel="stylesheet" type="text/css" />
<link href="css/text_home.css" rel="stylesheet" type="text/css" />
<link href="css/bg.css" rel="stylesheet" type="text/css" />


<style type="text/css">
    <!--
#Layer1 {
	position:absolute;
	width:236px;
	height:125px;
	z-index:1;
	left: 835px;
	top: 363px;
}
#Layer2 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
}
-->
</style>
</head>
<body>
    <form id="form1" runat="server">
 

    

<table width="896" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="281" colspan="2" valign="top"><img src="images/logo.png" width="281" height="281" align="middle" /></td>
  <td colspan="5" rowspan="2" valign="top"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="615" height="285">
        <param name="movie" value="load_h.swf" />
        <param name="quality" value="high" />
		<param name="wmode" value="transparent" />
        <embed src="load_h.swf" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="615" height="285"></embed>
    </object></td>
  </tr>
  <tr>
    <td width="261" height="4"></td>
    <td width="20"></td>
  </tr>
  <tr>
    <td height="54" colspan="7" valign="top"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="896" height="54">
        <param name="movie" value="load_b.swf" />
        <param name="quality" value="high" />
      <param name="wmode" value="transparent" />
        <embed src="load_b.swf" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="896" height="54"></embed>
    </object></td>
  </tr>
  <tr>
    <td height="10"></td>
    <td></td>
    <td width="201"></td>
    <td width="149"></td>
    <td width="9"></td>
    <td width="10"></td>
    <td width="247"></td>
  </tr>
  <tr>
    <td height="13" colspan="5" valign="top"><img src="images/header_tool.png" width="640" height="13" /></td>
    <td></td>
    <td rowspan="2" valign="top" background="images/00.png">
	<div id="ddvvvv">
      
      <div id="Layer2">
	          <div id="plcholddiv" 
            style=" left:668px; top:413px; width:247px; height:100px; overflow:hidden;"></div></div>
		</div>
    <script type="text/javascript">
        var titlea = new Array();
        var texta = new Array();
        var linka = new Array();
        var trgfrma = new Array();
        var heightarr = new Array();
        var cyposarr = new Array();
        cyposarr[0] = 0;
        cyposarr[1] = 1;
        cyposarr[2] = 2;
        var t = "<% =GetInfos()%>";
        texta = "<% =InfoString%>".split("@.@");
        titlea = "<% =InfoTitleString%>".split("@.@");
        linka = "<% =InfoLinksString%>".split("@.@");
        trgfrma = "<% =InfoTargetString%>".split("@.@");

        var mc2 = "<% = infocount %>";

        uagent2 = window.navigator.userAgent.toLowerCase(); IEB2 = (uagent2.indexOf('msie2') != -1) ? true : false;
        var scompat2 = document.compatMode;
        var inoout = false;
        var tmpv;
        tmpv = 255 - 8 - 8 - 2 * parseInt(2);
        var cvar = 0, say = 0, tpos = 0, enson = 0, hidsay = 0, hidson = 0;
        var psy = new Array();
        var tttttt = new Array();
        var llllll3 = null;
var textzie=247;
        var llllll2 = null;
        var lllllllj = 0;
        var llllllll22 = 0;
   divtextb = "<div id=\"d2"; divtev1 = " onmouseover=\"ll2("; divtev2 = ")\" onmouseout =\"lll2("; divtev3 = ")\" "; divtev4 = ""; divtexts = " style=\"position:absolute;visibility:hidden;width:" + tmpv + "px; COLOR:" + "#000000" + "; left:0px; top:0px; FONT-FAMILY:" + "MS Sans Serif,arial,helvetica" + "; FONT-SIZE:" + 8 + "pt; FONT-STYLE:" + "normal" + "; FONT-WEIGHT:" + "normal" + "; margin-right:5px;margin-left:5px; LINE-HEIGHT:" + 12 + "pt; text-align:" + "center" + ";overflow-x:hidden;padding-left:0px;padding-right:5px; cursor:default;\">";
        ie6span = " style=\"position:relative; COLOR:" + "#333399" + "; width:" + tmpv + "px; FONT-FAMILY:" + "verdana,arial,helvetica" + "; FONT-SIZE:" + 9 + "pt; FONT-STYLE:" + "normal" + "; FONT-WEIGHT:" + "bold" + "; TEXT-DECORATION:" + "none" + "; LINE-HEIGHT:" + 14 + "pt; text-align:" + "center" + ";padding:0px;\"";
        uzun = "<div id=\"enuzun\" style=\"position:absolute;left:100px;top:200px;\">";
        uzun2 = "<div id=\"enuzun2\" style=\"position:absolute;left:100px;top:200px;\">";
        divtextb2 = "<div id=\"dz";
        function ll2(gumh, gumh5) {
            inoout = true; if ((linka[gumh].length) > 2) {
                var objd = null;
                var objd2 = null;
                var objd3 = null; if (gumh5 == 1) {
                    objd = document.getElementById("dz" + gumh);
                    objd2 = document.getElementById("hgdz" + gumh);
                    objd3 = document.getElementById("tzid" + gumh);
                }
                else {
                    objd = document.getElementById("d2" + gumh); objd2 = document.getElementById("hgd" + gumh);
                    objd3 = document.getElementById("tid" + gumh);
                } objd.style.color = "#AA0000"; objd2.style.color = "#BB0000";
                objd.style.cursor = 'pointer'; objd2.style.cursor = 'pointer'; objd3.style.textDecoration = "none";
                objd2.style.textDecoration = "none";
            }
            else { window.status = ""; } 
        }

        function lll2(gumh2, gumh5) {
            inoout = false;
            var objd = null;
            var objd2 = null;
            var objd3 = null;
            if (gumh5 == 1) {
                objd = document.getElementById("dz" + gumh2); objd2 = document.getElementById("hgdz" + gumh2);
                objd3 = document.getElementById("tzid" + gumh2);
            } else {
                objd = document.getElementById("d2" + gumh2);
                objd2 = document.getElementById("hgd" + gumh2); objd3 = document.getElementById("tid" + gumh2);
            }
            objd.style.color = "#000000"; objd2.style.color = "#333399"; objd3.style.textDecoration = "none";
            objd2.style.textDecoration = "none"; window.status = "";
        }
        function butclick2(gumh3) { }
        function lllll() {
            if (0 == 0) {
                if (inoout == false) {
                    lllllllj--; if (lllllllj < (-1 * llllllll22)) { lllllllj = 215; }
                    llllll3.style.top = "" + lllllllj + "px";
                }
                if (psy[(lllllllj * (-1)) + 4] == 3) { setTimeout('lllll()', 3000 + 35); }
                else { setTimeout('lllll()', 35); } 
            } else if (0 == 1) {
                if (inoout == false) {
                    dahayok = false; lllllllj--; for (i = 0; i < mc2; i++) {
                        tttttt[i].style.top = "" + (lllllllj + (i * 215)) + "px"; if ((lllllllj + (i * 100)) == 4)
                        { dahayok = true; } 
                    } if (lllllllj < (-1 * (mc2 - 1) * 100)) {
                        tttttt[0].style.top = "" + (lllllllj + (mc2 * 100)) + "px"; if ((lllllllj + (i * 100)) == 4)
                        { dahayok = true; } 
                    } if (lllllllj < (-1 * (mc2) * 100)) { lllllllj = 0; } 
                } if (dahayok == true) { setTimeout('lllll()', 4000); }
                else { setTimeout('lllll()', 35); } 
            } else if (0 == 2) {
                if (inoout == false) {
                    lllllllj--; if (lllllllj < (-1 * llllllll22))
                    { lllllllj = 0; llllll2.style.top = "" + 100 + "px"; } llllll3.style.top = "" + lllllllj + "px";
                    if ((lllllllj + llllllll22) < 100) { llllll2.style.top = "" + (lllllllj + llllllll22) + "px"; } 
                }
                if (psy[(lllllllj * (-1)) + 4] == 3) { setTimeout('lllll()', 3000 + 35); } else { setTimeout('lllll()', 35); } 
            } 
        }
        function lllllllll2() {
            for (i = 0; i < mc2; i++) {
                tttttt[i] = document.getElementById("d2" + i); if (!tttttt[i])
                { setTimeout('lllllllll2()', 200); return; } 
            } if (0 == 0) {
                i = 0; for (i = 0; i < mc2; i++)
                { heightarr[i] = parseInt(tttttt[i].offsetHeight); } llllllll22 = 4;
                for (i = 0; i < mc2; i++) {
                    tttttt[i].style.visibility = "visible"; tttttt[i].style.top = "" + llllllll22 + "px";
                    psy[llllllll22] = 3; llllllll22 = llllllll22 + heightarr[i] + 10;
                }
                llllll3 = document.getElementById('enuzun');
                llllll3.style.left = 8 + "px"; llllll3.style.height = llllllll22 + "px"; llllll3.style.width = tmpv + "px";
            }
            else if (0 == 1) { llllllll22 = 4; for (i = 0; i < mc2; i++) { tttttt[i].style.visibility = "visible"; tttttt[i].style.top = "" + (llllllll22 + (100 * i)) + "px"; tttttt[i].style.left = "" + 8 + "px"; } } else if (0 == 2) {
                i = 0; for (i = 0; i < mc2; i++) { heightarr[i] = parseInt(tttttt[i].offsetHeight); } llllllll22 = 4; for (i = 0; i < mc2; i++) { objd2 = document.getElementById("dz" + i); tttttt[i].style.visibility = "visible"; objd2.style.visibility = "visible"; tttttt[i].style.top = "" + llllllll22 + "px"; objd2.style.top = "" + llllllll22 + "px"; psy[llllllll22] = 3; llllllll22 = llllllll22 + heightarr[i] + 10; }
                llllll3 = document.getElementById('enuzun');
                llllll3.style.left = 8 + "px"; llllll3.style.height = llllllll22 + "px"; llllll3.style.width = tmpv + "px"; llllll3.style.top = 247 + "px"; llllll2 = document.getElementById('enuzun2'); llllll2.style.left = 8 + "px"; llllll2.style.height = llllllll22 + "px"; llllll2.style.width = tmpv + "px"; llllll2.style.top = 100 + "px";
            } lllllllj = 247; lllll();
        } function lllllllll() { i = 0; if (0 == 1) { innertxt = ""; } else { innertxt = "" + uzun; } for (i = 0; i < mc2; i++) { innertxt = innertxt + "" + divtextb + "" + i + "\"" + divtev1 + i + ",0" + divtev2 + i + ",0" + divtev3 + i + divtev4 + divtexts + "<span id=\"hgd" + i + "\"" + ie6span + ">" + titlea[i] + "</span><br>" + "<span id=\"tid" + i + "\" style=\"margin-left:5px;margin-right:5px;TEXT-DECORATION:" + "none" + ";text-align:" + "center" + ";\">" + texta[i] + "</span>" + "</div>"; } if (0 == 1) { } else { innertxt = innertxt + "</div>"; } if (0 == 2) { innertxt = "" + innertxt + uzun2; for (i = 0; i < mc2; i++) { innertxt = innertxt + "" + divtextb2 + "" + i + "\"" + divtev1 + i + ",1" + divtev2 + i + ",1" + divtev3 + i + divtev4 + divtexts + "<span id=\"hgdz" + i + "\"" + ie6span + ">" + titlea[i] + "</span><br>" + "<span id=\"tzid" + i + "\" style=\"margin-left:5px;margin-right:5px;TEXT-DECORATION:" + "none" + ";text-align:" + "center" + ";\">" + texta[i] + "</span>" + "</div>"; } innertxt = innertxt + "</div>"; } if (IEB2 == true) { spage2 = document.getElementById('spageie'); } else { spage2 = document.getElementById("spagens"); } spage2.innerHTML = "" + innertxt; setTimeout('lllllllll2()', 100); } function BuildHtmlCont() { PlcHoldDiv = document.getElementById("plcholddiv"); if (!PlcHoldDiv) { setTimeout('BuildHtmlCont()', 100); return; } var intext = ""; intext = "<div id=\"disspageie\" style=\"width:" + 247 + "px; height:" + 150 + "px;left:0px; top:0px;margin:0px;overflow:hidden;padding:0px; background-image: url(" + "" + "); background-repeat :no-repeat;background-position:" + "0" + "px " + "0" + "px;\"><div id=\"spageie\" style=\"position:absolute;width:" + 100 + "px; height:" + 150 + "px; left:0px; top:0px; overflow:hidden;clip:rect(" + "4 255 210 0" + ");\"></div></div>"; if (IEB2 != true) { intext = intext + "<div id=\"spagensbrd\" style=\"position:absolute; width:" + 260 + "px; height:" + (150 - 2 * 1) + "px; left:0px; top:0px;5px;margin-right:4px; overflow:hidden;\"><div id=\"spagens\" style=\"position:absolute; width:" +260 + "; height:" + (150 - 2 * 1) + "; left:0;margin-right:4px; top:0; border-width:0px; overflow:hidden;clip:rect(" + "4 255 210 0" + ");\"></div></div>"; } PlcHoldDiv.innerHTML = "" + intext; setTimeout('lllllllll()', 100); } setTimeout('BuildHtmlCont()', 100);
</script>
    </td>
  </tr>
  <tr>
    <td colspan="5" rowspan="6" valign="top" bgcolor="#E9E9E9" class="bg"><div class="text_home">
      <p dir="rtl">المدرسة الإلكترونية هي قاعدة بيانات تفصيلية تضم جميع الأعمال الإدارية في المدرسة لميكنة وتحويل النظام اليدوي إلى النظام الآلي واستخراج إحصائيات تجميعية لخدمة متخذ القرار وتطبيق المعايير القومية على المدارس لتأهيلها للحصول على شهادة الاعتماد والجودة, وتهدف المدرسة الالكترونية إلى ربط الأعمال الإدارية بالمدرسة بشبكة واحدة لتوحيد البيانات التي تتعامل معها المدرسة للحصول على مصدر وحيد للبيانات منعا لتضارب البيانات وخدمة متخذي القرار عن طريق إمدادهم بالمعلومات والبيانات اللازمة لاتخاذ قرار سليم على أسس موضوعية، والتمكن من حصول إدارة المدرسة والإدارة التعليمية والمديرية والوزارة على تقارير سريعة ودقيقة للوقوف على حالة النظام التعليمي بصفة مستمرة ومحدثة دوريا، توفير الوقت والجهد والمال وخفض تكاليف التشغيل الحالي مع الإقلال من العمل المكتبي، السرعة والدقة والمصداقية في ظهور نتائج الامتحانات النهائية، تعزيز المصداقية في البيانات بالنسبة لأولياء الأمور وذلك من خلال سرعة ودقة الحصول على النتيجة ومعرفة النتيجة ونشرها عن طريق الانترنت وشبكة المعلومات داخل المدرسة، الحصول على أفضل خدمة للمدرس والموظف والطالب وفى أسرع وقت ممكن وذلك عن طريق إدخال جميع البيانات التي يحتاجها جميع الأفراد المشاركين في العملية التعليمية.جها جميع الأفراد المشاركين في العملية التعليمية.</p>
    </div>    </td>
    <td height="137"></td>
  </tr>
  
  

  
  <tr>
    <td height="7"></td>
    <td></td>
  </tr>
  <tr>
    <td height="150"></td>
    <td valign="top"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="247" height="150">
      <param name="movie" value="load_adver_2.swf" />
      <param name="quality" value="high" />
	  <param name="wmode" value="transparent" />
      <embed src="load_adver_2.swf" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="247" height="150"></embed>
    </object></td>
  </tr>
  
  
  
  <tr>
    <td height="6"></td>
    <td></td>
  </tr>
  <tr>
    <td height="150"></td>
    <td valign="top"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="247" height="150">
      <param name="movie" value="load_adver_3.swf" />
      <param name="quality" value="high" />
      <param name="wmode" value="transparent" />
      <embed src="load_adver_3.swf" wmode="transparent" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="247" height="150"></embed>
    </object></td>
  </tr>
  <tr>
    <td height="12"></td>
    <td></td>
  </tr>
  
  
  
  
  
  
  
  <tr>
    <td height="17" colspan="5" valign="top"><img src="images/footer_tool.png" width="640" height="13" /></td>
    <td></td>
    <td></td>
  </tr>
  
  
  
  <tr>
    <td height="34" valign="top" class="footer">copyright <a href="http://www.e-e-soft.com">e-e-soft.com </a></td>
  <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td valign="top"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="149" height="23">
        <param name="movie" value="counter.swf" />
        <param name="quality" value="high" />
        
        <embed src="counter.swf" width="149" height="23" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed>
                                </object></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
    
   </form>
</body>