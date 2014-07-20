<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InfoBar.ascx.cs" Inherits="UserControls_InfoBar" %>
    <div id="plcholddiv" style="position:absolute; left:300px; top:36px; width:237px; height:256px; overflow:hidden;"></div>
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

        var mc2 = 3;

        uagent2 = window.navigator.userAgent.toLowerCase(); IEB2 = (uagent2.indexOf('msie2') != -1) ? true : false;
        var scompat2 = document.compatMode;
        var inoout = false;
        var tmpv;
        tmpv = 240 - 8 - 8 - 2 * parseInt(1);
        var cvar = 0, say = 0, tpos = 0, enson = 0, hidsay = 0, hidson = 0;
        var psy = new Array();
        var tttttt = new Array();
        var llllll3 = null;

        var llllll2 = null;
        var lllllllj = 0;
        var llllllll22 = 0;
        divtextb = "<div id=\"d2"; divtev1 = " onmouseover=\"ll2("; divtev2 = ")\" onmouseout =\"lll2("; divtev3 = ")\" "; divtev4 = ""; divtexts = " style=\"position:absolute;visibility:hidden;width:" + tmpv + "px; COLOR:" + "#000000" + "; left:0px; top:0px; FONT-FAMILY:" + "MS Sans Serif,arial,helvetica" + "; FONT-SIZE:" + 8 + "pt; FONT-STYLE:" + "normal" + "; FONT-WEIGHT:" + "normal" + "; margin:0px; LINE-HEIGHT:" + 12 + "pt; text-align:" + "center" + ";overflow-x:hidden;padding:0px; cursor:default;\">";
        ie6span = " style=\"position:relative; COLOR:" + "#333399" + "; width:" + tmpv + "px; FONT-FAMILY:" + "verdana,arial,helvetica" + "; FONT-SIZE:" + 9 + "pt; FONT-STYLE:" + "normal" + "; FONT-WEIGHT:" + "bold" + "; TEXT-DECORATION:" + "none" + "; LINE-HEIGHT:" + 14 + "pt; text-align:" + "center" + ";padding:0px;\"";
        uzun = "<div id=\"enuzun\" style=\"position:absolute;left:300px;top:200px;\">";
        uzun2 = "<div id=\"enuzun2\" style=\"position:absolute;left:300px;top:200px;\">";
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
                        tttttt[i].style.top = "" + (lllllllj + (i * 215)) + "px"; if ((lllllllj + (i * 215)) == 4)
                        { dahayok = true; } 
                    } if (lllllllj < (-1 * (mc2 - 1) * 215)) {
                        tttttt[0].style.top = "" + (lllllllj + (mc2 * 215)) + "px"; if ((lllllllj + (i * 215)) == 4)
                        { dahayok = true; } 
                    } if (lllllllj < (-1 * (mc2) * 215)) { lllllllj = 0; } 
                } if (dahayok == true) { setTimeout('lllll()', 4000); }
                else { setTimeout('lllll()', 35); } 
            } else if (0 == 2) {
                if (inoout == false) {
                    lllllllj--; if (lllllllj < (-1 * llllllll22))
                    { lllllllj = 0; llllll2.style.top = "" + 215 + "px"; } llllll3.style.top = "" + lllllllj + "px";
                    if ((lllllllj + llllllll22) < 215) { llllll2.style.top = "" + (lllllllj + llllllll22) + "px"; } 
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
            else if (0 == 1) { llllllll22 = 4; for (i = 0; i < mc2; i++) { tttttt[i].style.visibility = "visible"; tttttt[i].style.top = "" + (llllllll22 + (215 * i)) + "px"; tttttt[i].style.left = "" + 8 + "px"; } } else if (0 == 2) {
                i = 0; for (i = 0; i < mc2; i++) { heightarr[i] = parseInt(tttttt[i].offsetHeight); } llllllll22 = 4; for (i = 0; i < mc2; i++) { objd2 = document.getElementById("dz" + i); tttttt[i].style.visibility = "visible"; objd2.style.visibility = "visible"; tttttt[i].style.top = "" + llllllll22 + "px"; objd2.style.top = "" + llllllll22 + "px"; psy[llllllll22] = 3; llllllll22 = llllllll22 + heightarr[i] + 10; }
                llllll3 = document.getElementById('enuzun');
                llllll3.style.left = 8 + "px"; llllll3.style.height = llllllll22 + "px"; llllll3.style.width = tmpv + "px"; llllll3.style.top = 215 + "px"; llllll2 = document.getElementById('enuzun2'); llllll2.style.left = 8 + "px"; llllll2.style.height = llllllll22 + "px"; llllll2.style.width = tmpv + "px"; llllll2.style.top = 215 + "px";
            } lllllllj = 215; lllll();
        } function lllllllll() { i = 0; if (0 == 1) { innertxt = ""; } else { innertxt = "" + uzun; } for (i = 0; i < mc2; i++) { innertxt = innertxt + "" + divtextb + "" + i + "\"" + divtev1 + i + ",0" + divtev2 + i + ",0" + divtev3 + i + divtev4 + divtexts + "<span id=\"hgd" + i + "\"" + ie6span + ">" + titlea[i] + "</span><br>" + "<span id=\"tid" + i + "\" style=\"TEXT-DECORATION:" + "none" + ";\">" + texta[i] + "</span>" + "</div>"; } if (0 == 1) { } else { innertxt = innertxt + "</div>"; } if (0 == 2) { innertxt = "" + innertxt + uzun2; for (i = 0; i < mc2; i++) { innertxt = innertxt + "" + divtextb2 + "" + i + "\"" + divtev1 + i + ",1" + divtev2 + i + ",1" + divtev3 + i + divtev4 + divtexts + "<span id=\"hgdz" + i + "\"" + ie6span + ">" + titlea[i] + "</span><br>" + "<span id=\"tzid" + i + "\" style=\"TEXT-DECORATION:" + "none" + ";\">" + texta[i] + "</span>" + "</div>"; } innertxt = innertxt + "</div>"; } if (IEB2 == true) { spage2 = document.getElementById('spageie'); } else { spage2 = document.getElementById("spagens"); } spage2.innerHTML = "" + innertxt; setTimeout('lllllllll2()', 100); } function BuildHtmlCont() { PlcHoldDiv = document.getElementById("plcholddiv"); if (!PlcHoldDiv) { setTimeout('BuildHtmlCont()', 100); return; } var intext = ""; intext = "<div id=\"disspageie\" style=\"width:" + 240 + "px; height:" + 150 + "px;left:0px; top:0px;margin:0px;overflow:hidden;padding:0px; background-image: url(" + "" + "); background-repeat :no-repeat;background-position:" + "0" + "px " + "0" + "px;\"><div id=\"spageie\" style=\"position:absolute;width:" + 240 + "px; height:" + 150 + "px; left:0px; top:0px; overflow:hidden;clip:rect(" + "4 180 210 0" + ");\"></div></div>"; if (IEB2 != true) { intext = intext + "<div id=\"spagensbrd\" style=\"position:absolute; width:" + (240 - 2 * 1) + "px; height:" + (150 - 2 * 1) + "px; left:0px; top:0px; overflow:hidden;\"><div id=\"spagens\" style=\"position:absolute; width:" + (240 - 2 * 1) + "; height:" + (150 - 2 * 1) + "; left:0; top:0; border-width:0px; overflow:hidden;clip:rect(" + "4 180 210 0" + ");\"></div></div>"; } PlcHoldDiv.innerHTML = "" + intext; setTimeout('lllllllll()', 100); } setTimeout('BuildHtmlCont()', 100);
</script>