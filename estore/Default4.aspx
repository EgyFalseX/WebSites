<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register src="userconrol/CategoryCombo.ascx" tagname="CategoryCombo" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:LinkButton CssClass="lnkSubmit" ID="lnkButton" runat="server">SUBMIT</asp:LinkButton>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    </div>
    <telerik:RadPanelBar ID="RadPanelBar1" DataFieldID="ID" 
        DataFieldParentID="parentID" Runat="server" 
        DataSourceID="AccessDataSource1" Skin="Outlook">
<CollapseAnimation Type="None" Duration="100"></CollapseAnimation>

        <DataBindings>
            <telerik:RadPanelItemBinding Depth="0" TextField="category" ValueField="ID" />
            <telerik:RadPanelItemBinding Depth="1" TextField ="category" ValueField="ID" />
                        <telerik:RadPanelItemBinding Depth="2" TextField ="category" ValueField="ID" />
                        <telerik:RadPanelItemBinding Depth="3" TextField ="category" ValueField="ID" />
                        <telerik:RadPanelItemBinding Depth="4" TextField ="category" ValueField="ID" />
        </DataBindings>

<ExpandAnimation Type="None" Duration="100"></ExpandAnimation>
    </telerik:RadPanelBar>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <uc1:CategoryCombo ID="CategoryCombo1" runat="server" />
    <br />
    <br />
    <br />
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/DB.mdb" SelectCommand="SELECT * FROM [category]">
    </asp:AccessDataSource>
    </form>
</body>
</html>
