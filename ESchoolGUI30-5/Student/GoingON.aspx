<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeFile="GoingON.aspx.cs" Inherits="Student_GoingON" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="../UserControls/StudentGoingOn.ascx" tagname="StudentGoingOn" tagprefix="uc1" %>

<%@ Register src="../UserControls/StudentGoingONDetailsReplies.ascx" tagname="StudentGoingONDetailsReplies" tagprefix="uc2" %>

<%@ Register src="../UserControls/emgPerviousPage.ascx" tagname="emgPerviousPage" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   

    
   
    
    <uc3:emgPerviousPage ID ="prev" runat="server" FirstSession="STID" IndexUrl="Default.aspx" />
    
   

    
   
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:StudentGoingOn ID="StudentGoingOn1" runat="server" />
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/Bar1.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
     
            <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" >
                <asp:Panel ID="Panel2" runat="server" Style="border-right: gray 1px solid; border-top: gray 1px solid;
            border-left: gray 1px solid; cursor: move; color: black; border-bottom: gray 1px solid;
            background-color: #dddddd" Height="0px">
                </asp:Panel>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                  <uc2:StudentGoingONDetailsReplies ID="StudentGoingONDetailsReplies1" 
        runat="server" />
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
</asp:Content>

