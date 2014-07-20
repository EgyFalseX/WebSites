<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Category.ascx.cs" Inherits="userconrol_Category" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
<p>
    <asp:Button ID="Button1" runat="server" Text="Button" />
    <asp:Button ID="Button2" runat="server" Text="Button" />
    <asp:ImageButton ID="ImageButton1" runat="server" />
    <br />
</p>
<asp:LinkButton CssClass="lnkSubmit" ID="lnkButton" runat="server">SUBMIT</asp:LinkButton>


<br />
<telerik:RadTabStrip ID="RadTabStrip1" runat="server" Height="207px" 
    SelectedIndex="0">
    <Tabs>
        <telerik:RadTab runat="server" PageViewID="1" Selected="True" Text="Genral">
        </telerik:RadTab>
        <telerik:RadTab runat="server" PageViewID="2" Text="Data">
        </telerik:RadTab>
    </Tabs>
</telerik:RadTabStrip>
