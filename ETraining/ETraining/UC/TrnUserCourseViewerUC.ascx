<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrnUserCourseViewerUC.ascx.cs" Inherits="UC_TrnUserCourseViewerUC" %>
<style type="text/css">
    .style1
    {
        height: 24px;
    }
    .style2
    {
        width: 133px;
    }
    .style3
    {
        height: 24px;
        width: 133px;
    }
    .style4
    {
        width: 143px;
    }
    .style5
    {
        width: 133px;
        height: 23px;
    }
    .style7
    {
        width: 133px;
        height: 68px;
    }
    .style8
    {
        height: 68px;
    }
    .style9
    {
        width: 159px;
    }
</style>
<div dir="rtl" style="text-align: justify">
    

     <asp:DataList ID="DataList1" runat="server" 
        CellPadding="2" EnableTheming="True" RepeatColumns="1" 
            Width="500px" Height="929px" ForeColor="Black" 
         BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
         style="text-align: center">
            <FooterStyle BackColor="Tan" />
            <AlternatingItemStyle BackColor="PaleGoldenrod" />
            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <ItemTemplate>
               <div dir="rtl">
                    <table dir="rtl" style="width: 446px; height: 368px">
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label1" runat="server" Text="كود الدورة التدريبية"></asp:Label>
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="LblCode" runat="server" Text='<% # bind("DowraId") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label2" runat="server" Text="فئة الدورة"></asp:Label>
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="LblType" runat="server" Text='<% # bind("CourseType") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" >
                            <asp:Label ID="Label3" runat="server" Text="اسم الدورة"></asp:Label>
                        </td>
                        <td  colspan="2" class="style1">
                            <asp:Label ID="LblName" runat="server" Text='<% # bind("DowraName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label4" runat="server" Text="مكان الدورة التدريبية"></asp:Label>
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="LblPlace" runat="server" Text='<% # bind("CoursePlace") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label13" runat="server" Text="مكان الدورة التدريبية"></asp:Label>
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="LblLab" runat="server" Text='<%# bind("LabName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label5" runat="server" Text="تاريخ البداية"></asp:Label>
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="LblStartDate" runat="server" Text='<% # bind("StartDate") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label6" runat="server" Text="تاريخ النهاية"></asp:Label>
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="LblEndDate" runat="server" Text='<% # bind("EndDate") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" >
                            <asp:Label ID="Label7" runat="server" Text="سعر الدورة"></asp:Label>
                        </td>
                        <td  colspan="2" class="style1">
                            <asp:Label ID="LblPrice" runat="server" Text='<% # bind("Price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="Label8" runat="server" Text="لها امتحان"></asp:Label>
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="LblExam" runat="server" Text='<% # bind("ArWithExam") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3" >
                            <asp:Label ID="Label9" runat="server" Text="الدرجة العظمى"></asp:Label>
                        </td>
                        <td colspan="2" class="style1">
                            <asp:Label ID="LblHightDgree" runat="server" Text='<% # bind("ExamMax") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style5" >
                            <asp:Label ID="Label10" runat="server" Text="الدرجة الصغرى"></asp:Label>
                        </td>
                        <td  colspan="2" class="style1">
                            <asp:Label ID="LblLowDgree" runat="server" Text='<% # bind("ExamMin") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2" >
                            <asp:Label ID="Label11" runat="server" Text="يمكن الاعتذار عن الدورة"></asp:Label>
                        </td>
                        <td  colspan="2" class="style1">
                            <asp:Label ID="LblApologize" runat="server" Text='<% # bind("ArApologyAllow") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="style7">
                            <asp:Label ID="Label12" runat="server" Text="ملاحظات"></asp:Label>
                        </td>
                        <td colspan="2" class="style8">
                            <asp:TextBox ID="LblNote" runat="server" Height="60px" TextMode="MultiLine" 
                                Width="230px" Text ='<% # bind("rem") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Button ID="BtnViewAgenda" runat="server" Text="عرض اجندة الدوره" 
                                Width="100px"  PostBackUrl='<% # bind("AgendaURL") %>'  />
                        </td>
                        <td class="style9" >
                            <asp:Button ID="BtnApologize" runat="server" Text="الاعتزار عن الدوره" 
                                Width="100px" Enabled ='<% # bind("ApologyAllow") %>' PostBackUrl='<% # bind("ApologyURL") %>' />
                        </td>
                        <td class="style4" >
                            <asp:Button ID="BtnViewTrainer" runat="server" TabIndex="1" Text="مدربي الدوره" 
                                Width="100px" PostBackUrl='<% # bind("TrainerURL") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Button ID="BtnRateCourse" runat="server" Text="تقييـــم الدوره" 
                                Width="100px" Enabled ='<% # bind("EvalAllow") %>' PostBackUrl='<% # bind("CourseRateURL") %>' />
                        </td>
                        <td class="style9" >
                            <asp:Button ID="BtnRateIns" runat="server" Text="تقيـــم المـــدرب" 
                                Width="100px" Enabled ='<% # bind("EvalAllow") %>' PostBackUrl='<% # bind("InsRateURL") %>' />
                        </td>
                        <td class="style4" >
                            &nbsp;</td>
                    </tr>
                    </table>
               </div> 
            </ItemTemplate>
        </asp:DataList>
        <br />
    <asp:Label ID="LblState" runat="server" ForeColor="Red" Visible="False"></asp:Label>
</div>