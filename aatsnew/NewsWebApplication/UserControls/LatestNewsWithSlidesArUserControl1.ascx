<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControls_LatestNewsWithSlidesEnUserControl" Codebehind="LatestNewsWithSlidesArUserControl1.ascx.cs" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<table dir="ltr">
    <tr>
        <td>
                <telerik:RadRotator ID="latestNewsRadRotator" runat="server" 
                    DataSourceID="latestNewsSqlDataSource" Height="320px" 
                    ItemHeight="320px" ItemWidth="250px" ScrollDirection="Down" 
                    FrameDuration="4000" ScrollDuration="1000" Width="250px" 
                    onprerender="latestNewsRadRotator_PreRender">

<%--<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>--%>

                    <SlideShowAnimation Type="Pulse" />

<WebServiceSettings>
<ODataSettings InitialContainerName=""></ODataSettings>
</WebServiceSettings>
                    <ItemTemplate>
                       <table style="background-image: url('../IMAGES/news-bg.jpg')" dir="rtl">
                                    <tr>
                                        <td>
                                        <h2>
                                            <asp:HyperLink ID="titleHyperLink" runat="server" Font-Bold="True" 
                                                Font-Names="tahoma" Font-Size="14px" 
                                                NavigateUrl='<%# "~/News.aspx?NewsID="+Eval("NewsID") %>' 
                                                Text='<%# Eval("EnglishNewsTitle") %>' Width="250px" Height="30px" 
                                                ForeColor="#354EAA"></asp:HyperLink></h2>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:HyperLink ID="dateTimeLabel" runat="server" Font-Bold="True" 
                                                Font-Names="arial,helvetica,garuda,sans-serif" Font-Size="X-Small" ForeColor="#888080" 
                                                Text='<%# Eval("Date", "{0:d}") %>'></asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:HyperLink ID="introHyperLink" runat="server" Font-Bold="False" 
                                                Font-Names="tahoma" Font-Size="12px" 
                                                Text='<%# Eval("EnglishNewsIntro") %>' Width="250px" Height="70px" 
                                                ForeColor="Black"></asp:HyperLink>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right">
                                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                                ImageUrl="~/Images/icon_more1.gif" 
                                                PostBackUrl='<%# "~/News.aspx?NewsID="+Eval("NewsID") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="newsImageButton" runat="server" Height="100px" 
                                                ImageUrl='<%# Eval("NewsImagePath")!=""?"~/UploadImages/News/"+Eval("NewsImagePath"):"~/UploadImages/not_available.jpg" %>' 
                                                PostBackUrl='<%# "~/News.aspx?NewsID="+Eval("NewsID") %>' 
                                                Width="245px" />

                                        </td>
                                    </tr>

 <%--                                       <tr>
                                            <td>
                                            <br />
                                            <br />
                                                <div style="border-top: thick groove #F3861B; height: 5px; border-left-width: thick; border-right-width: thick; border-bottom-width: thick;">
                                                </div>
                                            </td>
                                        </tr>--%>

                                </table>


                    </ItemTemplate>

<SlideShowAnimation Type="Pulse"></SlideShowAnimation>

                </telerik:RadRotator>
            </td>
    </tr>
</table>
                <asp:SqlDataSource ID="latestNewsSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnDB %>" 
                    
                
                    
                    
                    
                    
    SelectCommand="SELECT TOP (3) NewsID, case when NewsImagePath is null then '' else NewsImagePath end As NewsImagePath, ReadCount, EnglishNewsTitle, EnglishNewsDetails, EnglishNewsIntro, Date FROM News ORDER BY Date DESC"></asp:SqlDataSource>
            


            

            

  

            


            

            

  <%--          	padding: 0px;
	margin: 0 0 10px 0;
	font-size: 14px;
	color: #354EAA;
            --%>

            


            

            


            



            


            

            


            

            


            

            


            