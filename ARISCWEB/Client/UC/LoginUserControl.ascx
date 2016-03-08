<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginUserControl.ascx.cs" Inherits="LoginUserControl" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSiteMapControl" tagprefix="dx" %>
<style type="text/css">
    .style1
    {
        width: 100px;
        height: 115px;
    }
    .auto-style1 {
        width: 600px;
    }
</style>
<div align="center">
    <%--<asp:UpdatePanel ID="masterPageUpdatePanel" runat="server">
                    <ContentTemplate>--%>
                        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" Modal="True" ClientInstanceName="ASPxLoadingPanel1"
 Theme="Glass" EnableTheming="True">
                            <Image Url="~/App_Themes/PlasticBlue/Web/dvLoading.gif">
                            </Image>
                        </dx:ASPxLoadingPanel>
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="200px" ClientInstanceName="ASPxCallbackPanel1"
                            ClientVisible="False" ClientIDMode="AutoID" Theme="Glass" EnableTheming="True">
                              
                            <ClientSideEvents EndCallback="function(s, e) {
	ASPxLoadingPanel1.Hide();
}" />
<PanelCollection>
                                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>

                        &nbsp;<dx:ASPxRoundPanel ID="vehiclesASPxRoundPanel" 
        runat="server" Width="200px" BackColor="White" 
                                HeaderText="" Theme="Glass" EnableTheming="True" ShowHeader="False">
                                <HeaderStyle BackColor="#DEDEDE">
                                <BorderLeft BorderStyle="None" />
                                <BorderRight BorderStyle="None" />
                                <BorderBottom BorderStyle="None" />
                                </HeaderStyle>
                                <TopLeftCorner Height="5px" 
                                    Url="~/Images/ASPxRoundPanel/1058222236/TopLeftCorner.png" Width="5px">
                                </TopLeftCorner>
                                <NoHeaderTopLeftCorner Height="5px" 
                                    Url="~/Images/ASPxRoundPanel/1058222236/NoHeaderTopLeftCorner.png" Width="5px">
                                </NoHeaderTopLeftCorner>
                                <TopRightCorner Height="5px" 
                                    Url="~/Images/ASPxRoundPanel/1058222236/TopRightCorner.png" Width="5px">
                                </TopRightCorner>
                                <NoHeaderTopRightCorner Height="5px" 
                                    Url="~/Images/ASPxRoundPanel/1058222236/NoHeaderTopRightCorner.png" Width="5px">
                                </NoHeaderTopRightCorner>
                                <BottomRightCorner Height="5px" 
                                    Url="~/Images/ASPxRoundPanel/1058222236/BottomRightCorner.png" Width="5px">
                                </BottomRightCorner>
                                <BottomLeftCorner Height="5px" 
                                    Url="~/Images/ASPxRoundPanel/1058222236/BottomLeftCorner.png" Width="5px">
                                </BottomLeftCorner>
                                <HeaderLeftEdge>
                                    <BackgroundImage HorizontalPosition="left" 
                                        ImageUrl="~/Images/ASPxRoundPanel/1058222236/HeaderLeftEdge.png" 
                                        Repeat="NoRepeat" VerticalPosition="bottom" />
                                </HeaderLeftEdge>
                                <HeaderContent>
                                    <BackgroundImage HorizontalPosition="left" 
                                        ImageUrl="~/Images/ASPxRoundPanel/1058222236/HeaderContent.png" 
                                        Repeat="RepeatX" VerticalPosition="bottom" />
                                </HeaderContent>
                                <HeaderRightEdge>
                                    <BackgroundImage HorizontalPosition="right" 
                                        ImageUrl="~/Images/ASPxRoundPanel/1058222236/HeaderRightEdge.png" 
                                        Repeat="NoRepeat" VerticalPosition="bottom" />
                                </HeaderRightEdge>
                                <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">

                                                                    <table>
                <tr>
                        <td align="center">    

                            &nbsp;</td>
                    </tr>
 
                    <tr>
                    
                    <td align="center">
                    <dx:ASPxRoundPanel ID="signInASPxRoundPanel" runat="server" CssPostfix="DevEx" 
    GroupBoxCaptionOffsetY="-19px" 
    SpriteCssFilePath="~/App_Themes/DevEx/{0}/sprite.css" Width="200px" 
    Font-Bold="True" HeaderText="دخول المستخدم" EnableDefaultAppearance="False" 
        GroupBoxCaptionOffsetX="6px" Theme="Glass" EnableTheming="True">
    <ContentPaddings PaddingBottom="10px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="10px" />
                            <HeaderStyle>
                            <Paddings PaddingBottom="6px" PaddingLeft="7px" PaddingRight="11px" 
                                PaddingTop="1px" />
                            </HeaderStyle>
    <PanelCollection>
<dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
    <table width="300">
        <tr >
            <td >
                <dx:ASPxTextBox ID="userNameASPxTextBox" runat="server" ClientInstanceName="userNameASPxTextBox" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px">
                    <ClientSideEvents KeyDown="function(s, e) {
		if (e.htmlEvent.keyCode == 13)
		passwordASPxTextBox.Focus();
}" />
                    <ValidationSettings ErrorText="" SetFocusOnError="True" ValidationGroup="signInVG">
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text=": إسم المستخدم" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td >
                <dx:ASPxTextBox ID="passwordASPxTextBox" runat="server" ClientInstanceName="passwordASPxTextBox" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Password="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px">
                    <ClientSideEvents KeyDown="function(s, e) {
		if (e.htmlEvent.keyCode == 13)
              submitASPxButton.DoClick();
}" />
                    <ValidationSettings ErrorText="" SetFocusOnError="True" ValidationGroup="signInVG">
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=": كلمة المرور" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <dx:ASPxLabel ID="msgASPxLabel1" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Font-Bold="True" ForeColor="#CC0000">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="submitASPxButton" runat="server" ClientInstanceName="submitASPxButton" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" EnableTheming="True" Font-Bold="True" OnClick="vSubmitASPxButton_Click" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="دخول" Theme="PlasticBlue" ValidationGroup="signInVG">
                    <ClientSideEvents Click="function(s, e) {
	ASPxCallbackPanel1.PerformCallback();
	ASPxLoadingPanel1.Show();
}" />
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
                    </td>
                    </tr>
              </table>

                                    </dx:PanelContent>
</PanelCollection>
                                <Border BorderColor="#8B8B8B" BorderStyle="Solid" BorderWidth="1px" />
                            </dx:ASPxRoundPanel>



                        


    



                        


</div>


             
<%--
                    </ContentTemplate>
</asp:UpdatePanel>--%>
