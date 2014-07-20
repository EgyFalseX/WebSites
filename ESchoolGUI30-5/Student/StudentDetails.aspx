<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="StudentDetails.aspx.cs" Inherits="Student_StudentDetails" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register src="../UserControls/PersonalDetails.ascx" tagname="PersonalDetails" tagprefix="uc1" %>

<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>

<%@ Register src="../UserControls/StudentResponsible.ascx" tagname="StudentResponsible" tagprefix="uc2" %>

<%@ Register src="../UserControls/StudentLists.ascx" tagname="StudentLists" tagprefix="uc3" %>

<%@ Register src="../UserControls/emgPerviousPage.ascx" tagname="emgPerviousPage" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <uc4:emgPerviousPage ID ="prev" runat="server" FirstSession="STID" IndexUrl="Default.aspx" />
<br />
        
        
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
        Height="326px" Width="752px" style="direction: rtl">
        <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
        <HeaderTemplate>
»Ì«‰«  «·ÿ«·»
</HeaderTemplate>
        
<ContentTemplate>
<br /><asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
<uc1:PersonalDetails 
                ID="PersonalDetails1" runat="server" />
</ContentTemplate>
</asp:UpdatePanel>
</ContentTemplate>
</cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
        <HeaderTemplate>
»Ì«‰«  Ê·Ì «·√„—
</HeaderTemplate>
        
<ContentTemplate><asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate><uc2:StudentResponsible 
        ID="StudentResponsible1" runat="server" /></ContentTemplate></asp:UpdatePanel></ContentTemplate></cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
        <HeaderTemplate>
‰Ÿ«„ «·ﬁÌœ
</HeaderTemplate>
        
            <ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <uc3:StudentLists ID="StudentLists1" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        
</cc1:TabPanel>
    </cc1:TabContainer>
        
        
</asp:Content>

