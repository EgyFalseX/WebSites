<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsDetailsUserControl.ascx.cs" Inherits="NewsDetailsUserControl" %>


<%--<%@ Register src="SilderDetailsUserControl.ascx" tagname="SilderDetailsUserControl" tagprefix="uc1" %>--%>


<style type="text/css">
    .auto-style1 {
        width: 960px;
        height: 140px;
    }
</style>


<%--<asp:DataList ID="DataList1" runat="server">
    <ItemTemplate>
       <table dir="rtl">
                            <tr>
                                <td valign="top">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Large" ForeColor="Black" NavigateUrl='<%# "~/EventsDetails.aspx?ID="+Eval("ID") %>' Text='<%# Eval("Caption") %>'></asp:HyperLink><br />
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Names="Trebuchet MS" Font-Size="Medium" ForeColor="#8A867D" NavigateUrl='<%# "~/EventsDetails.aspx?ID="+Eval("ID") %>' Text='<%# Eval("Contain") %>'></asp:HyperLink>
                                    <br />
                                </td>
                                <td>
                                    <asp:Image ID="newsImage" runat="server" Height="150px" ImageUrl='<%# "~/Images/Slider/"+Eval("ImageLink") %>' Width="200px" />
                                </td>
                            </tr>
                        </table>
    </ItemTemplate>
</asp:DataList>--%>


<%--<table width="960" hight="140">
    <tr>
        <td>
            <img alt="" class="auto-style1" src="file:///C:/Users/ahmed/Desktop/Banar.jpg" /></td>
    </tr>

    <tr>
        <td>
            <uc1:SilderDetailsUserControl ID="SilderDetailsUserControl1" runat="server" Visible="False" />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
    </tr>

</table>--%>