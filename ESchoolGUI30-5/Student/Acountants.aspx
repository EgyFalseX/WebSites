<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="Acountants.aspx.cs" Inherits="Student_Acountants" %>

<%@ Register src="../UserControls/StudentAcountant.ascx" tagname="StudentAcountant" tagprefix="uc1" %>

<%@ Register src="../UserControls/emgPerviousPage.ascx" tagname="emgPerviousPage" tagprefix="uc2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="../UserControls/stPayments.ascx" tagname="stPayments" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc2:emgPerviousPage ID ="prev" runat="server" FirstSession="STID" IndexUrl="Default.aspx" />
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
        Height="362px" Width="756px">
        <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
        <HeaderTemplate>المصروفات</HeaderTemplate>
            <ContentTemplate>
              <uc1:StudentAcountant ID="StudentAcountant1" runat="server" />
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
        <HeaderTemplate>المتحصلات</HeaderTemplate>
            <ContentTemplate>
                <uc3:stPayments ID="stPayments1" runat="server" />
            </ContentTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>
</asp:Content>

