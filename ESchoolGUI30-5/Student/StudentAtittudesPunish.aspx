<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="StudentAtittudesPunish.aspx.cs" Inherits="Student_StudentAtittudesPunish" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="../UserControls/StudentAtittudes.ascx" tagname="StudentAtittudes" tagprefix="uc1" %>
<%@ Register src="../UserControls/StudentPunisment.ascx" tagname="StudentPunisment" tagprefix="uc2" %>

<%@ Register src="../UserControls/emgPerviousPage.ascx" tagname="emgPerviousPage" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <uc3:emgPerviousPage ID ="prev" runat="server" FirstSession="STID" IndexUrl="Default.aspx" />
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
        Height="272px" Width="643px" style="direction: rtl">
        <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
        <HeaderTemplate>
سلوكيات الطالب
</HeaderTemplate>
            

<ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <uc1:StudentAtittudes ID="StudentAtittudes1" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            
            
</ContentTemplate>
        

</cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
        <HeaderTemplate>
عقوبات الطالب
</HeaderTemplate>
            

<ContentTemplate>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                        <uc2:StudentPunisment ID="StudentPunisment1" runat="server" />
                    
</ContentTemplate>
</asp:UpdatePanel>

            

            
</ContentTemplate>
        

</cc1:TabPanel>
    </cc1:TabContainer>
</asp:Content>

