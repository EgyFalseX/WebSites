<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNews.aspx.cs" Inherits="AddNews" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>اضـــافة الاخبــار</title>
    <style type="text/css">
        .style1
        {
            width: 771px;
        }
        .style2
        {
            width: 771px;
            height: 173px;
        }
        .style3
        {
            height: 173px;
        }
        #form1
        {
            height: 443px;
        }
    #apDiv1 {
	position:absolute;
	left:818px;
	top:465px;
	width:298px;
	height:46px;
	z-index:1;
}
    </style>
<script language="javascript" type="text/javascript">
// <!CDATA[



// ]]>
</script>
</head>
<body>
<form id="form1" runat="server">
  <asp:ScriptManager ID="ScriptManager1" runat="server">
  </asp:ScriptManager>
<table align="right" style="width:100%;">
        <tr>
            <td class="style1">&nbsp;
                </td>
            <td align="right">
                <asp:TextBox ID="TxtTitle" runat="server" Width="387px" style="direction: rtl"></asp:TextBox>
            </td>
            <td align="right">
                <asp:Label ID="Label1" runat="server" Text="العنوان"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
            </td>
            <td align="right" class="style3">
                <asp:TextBox ID="TxtDetails" runat="server" Height="158px" Width="388px" 
                    TextMode="MultiLine" style="direction: rtl"></asp:TextBox>
            </td>
            <td align="right" class="style3">
                <asp:Label ID="Label2" runat="server" Text="التفاصيل"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">&nbsp;
                </td>
            <td align="right">
                <br />
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    TargetControlID="TxtDate">
                </cc1:CalendarExtender>
                <asp:CheckBox ID="CBShow" runat="server" Text="لا يعرض" />
                <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox>
                <br />
            </td>
            <td align="right">
                <asp:Label ID="Label3" runat="server" Text="التاريــخ"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="style1" align="right">&nbsp;
                </td>
            <td align="right">
                <asp:Label ID="LblStatus" runat="server" Text="."></asp:Label>
                <asp:Button ID="BtnAddNews" runat="server" onclick="BtnAddNews_Click" 
                    Text="اضافه" />
             </td>
            <td align="right">&nbsp;
                </td>
        </tr>
        <tr>
            <td align="right" colspan="2" style="direction: ltr">
              <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="code_news" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged" 
        onprerender="GridView2_PreRender" BackColor="White" BorderColor="#999999" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
                    style="direction: rtl" Width="568px" Height="294px" AllowPaging="True">
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <Columns>
                        <asp:BoundField DataField="news_title" HeaderText="العنوان" >
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="news_details" HeaderText="التفاصيل" >
                        <ItemStyle Width="200px" Wrap="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Timeline" HeaderText="التاريخ" 
                            DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:TemplateField HeaderText="يعرض">
                            <EditItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" 
                                    oncheckedchanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("id_starting") %>'></asp:TextBox>
                                <asp:HiddenField ID="HiddenField1" Value="<% # Bind('code_news') %>" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" Value = '<%# Bind("id_starting") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HiddenField ID="HiddenField1" Value="<% # Bind('code_news') %>" runat="server" />
                                <asp:HiddenField ID="HiddenField2" runat="server" Value = '<%# Bind("id_starting") %>' />
                               

                                <br />
                                <asp:CheckBox ID="CheckBox1" runat="server" 
                                    oncheckedchanged="CheckBox1_CheckedChanged" AutoPostBack="True" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="code_news" HeaderText="code_news" Visible="False" />
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" 
                            SelectText="حذف" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="Gainsboro" />
                </asp:GridView>
                <br />
                <br />
              </td>
            <td align="right">&nbsp;
                </td>
        </tr>
        
    </table>
    <p>&nbsp;
      </p>
<p style="direction: ltr">&nbsp;
  </p>
    </form>
</body>
</html>
