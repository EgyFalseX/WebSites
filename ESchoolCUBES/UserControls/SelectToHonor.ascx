<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SelectToHonor.ascx.cs" Inherits="NewUserControl_SelectToHonor" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<style type="text/css">

        .style3
        {
            width: 220px;
        }
        .style1
        {
            height: 37px;
        }
        .style4
        {
            height: 37px;
            width: 220px;
        }
        .style2
        {
            height: 50px;
        }
        </style>
    
        
    <table dir="rtl">
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Label ID="Label19" runat="server" style="font-weight: 700" Text="الطلاب"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="المراحل"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DDLMarhala" runat="server" Width="161px" 
                        AutoPostBack="True" onselectedindexchanged="DDLMarhala_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="الصفوف"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DDLSfoof" runat="server" Width="161px" 
                        AutoPostBack="True" onselectedindexchanged="DDLSfoof_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="الفصول"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DDLFsool" runat="server" Width="161px" 
                        AutoPostBack="True" onselectedindexchanged="DDLFsool_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="الطلاب"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DDLStudents" runat="server" Width="161px" 
                        AutoPostBack="True" onselectedindexchanged="Enable_BtnAddStudent">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="انواع لوحة التميز"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DDLHonorTypes1" runat="server" Width="161px" 
                        AutoPostBack="True" onselectedindexchanged="Enable_BtnAddStudent">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Label ID="Label12" runat="server" Text="التاريخ"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="TxtDate1" runat="server" Width="160px" AutoPostBack="True" 
                        ontextchanged="Enable_BtnAddStudent"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                        TargetControlID="TxtDate1">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="BtnAddStudent" runat="server" Text="اضافه طالب" Width="71px" 
                        Enabled="False" onclick="BtnAddStudent_Click" />
                    <asp:Label ID="LblResult1" runat="server" Text="."></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center" class="style2">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Label ID="Label20" runat="server" style="font-weight: 700" 
                        Text="المعلـــمين"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="انواع لوحة التميز"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DDLHonorTypes2" runat="server" Width="161px" 
                        onselectedindexchanged="Enable_BtnAddTeacher" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="المعلمين"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DDLTeachers" runat="server" Width="161px" 
                        onselectedindexchanged="Enable_BtnAddTeacher" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label23" runat="server" Text="التاريخ"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TxtDate2" runat="server" Width="160px" 
                        ontextchanged="Enable_BtnAddTeacher" AutoPostBack="True"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                        TargetControlID="TxtDate2">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="BtnAddTeacher" runat="server" Text="اضافه معلـم" Width="71px" 
                        Enabled="False" onclick="BtnAddTeacher_Click" />
                    <asp:Label ID="LblResult2" runat="server" Text="."></asp:Label>
                </td>
            </tr>
        </table>
    