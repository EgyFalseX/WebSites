<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInformationUC.ascx.cs" Inherits="UC_UserInformationUC" %>
<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
 <style type="text/css">
        .style1
        {
            width: 404px;
         height: 728px;
     }
        .style2
        {
            width: 133px;
        }
     .style3
     {
         width: 133px;
         text-align: right;
     }
    </style>

<div dir ="rtl" style="text-align: center">

        <table class="style1" dir="rtl" align="center">
            <tr>
                <td class="style3">
                    <asp:Label ID="Label1" runat="server" Text="كود التسجيل"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="LblEmpID" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label2" runat="server" Text="الفئه"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLEmpType" runat="server" Height="23px" Width="250px" 
                        TabIndex="1" Enabled="False">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label3" runat="server" Text="الاسم"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtEmpName" runat="server" Width="250px" MaxLength="50" 
                        TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label4" runat="server" Text="الرقم القومي"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtSSN" runat="server" Width="250px" MaxLength="70" 
                        TabIndex="3"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label5" runat="server" Text="تاريخ الميلاد"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtBDate" runat="server" Width="250px" TabIndex="4"></asp:TextBox>
                    <cc1:CalendarExtender ID="CETxtBDate" runat="server" Format="dd/MM/yyyy" 
                        TargetControlID="TxtBDate">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label6" runat="server" Text="النوع"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLGender" runat="server" Height="23px" Width="250px" 
                        TabIndex="5">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label7" runat="server" Text="تليفون"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtPhone" runat="server" Width="250px" MaxLength="15" 
                        TabIndex="6"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label8" runat="server" Text="موبيل"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtMobile" runat="server" Width="250px" MaxLength="15" 
                        TabIndex="7"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label9" runat="server" Text="العنوان"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtAddress" runat="server" Width="250px" MaxLength="100" 
                        TabIndex="8"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label10" runat="server" Text="البريد الالكتروني"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtEmail" runat="server" Width="250px" MaxLength="70" 
                        TabIndex="9"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label11" runat="server" Text="الوظيفه"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLJob" runat="server" Height="23px" Width="250px" 
                        TabIndex="10" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label12" runat="server" Text="محافظة العمل"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLCity" runat="server" Height="23px" Width="250px" 
                        TabIndex="11" AutoPostBack="True" 
                        onselectedindexchanged="DDLCity_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    ألاداره</td>
                <td>
                    <asp:DropDownList ID="DDLDepartment" runat="server" Height="23px" Width="250px" 
                        TabIndex="12" AutoPostBack="True" 
                        onselectedindexchanged="DDLDepartment_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label14" runat="server" Text="محل العمل"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLPlace" runat="server" Height="23px" Width="250px" 
                        TabIndex="13">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label15" runat="server" Text="حاصل علي الرخصه الدوليه"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLICDL" runat="server" Height="23px" Width="250px" 
                        TabIndex="14">
                        <asp:ListItem Value="False">لا</asp:ListItem>
                        <asp:ListItem Value="True">نعم</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label16" runat="server" Text="قاعدة البيانات التي عملت عليها"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtWorkDB" runat="server" Width="250px" MaxLength="255" 
                        TabIndex="15" Height="50px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label17" runat="server" 
                        Text="هل تم التدريب علي المدرسه الالكترونيه من قبل"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DDLESchoolTrain" runat="server" Height="23px" 
                        Width="250px" TabIndex="16">
                        <asp:ListItem Value="False">لا</asp:ListItem>
                        <asp:ListItem Value="True">نعم</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label18" runat="server" Text="اسم المستخدم"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtUserName" runat="server" Width="250px" MaxLength="50" 
                        TabIndex="17"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label19" runat="server" Text="كلمة المرور"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtPassword" runat="server" Width="250px" MaxLength="50" 
                        TabIndex="18"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label20" runat="server" Text="أعادة كلمة المرور"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TxtCPassword" runat="server" Width="250px" MaxLength="50" 
                        TabIndex="19"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="BtnSave" runat="server" TabIndex="20" Text="حفـــــــظ" 
                        Width="150px" onclick="BtnSave_Click" />
                    <br />
                    <asp:Label ID="LblState" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    </div>