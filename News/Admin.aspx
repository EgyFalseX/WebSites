<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Admin.aspx.cs" Inherits="_Default" %>
<%@ Register src="Code/Admin.ascx" tagname="Admin" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>شركه فروت باسكت انترناشونال</title>
<style type="text/css">
.style1 {
	border-width: 0;
}
.style2 {
	background-color: #FFFFFF;
}
.style3 {
	text-align: center;
}
.style4 {
	text-align: center;
	direction: ltr;
	background-color: #333300;
}
.style8 {
	color: #FFFFFF;
}
.style9 {
	text-decoration: none;
}
.style13 {
	font-size: 14pt;
}
a {
	color: #008000;
}
a:visited {
	color: #008080;
}
a:active {
	color: #FF9900;
}
a:hover {
	color: #FF9900;
}
</style>
<bgsound src="../sound/1.wav" loop="-1" />
<meta name="keywords" content="تصدير منتجات و خضروات فواكه مصريه البصل الاخضر الفراوله البرتقال البطاطس العنب الرمان اليمون الجزر الخيار الثوم" />
<meta name="description" content="تصدير منتجات و خضروات فواكه مصريه البصل الاخضر الفراوله البرتقال البطاطس العنب الرمان اليمون الجزر الخيار الثوم" />
</head>
<body style="margin: 0; background-color: #FF9900;">
<table style="width: 800px" align="center" cellspacing="0" cellpadding="0" class="style2">
	<tr>
		<td>
		<embed src="../../imeges/ar.swf" style="width: 800px; height: 252px" class="style1" /></td>
	</tr>
	<tr>
		<td style="height: 25px">
		<table style="width: 800px">
			<tr>
				<td class="style3" style="width: 126px"><strong>
				<a href="index.htm" class="style9">الرئيسية</a></strong></td>
				<td class="style3" style="width: 127px"><strong>
				<a href="product.htm" class="style9">منتجاتنا</a></strong></td>
				<td class="style3" style="width: 130px"><strong>
				<span lang="ar-eg"><a href="farm.htm" class="style9">مزارعنا</a></span></strong></td>
				<td class="style3" style="width: 185px"><strong>
				<a href="shipping.htm" class="style9">التعبئة والشحن</a></strong></td>
				<td style="width: 160px" class="style3"><strong>
				<a href="contact.htm" class="style9">الاتصال بنا</a></strong></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td ><br />
		<span lang="ar-eg" class="style13"><br />

        <div>
            <form id="form1" runat="server">
                <uc1:Admin ID="Admin1" runat="server" />
            </form>
        </div>

        </td>
	</tr>
	<tr>
		<td style="height: 25px" class="style4">
		<strong><span class="style8">© All Right Reserved by Fruit Basket 
		International company.<br />
		</span>
		<span lang="ar-eg" class="style8">
		<a href="../ru/index.htm" class="style9"><span class="style8">Русскй&nbsp;</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="style8"> 
        <a href="../en/index.htm" style="text-decoration: none">
        <font color="#FFFFFF">English</font></a></span></strong></td>
	</tr>
</table>

    
</body>
</html>
