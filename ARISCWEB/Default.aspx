<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Charting" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <telerik:AccessibleRadEditor ID="AccessibleRadEditor1" runat="server">
        </telerik:AccessibleRadEditor>
        <telerik:GridAttachmentColumnEditor ID="GridAttachmentColumnEditor1" runat="server" />
        <telerik:GridBinaryImageColumnEditor ID="GridBinaryImageColumnEditor1" runat="server" />
        <telerik:GridLinqDataSource ID="GridLinqDataSource1" runat="server">
        </telerik:GridLinqDataSource>
        <telerik:InputSettingCustomValidator ID="InputSettingCustomValidator1" runat="server">
        </telerik:InputSettingCustomValidator>
        <telerik:MonthYearView ID="MonthYearView1" runat="server">
        </telerik:MonthYearView>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" Runat="server" Skin="Default">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
        </telerik:RadAjaxManagerProxy>
        <telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server">
        </telerik:RadAsyncUpload>
        <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" />
        <telerik:RadButton ID="RadButton1" runat="server" Text="RadButton">
        </telerik:RadButton>
        <telerik:RadCalendar ID="RadCalendar1" Runat="server">
        </telerik:RadCalendar>
        <telerik:RadCaptcha ID="RadCaptcha1" Runat="server">
        </telerik:RadCaptcha>
        <telerik:RadChart ID="RadChart1" runat="server">
        </telerik:RadChart>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        </telerik:RadCodeBlock>
        <telerik:RadColorPicker ID="RadColorPicker1" Runat="server">
        </telerik:RadColorPicker>
        <telerik:RadComboBox ID="RadComboBox1" Runat="server">
        </telerik:RadComboBox>
        <telerik:RadContextMenu ID="RadContextMenu1" Runat="server">
        </telerik:RadContextMenu>
        <telerik:RadDataPager ID="RadDataPager1" runat="server">
        </telerik:RadDataPager>
        <telerik:RadDataPagerFieldItem ID="RadDataPagerFieldItem1" runat="server">
        </telerik:RadDataPagerFieldItem>
        <telerik:RadDateInput ID="RadDateInput1" Runat="server">
        </telerik:RadDateInput>
        <telerik:RadDatePicker ID="RadDatePicker1" Runat="server">
        </telerik:RadDatePicker>
    </form>
</body>
</html>
