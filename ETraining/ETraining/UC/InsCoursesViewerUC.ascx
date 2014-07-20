<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InsCoursesViewerUC.ascx.cs" Inherits="UC_InsCoursesViewerUC" %>
<style type="text/css">
    .style1
    {
        width: 414px;
        height: 486px;
    }
    .style2
    {}
    .style3
    {
        width: 133px;
    }
    .style4
    {
        width: 384px;
        text-align: center;
    }
    .style5
    {
        text-align: center;
    }
</style>

<div dir="rtl">
    <table class="style4" dir="rtl" align="center">
        <tr>
            <td class="style3">
            <asp:Label ID="Label13" runat="server" Text="فئة الدورة"></asp:Label>
            </td>
            <td class="style5">
                <asp:DropDownList ID="DDLTypes" runat="server" Height="20px" 
                    style="direction: ltr; margin-bottom: 7px;" Width="228px" 
                    AutoPostBack="True" onselectedindexchanged="DDLTypes_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:Label ID="LblState" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</div>

<div dir="rtl">
     <asp:DataList ID="DataList1" runat="server" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" 
        CellPadding="2" EnableTheming="True" RepeatColumns="1" 
            Width="500px" ForeColor="Black" style="text-align: center">
            <FooterStyle BackColor="Tan" />
            <AlternatingItemStyle BackColor="PaleGoldenrod" />
            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <ItemTemplate>
               <div dir="rtl">
                   <table class="style1" dir="rtl">
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label1" runat="server" Text="كود الدورة التدريبية"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblCode" runat="server" Text='<% # bind("DowraId") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label2" runat="server" Text="فئة الدورة"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblType" runat="server" Text='<% # bind("CourseType") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label3" runat="server" Text="اسم الدورة"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblName" runat="server" Text='<% # bind("DowraName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label4" runat="server" Text="مكان الدورة التدريبية"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblPlace" runat="server" Text='<% # bind("CoursePlace") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label14" runat="server" Text="مكان الدورة التدريبية"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblLab" runat="server" Text='<%# bind("LabName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label5" runat="server" Text="تاريخ البداية"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblStartDate" runat="server" Text='<% # bind("StartDate") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label6" runat="server" Text="تاريخ النهاية"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblEndDate" runat="server" Text='<% # bind("EndDate") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label7" runat="server" Text="سعر الدورة"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblPrice" runat="server" Text='<% # bind("Price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label8" runat="server" Text="لها امتحان"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblExam" runat="server" Text='<% # bind("WithExam") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label9" runat="server" Text="الدرجة العظمى"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblHightDgree" runat="server" Text='<% # bind("ExamMax") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label10" runat="server" Text="الدرجة الصغرى"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblLowDgree" runat="server" Text='<% # bind("ExamMin") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Label ID="Label11" runat="server" Text="يمكن الاعتذار عن الدورة"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="LblApologize" runat="server" Text='<% # bind("ApologyAllow") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style3">
                            <asp:Label ID="Label12" runat="server" Text="ملاحظات"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="LblNote" runat="server" Height="60px" TextMode="MultiLine" 
                                Width="230px" Text ='<% # bind("rem") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <asp:Button ID="BtnViewAgenda" runat="server" Text="عرض اجندة الدوره" 
                                Width="100px"  PostBackUrl='<% # bind("AgendaURL") %>'  />
                        </td>
                        <td class="style2">
                            <asp:Button ID="BtnViewTrainer" runat="server" TabIndex="1" Text="مدربي الدوره" 
                                Width="100px" PostBackUrl='<% # bind("TrainerURL") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        &nbsp;
                        </td>
                        <td class="style2">
                        &nbsp;
                        </td>
                    </tr>
</table>
               </div> 
            </ItemTemplate>
        </asp:DataList>
    <br />
    <asp:Repeater ID="Repeater1" runat="server" onprerender="Repeater1_PreRender">
        <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" Text='<% # bind("PageName") %>' onclick="LinkButton1_Click" runat="server">LinkButton</asp:LinkButton></ItemTemplate>
            <SeparatorTemplate> &nbsp; | &nbsp;</SeparatorTemplate>
     </asp:Repeater>
</div>