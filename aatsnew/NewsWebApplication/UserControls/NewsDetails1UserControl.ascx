<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsDetails1UserControl.ascx.cs" Inherits="NewsDetails1UserControl" %>


<div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/ar_AR/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>



<asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
       <table dir="rtl">
                            <tr>
                                <td valign="top">
<%--                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Large" ForeColor="Black" NavigateUrl='<%# "~/NewssDetails.aspx?ID="+Eval("ID") %>' Text='<%# Eval("TitleAr") %>'></asp:HyperLink><br />
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Medium" ForeColor="#8A867D" NavigateUrl='<%# "~/NewsDetails.aspx?ID="+Eval("ID") %>' Text='<%# Eval("TitleAr") %>'></asp:HyperLink>--%>
                                    <asp:Label ID="titleLabel" runat="server" Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Large" ForeColor="Black" Text='<%# Eval("TitleAr") %>'></asp:Label><br />
                                     <asp:Label ID="detailsLabel" runat="server" Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Medium" ForeColor="#8A867D" Text='<%# Eval("EventArDetails") %>'></asp:Label>
                                    <br />
<%--                                                                        <div class="fb-share-button" data-href='<%# "~/NewssDetails.aspx?ID="+Eval("ID") %>' data-layout="button_count"></div>--%>
                                    <!-- Go to www.addthis.com/dashboard to customize your tools -->
                                    <!-- Go to www.addthis.com/dashboard to customize your tools -->
<div class="fb-like" data-href='<%# "../NewssDetails.aspx?ID="+Eval("ID") %>' data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>

<br />
                                </td>
                                <td>
                                    <asp:Image ID="newsImage" runat="server" Height="150px" ImageUrl='<%# "../"+Eval("EventImage") %>' Width="200px" />
                                </td>
                            </tr>
                        </table>
    </ItemTemplate>
</asp:DataList>