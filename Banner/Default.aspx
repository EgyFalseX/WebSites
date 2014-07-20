<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="UIControls" namespace="Sotirovic.Web.UI.UIControls.Banners" tagprefix="sotirovic" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
   
    <sotirovic:BannerRotator ID="BannerRotator1" runat="server" 
        DataSourceID="BannerDataSource" />
   
    <asp:AccessDataSource ID="BannerDataSource" runat="server" 
        DataFile="~/App_Data/Banner.mdb" SelectCommand="SELECT * FROM [BannerData]">
    </asp:AccessDataSource>
   
</asp:Content>
