<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="HomeWork.aspx.cs" Inherits="Student_HomeWork" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="../UserControls/StudentGeneralHomeWork.ascx" tagname="StudentGeneralHomeWork" tagprefix="uc1" %>

<%@ Register src="../UserControls/STudentHomeWorkDetails.ascx" tagname="STudentHomeWorkDetails" tagprefix="uc2" %>

<%@ Register src="../UserControls/emgPerviousPage.ascx" tagname="emgPerviousPage" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <uc3:emgPerviousPage ID ="prev" runat="server" FirstSession="STID" IndexUrl="Default.aspx" />
    <br />
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" 
        Height="374px" Width="834px" style="direction: rtl">
        <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
        
        <HeaderTemplate>
الواجب العام
</HeaderTemplate>
<ContentTemplate>
        
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <uc1:StudentGeneralHomeWork 
            ID="StudentGeneralHomeWork1" runat="server" />
            <asp:UpdateProgress ID="UpdateProgress3" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Bar1.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
        
       
        
       
</ContentTemplate>
</cc1:TabPanel>
        <cc1:TabPanel runat="server" HeaderText="TabPanel2" ID="TabPanel2">
        <HeaderTemplate>
الواجب الخاص
</HeaderTemplate>
        
<ContentTemplate>
           <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
            <uc1:StudentGeneralHomeWork ID="StudentGeneralHomeWork2"  SpecialHomeWork="true"
                runat="server" />
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Bar1.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        
</ContentTemplate>
</asp:UpdatePanel>

        
       
            <br />
            <br />
            <br />
            
            
            
            
</ContentTemplate>
</cc1:TabPanel>
    </cc1:TabContainer>
    <br />
    
              <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" >
                <asp:Panel ID="Panel2" runat="server" Style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; cursor: move; color: black; border-bottom: gray 1px solid;
            background-color: #dddddd" Height="0px">
                </asp:Panel>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
               <uc2:STudentHomeWorkDetails ID="STudentHomeWorkDetails1" runat="server" />
                    <br />
                        <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                    <ProgressTemplate>
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Bar1.gif" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="انهاء" />
                <br />
                <br />
                <br />

    </asp:Panel>
         <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
        <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" 
        BackgroundCssClass="modalBackground" CancelControlID="LinkButton1" 
        DropShadow="true"         PopupControlID="Panel1" 
        PopupDragHandleControlID="Panel2" RepositionMode="RepositionOnWindowResize" 
        TargetControlID="LinkButton1" Y="50" X="50">
    </cc1:ModalPopupExtender>
    <br />
</asp:Content>

