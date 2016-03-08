<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="FriendsSignUp.aspx.cs" Inherits="FriendsSignUp" %>








<%@ Register src="UC/FriendsSingUpUserControl.ascx" tagname="FriendsSingUpUserControl" tagprefix="uc1" %>








<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">--%>
  <%--  <asp:Panel ID="Panel1" runat="server">--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
 
    
 
 
    
 
         
 
    
 
 
    
 
         <asp:ScriptManager ID="ScriptManager1" runat="server">
         </asp:ScriptManager>
         <uc1:FriendsSingUpUserControl ID="FriendsSingUpUserControl1" runat="server" />
 
    
 
 
    
 
         
 
    
 
 
    
 
         </div>
    </form>
</body>
</html>
   <%-- </asp:Panel>--%>
<%--</asp:Content>--%>
