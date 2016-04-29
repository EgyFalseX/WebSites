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
</style>
<div align="center">
    <%--<asp:UpdatePanel ID="masterPageUpdatePanel" runat="server">
                    <ContentTemplate>--%>
                        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" Modal="True" ClientInstanceName="ASPxLoadingPanel1"
                            CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                            CssPostfix="PlasticBlue" Theme="RedWine">
                            <Image Url="~/App_Themes/PlasticBlue/Web/dvLoading.gif">
                            </Image>
                        </dx:ASPxLoadingPanel>
                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="200px" ClientInstanceName="ASPxCallbackPanel1"
                            ClientVisible="False" ClientIDMode="AutoID" Theme="RedWine">
                              
                            <ClientSideEvents EndCallback="function(s, e) {
	ASPxLoadingPanel1.Hide();
}" />
<PanelCollection>
                                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>

                        &nbsp;<dx:ASPxRoundPanel ID="vehiclesASPxRoundPanel" 
        runat="server" Width="200px" BackColor="#FFFFFF" 
                                HeaderText="" Theme="RedWine">
                                <HeaderStyle BackColor="#DEDEDE">
                                <BorderLeft BorderStyle="None" />
                                <BorderRight BorderStyle="None" />
                                <BorderBottom BorderStyle="None" />
                                </HeaderStyle>
                                <TopLeftCorner Height="4px" 
                                    Url="~/Images/ASPxRoundPanel/1531315390/TopLeftCorner.png" Width="4px">
                                </TopLeftCorner>
                                <NoHeaderTopLeftCorner Height="4px" 
                                    Url="~/Images/ASPxRoundPanel/1531315390/NoHeaderTopLeftCorner.png" Width="4px">
                                </NoHeaderTopLeftCorner>
                                <TopRightCorner Height="4px" 
                                    Url="~/Images/ASPxRoundPanel/1531315390/TopRightCorner.png" Width="4px">
                                </TopRightCorner>
                                <NoHeaderTopRightCorner Height="4px" 
                                    Url="~/Images/ASPxRoundPanel/1531315390/NoHeaderTopRightCorner.png" Width="4px">
                                </NoHeaderTopRightCorner>
                                <BottomRightCorner Height="4px" 
                                    Url="~/Images/ASPxRoundPanel/1531315390/BottomRightCorner.png" Width="4px">
                                </BottomRightCorner>
                                <BottomLeftCorner Height="4px" 
                                    Url="~/Images/ASPxRoundPanel/1531315390/BottomLeftCorner.png" Width="4px">
                                </BottomLeftCorner>
                                <HeaderLeftEdge>
                                    <BackgroundImage HorizontalPosition="left" 
                                        ImageUrl="~/Images/ASPxRoundPanel/1531315390/HeaderLeftEdge.png" 
                                        Repeat="NoRepeat" VerticalPosition="bottom" />
                                </HeaderLeftEdge>
                                <HeaderContent>
                                    <BackgroundImage HorizontalPosition="left" 
                                        ImageUrl="~/Images/ASPxRoundPanel/1531315390/HeaderContent.png" 
                                        Repeat="RepeatX" VerticalPosition="bottom" />
                                </HeaderContent>
                                <HeaderRightEdge>
                                    <BackgroundImage HorizontalPosition="right" 
                                        ImageUrl="~/Images/ASPxRoundPanel/1531315390/HeaderRightEdge.png" 
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
                    <dx:ASPxRoundPanel ID="signInASPxRoundPanel0" runat="server" 
    CssFilePath="~/App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
    GroupBoxCaptionOffsetY="-19px" 
    SpriteCssFilePath="~/App_Themes/DevEx/{0}/sprite.css" Width="200px" 
    Font-Bold="True" HeaderText="Sign In" EnableDefaultAppearance="False" 
        GroupBoxCaptionOffsetX="6px" Theme="RedWine" EnableTheming="True">
    <ContentPaddings PaddingBottom="10px" PaddingLeft="7px" PaddingRight="11px" PaddingTop="10px" />
                            <HeaderStyle>
                            <Paddings PaddingBottom="6px" PaddingLeft="7px" PaddingRight="11px" 
                                PaddingTop="1px" />
                            </HeaderStyle>
    <PanelCollection>
<dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttribute="True">
    <table>
        <tr>
            <td width="600">
                User&nbsp;Name:</td>
            <td>
                <dx:ASPxTextBox ID="userNameASPxTextBox" runat="server" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px" ClientInstanceName="userNameASPxTextBox">
                    <ClientSideEvents KeyDown="function(s, e) {
		if (e.htmlEvent.keyCode == 13)
		passwordASPxTextBox.Focus();
}" />
                    <ValidationSettings SetFocusOnError="True" 
                        ValidationGroup="signInVG" ErrorText="">
                        <RequiredField ErrorText="" IsRequired="True" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password:</td>
            <td>
                <dx:ASPxTextBox ID="passwordASPxTextBox" runat="server" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    Password="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px" ClientInstanceName="passwordASPxTextBox">
                    <ClientSideEvents KeyDown="function(s, e) {
		if (e.htmlEvent.keyCode == 13)
              submitASPxButton.DoClick();
}" />
                    <ValidationSettings SetFocusOnError="True" 
                        ValidationGroup="signInVG" ErrorText="">
                        <RequiredField ErrorText="" IsRequired="True" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dx:ASPxTextBox>
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
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="submitASPxButton" runat="server" 
                    ClientInstanceName="submitASPxButton" 
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="Submit" 
                    ValidationGroup="signInVG" Font-Bold="True" EnableTheming="True" Theme="RedWine" OnClick="vSubmitASPxButton_Click">
                    <ClientSideEvents Click="function(s, e) {
	ASPxCallbackPanel1.PerformCallback();
	ASPxLoadingPanel1.Show();
}" />
                </dx:ASPxButton>
            </td>
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
