<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpshowHWforAstudent.ascx.cs" Inherits="UserControls_EmpshowHWforAstudent" %>
<div id="shw" runat="server" dir="rtl">
   <center> <table dir="rtl">
        <tr>
            <td style="width: 180px" >
                <center><asp:Label ID="Label3" runat="server" Text="ÇáÕÝ"></asp:Label>&nbsp;</center>
                <center>
                    
                    <asp:DropDownList ID="ddlSaf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSaf_SelectedIndexChanged" >
                    </asp:DropDownList></center>
            </td>
            <td style="width: 269px" >
               <center> <asp:Label ID="Label1" runat="server" Text="ÇáÝÕá"></asp:Label>&nbsp;</center>
                <center>
                <asp:DropDownList ID="ddl_Elfasl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_Elfasl_SelectedIndexChanged" >
                </asp:DropDownList></center>
            </td>
            <td style="width: 79px" >
               <center> <asp:Label ID="Label2" runat="server" Text="ÇÓã ÇáØÇáÈ"></asp:Label>&nbsp;</center>
                <center>
                <asp:DropDownList ID="ddl_Studens" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_Studens_SelectedIndexChanged">
                </asp:DropDownList></center>
            </td>
        </tr>
        <tr>
            <td colspan="3">
<asp:GridView ID="gr_StudentHomeW" runat="server" AllowPaging="True" 
    ForeColor="#333333" GridLines="None" HorizontalAlign="Center"  Caption="æÇÌÈ ÎÇÕ" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" Width="568px" AutoGenerateColumns="False" OnPageIndexChanging="gr_StudentHomeW_PageIndexChanging">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="ÇÓã ÇáØÇáÈ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stu_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblStudname" runat="server" OnDataBinding="lblStudname_DataBinding"
                    Text='<%# Bind("stu_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ÇáÍÕÉ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("hasa_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblHesa" runat="server" OnDataBinding="lblHesa_DataBinding" Text='<%# Bind("hasa_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="ÇáãÇÏÉ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("mawad_no") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblMadah" runat="server" Text='<%# Bind("mawad_no") %>' OnDataBinding="lblMadah_DataBinding"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="add_date" HeaderText="ÇáÊÇÑíÎ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="home_work" HeaderText="ÇáæÇÌÈ" HtmlEncode="False">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="ÇáÍÇáÉ">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("read_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" OnDataBinding="lblStatus_DataBinding" Text='<%# Bind("read_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <RowStyle BackColor="#EFF3FB" />
    <EditRowStyle BackColor="#2461BF" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
            </td>
        </tr>
    </table></center>
</div>
