<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="StudentActiveties.aspx.cs" Inherits="Student_StudentActiveties" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="../UserControls/StudentTalents.ascx" tagname="StudentTalents" tagprefix="uc1" %>
<%@ Register src="../UserControls/StudSportActivities.ascx" tagname="StudSportActivities" tagprefix="uc2" %>

<%@ Register src="../UserControls/StudentActivities.ascx" tagname="StudentActivities" tagprefix="uc3" %>

<%@ Register src="../UserControls/emgPerviousPage.ascx" tagname="emgPerviousPage" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <uc4:emgPerviousPage ID ="prev" runat="server" FirstSession="STID" IndexUrl="Default.aspx" />
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
        Height="270px" Width="600px" style="direction: rtl">
        <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
        <HeaderTemplate>
المواهب
</HeaderTemplate>
        


<ContentTemplate>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <uc1:StudentTalents ID="StudentTalents1" runat="server" />
    
</ContentTemplate>
</asp:UpdatePanel>

</ContentTemplate>



</cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
        <HeaderTemplate>
النشاطات
</HeaderTemplate>
        


<ContentTemplate>
<asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
        <uc3:StudentActivities ID="StudentActivities1" runat="server" />
    
</ContentTemplate>
</asp:UpdatePanel>


</ContentTemplate>


</cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
        <HeaderTemplate>
النشاطات الرياضية
</HeaderTemplate>
        


<ContentTemplate>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <uc2:StudSportActivities ID="StudSportActivities1" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
</ContentTemplate>



</cc1:TabPanel>
    </cc1:TabContainer>
</asp:Content>

