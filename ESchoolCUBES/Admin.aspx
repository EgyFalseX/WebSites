<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>صفحة المديـــــــر</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 758px;
        }
.RadPanelBar_Default
{
	background: #5c5c5c url('mvwres://Telerik.Web.UI, Version=2008.1.415.35, Culture=neutral, PublicKeyToken=5798b630e02d74fc/Telerik.Web.UI.Skins.Default.PanelBar.background.gif') repeat-x bottom center;
}

.RadPanelBar
{
	width:250px;
}

.RadPanelBar_Default ul.rpRootGroup
{
	border: 1px solid #262626;
	padding: 20px 36px 28px 28px;
}

.RadPanelBar .rpRootGroup
{
	margin:0;
	padding:0;
	list-style-image: none;
	list-style-position:outside;
	list-style:none;
}

.RadPanelBar .rpItem
{
	float:none;
	display:block;
	position:static;
}

.RadPanelBar .rpItem
{
	margin:0;
	padding:0;
	list-style-image: none;
	list-style-position:outside;
	list-style:none;
}

.RadPanelBar_Default .rpLink
{
	border-bottom: 1px solid #bfbfbf;
}

.RadPanelBar .rpLink
{
	width:100%;
	outline:none; /* Remove this for FF to put dotted border around the focused item */

}

.RadPanelBar .rpLink
{
	text-decoration:none;
	display:block;
}

.RadPanelBar_Default .rpRootGroup .rpText
{
	font: normal 12px Arial, Verdana, Sans-serif;
	color: #fff;
	padding: 5px 7px 5px 3px;
}

.RadPanelBar_Default .rpText
{
	margin-right: 7px;
}

.RadPanelBar .rpText
{
	cursor:pointer;
	_cursor:hand;
}

.RadPanelBar .rpText
{
	text-decoration:none;
	display:block;
}

        .style2
        {
            width: 114px;
            text-align: right;
        }
        .stylesummary1
    {
        width:  auto;
    }
    .stylesummary2
    {
        width: auto;
    }
        </style>
</head>
<body style="direction: rtl">
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div>
    
        <table class="style1">
            <tr>
                <td class="style2" align="right" valign="top">
                    <telerik:RadPanelBar ID="RadPanelBarAdmin" Runat="server" Height="166px" 
                        Width="179px" Skin="Hay">
<CollapseAnimation Type="None" Duration="100"></CollapseAnimation>
                        <Items>
                            <telerik:RadPanelItem runat="server" Text="اضافة/حذف قسم"  NavigateUrl="Admin.aspx?id=1">
                            </telerik:RadPanelItem>
                            <telerik:RadPanelItem runat="server" Text="اضافة/حذف كتاب" 
                                NavigateUrl="Admin.aspx?id=2">
                            </telerik:RadPanelItem>
                            <telerik:RadPanelItem runat="server" Text="تعديل اسم المستخدم والباسويرد" 
                                NavigateUrl="Admin.aspx?id=3">
                            </telerik:RadPanelItem>
                            <telerik:RadPanelItem runat="server" Text="الإحصائيه" 
                                NavigateUrl="Admin.aspx?id=4">
                            </telerik:RadPanelItem>
                        </Items>
<ExpandAnimation Type="None" Duration="100"></ExpandAnimation>
                    </telerik:RadPanelBar>
                </td>
                <td align="right" valign="top">
                    &nbsp;<asp:Panel ID="PnlShowScreen" runat="server" Height="100px" Width="100px">
                    </asp:Panel>
&nbsp;&nbsp;
                    &nbsp;
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
