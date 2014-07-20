<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FullTblEmp.ascx.cs" Inherits="FullTblEmp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
        .style3
        {
            width: 50%;
            height: 440px;
        }
        .style4
        {
            width: 400px;
        }
        .style5
        {
            font-weight: 700;
        }
        .style6
        {
            height: 34px;
        }
        .style7
        {
            width: 233px;
            height: 34px;
        }
        .style8
        {
            width: 106px;
            height: 24px;
        }
        .style9
        {
            width: 400px;
            height: 24px;
        }
        .style10
        {
            height: 24px;
        }
        .style11
        {
            height: 34px;
            width: 106px;
        }
        .style12
        {
            width: 400px;
            height: 34px;
        }
    </style>
<div align="right">
    <h3  style="width: 280px" align="center">
                  &#1571;&#1603;&#1608;&#1575;&#1583; &#1575;&#1604;&#1605;&#1608;&#1592;&#1601;&#1610;&#1606; 
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                  </asp:ScriptManager>
        </h3>
    </div>
    <div align="right" dir="rtl">
    <table cellpadding="0" cellspacing="0" class="style3" dir="rtl" align="center">
        <tr>
            <td class="style5" bgcolor="#507CD1">
                &nbsp;</td>
            <td class="style4" align="center" bgcolor="#507CD1" >
                 <asp:Label ID="Label1" runat="server" Text="&#1576;&#1610;&#1575;&#1606;&#1575;&#1578; &#1571;&#1587;&#1575;&#1587;&#1610;&#1577;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black" style="font-size: large"></asp:Label></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label2" runat="server" Text="&#1603;&#1608;&#1583; &#1575;&#1604;&#1605;&#1608;&#1592;&#1601;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:TextBox style="direction: rtl" ID="TextEmpID" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" ReadOnly="True"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextEmpID" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label3" runat="server" Text="&#1575;&#1587;&#1605; &#1575;&#1604;&#1605;&#1608;&#1592;&#1601;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:TextBox style="direction: rtl" ID="TextEmpName" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextEmpName" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label4" runat="server" Text="&#1575;&#1604;&#1585;&#1602;&#1605; &#1575;&#1604;&#1602;&#1608;&#1605;&#1610;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" 
                    FilterType="Numbers" TargetControlID="TextNationId">
                </cc1:FilteredTextBoxExtender>
                <asp:TextBox style="direction: rtl" ID="TextNationId" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="14"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextNationId" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="Label5" runat="server" Text="&#1578;&#1575;&#1585;&#1610;&#1582; &#1575;&#1604;&#1605;&#1610;&#1604;&#1575;&#1583;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style9">
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                    TargetControlID="TextBrithDate">
                </cc1:CalendarExtender>
                <asp:TextBox style="direction: rtl" ID="TextBrithDate" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBrithDate" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5" bgcolor="#507CD1">
                </td>
            <td class="style4" align="center" bgcolor="#507CD1">
                <asp:Label ID="Label6" runat="server" Text="&#1576;&#1610;&#1575;&#1606;&#1575;&#1578; &#1575;&#1604;&#1573;&#1578;&#1589;&#1575;&#1604;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black" style="font-size: large"></asp:Label></td>
        </tr>
        <tr>
            <td class="style5" >
                <asp:Label ID="Label7" runat="server" Text="&#1605;&#1581;&#1605;&#1608;&#1604;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                 <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" 
                    FilterType="Numbers" TargetControlID="TextMobile">
                </cc1:FilteredTextBoxExtender>
                <asp:TextBox style="direction: rtl" ID="TextMobile" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="14"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="TextMobile" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label8" runat="server" Text="&#1578;&#1604;&#1610;&#1601;&#1608;&#1606;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" 
                    FilterType="Numbers" TargetControlID="TextPhone">
                </cc1:FilteredTextBoxExtender>
                <asp:TextBox style="direction: rtl" ID="TextPhone" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="14"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TextPhone" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label9" runat="server" Text="&#1575;&#1604;&#1593;&#1606;&#1608;&#1575;&#1606;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:TextBox style="direction: rtl" ID="TextAddress" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TextAddress" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label10" runat="server" Text="&#1575;&#1604;&#1575;&#1610;&#1605;&#1610;&#1604;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:TextBox style="direction: rtl" ID="TextEMail" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="50"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="TextEMail" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ErrorMessage="sample@company.com" ControlToValidate="TextEMail" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td class="style5" bgcolor="#507CD1">
                </td>
            <td class="style4" align="center" bgcolor="#507CD1">
                <asp:Label ID="Label11" runat="server" Text="&#1576;&#1610;&#1575;&#1606;&#1575;&#1578; &#1575;&#1604;&#1605;&#1572;&#1607;&#1604;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black" style="font-size: large"></asp:Label></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label12" runat="server" Text="&#1575;&#1604;&#1605;&#1572;&#1607;&#1604;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:DropDownList style="direction: ltr" ID="DropDownListQual" runat="server" 
                    onselectedindexchanged="DropDownListQual_SelectedIndexChanged" Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="DropDownListQual" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label13" runat="server" Text="&#1575;&#1604;&#1578;&#1582;&#1589;&#1589;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:DropDownList style="direction: ltr" ID="DropDownListQualTakasos" runat="server" 
                    onselectedindexchanged="DropDownListQualTakasos_SelectedIndexChanged" Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="DropDownListQualTakasos" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label14" runat="server" Text="&#1580;&#1607;&#1577; &#1575;&#1604;&#1605;&#1572;&#1607;&#1604;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                 <asp:DropDownList style="direction: ltr" ID="DropDownListQualGeha" 
                     runat="server" Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="DropDownListQualGeha" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label15" runat="server" Text="&#1587;&#1606;&#1577; &#1575;&#1604;&#1578;&#1582;&#1585;&#1580;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" 
                    FilterType="Numbers" TargetControlID="TextYearQual">
                </cc1:FilteredTextBoxExtender>
                <asp:TextBox style="direction: rtl" ID="TextYearQual" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="TextYearQual" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label16" runat="server" Text="&#1575;&#1604;&#1578;&#1602;&#1583;&#1610;&#1585;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                 <asp:DropDownList style="direction: ltr" ID="DropDownListQualTakdeer" 
                     runat="server" Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="DropDownListQualTakdeer" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
           <td class="style5" bgcolor="#507CD1">
                </td>
            <td class="style4" align="center" bgcolor="#507CD1">
               <asp:Label ID="Label17" runat="server" 
                    Text="&#1576;&#1610;&#1575;&#1606;&#1575;&#1578; &#1575;&#1604;&#1608;&#1592;&#1610;&#1601;&#1577;" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black" style="font-size: large" Height="26px" 
                    Width="89px"></asp:Label></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label18" runat="server" Text="&#1575;&#1604;&#1608;&#1592;&#1610;&#1601;&#1577;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:DropDownList style="direction: ltr" ID="DropDownListJob" runat="server" 
                    Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                    ControlToValidate="DropDownListJob" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label19" runat="server" Text="&#1575;&#1604;&#1605;&#1587;&#1605;&#1609; &#1575;&#1604;&#1608;&#1592;&#1610;&#1601;&#1610;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:DropDownList style="direction: ltr" ID="DropDownListJobDesc" 
                    runat="server" Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                    ControlToValidate="DropDownListJobDesc" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label20" runat="server" Text="&#1575;&#1604;&#1601;&#1585;&#1593;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:DropDownList style="direction: ltr" ID="DropDownListBranch" runat="server" 
                    Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                    ControlToValidate=DropDownListBranch ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label21" runat="server" Text="&#1575;&#1604;&#1573;&#1583;&#1575;&#1585;&#1577;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:DropDownList style="direction: ltr" ID="DropDownListEdara" runat="server" 
                    Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                    ControlToValidate="DropDownListEdara" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label22" runat="server" Text="&#1575;&#1604;&#1602;&#1587;&#1605;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:DropDownList style="direction: ltr" ID="DropDownListDept" runat="server" 
                    Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                    ControlToValidate="DropDownListDept" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label23" runat="server" Text="&#1575;&#1604;&#1605;&#1585;&#1578;&#1576; &#1575;&#1604;&#1575;&#1587;&#1575;&#1587;&#1610;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" 
                    FilterType="Numbers" TargetControlID="TextBasicSalary">
                </cc1:FilteredTextBoxExtender>
                <asp:TextBox style="direction: rtl" ID="TextBasicSalary" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                    ControlToValidate="TextBasicSalary" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label24" runat="server" Text="&#1587;&#1575;&#1593;&#1575;&#1578; &#1575;&#1604;&#1593;&#1605;&#1604;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" 
                    FilterType="Numbers" TargetControlID="TextWorkHour">
                </cc1:FilteredTextBoxExtender>
                <asp:TextBox style="direction: rtl" ID="TextWorkHour" runat="server" 
                    Width="200px" Font-Bold="True" 
                    Font-Size="14px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                    ControlToValidate="TextWorkHour" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style5">
                <asp:Label ID="Label25" runat="server" Text="&#1591;&#1585;&#1610;&#1602;&#1577; &#1575;&#1604;&#1581;&#1587;&#1575;&#1576;" Font-Bold="True" 
                    Font-Size="14px" Visible="True" ForeColor="Black"></asp:Label></td>
            <td class="style4">
                <asp:DropDownList style="direction: ltr" ID="DropDownListSalaryType" 
                    runat="server" Font-Size="14px" Font-Bold="true"
                    AutoPostBack="True" Height="25px" Width="205px">
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                    ControlToValidate="DropDownListSalaryType" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="ValidationSummary1">*</asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="style11" >
                </td>
            <td class="style12">
                    <asp:Button ID="Button3" runat="server" 
                        Text="&#1575;&#1590;&#1575;&#1601;&#1577;" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" 
                    onclick="ButnSave_Click" ValidationGroup="ValidationSummary1" Height="26px"  />
            </td>
        </tr>
            </table>
</div>
    <table align="right">
        <tr> 
            <td class="style7">
                    <div align="right">
    <asp:GridView ID="GridViewTblEmp" runat="server" EnableModelValidation="True" Font-Bold="True"
        CellPadding="4" onrowediting="GridViewTblEmp_RowEditing"
        Font-Size="14px" Width="454px" 
         
        onrowdeleting="GridViewTblEmp_RowDeleting" Height="16px" 
            onrowupdating="GridViewTblEmp_RowUpdating" AutoGenerateColumns="False" 
             ForeColor="#333333" 
            onrowcancelingedit="GridViewTblEmp_RowCancelingEdit" 
            style="direction: rtl"       
            
                            
                            
                            EmptyDataText="&#1604;&#1575; &#1610;&#1608;&#1580;&#1583; &#1571;&#1587;&#1605;&#1575;&#1569; &#1605;&#1608;&#1592;&#1601;&#1610;&#1606;" >
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        <Columns>
            <%--SELECT EmpID,EmpName,NationalId,BrithDate
QualId,*QualName,QualTakasos,*QualTakasosName,QualGehaId,*GOV,YearQual,QualTakder,*QualTakerName
JobId,*JobId1,JobDescId,*JobDescName,BranchId,*Branchename,EdaraId,*EdaraName,DepID,*DepName,mobil,WorkHour
,SalaryTypeId,*SalaryTypeName,phone,address,email,BasicSalary FROM TblEmp--%>
            <asp:BoundField DataField="EmpID" HeaderText="&#1603;&#1608;&#1583; &#1575;&#1604;&#1605;&#1608;&#1592;&#1601;" />
            <asp:BoundField DataField="EmpName" HeaderText="&#1575;&#1587;&#1605; &#1575;&#1604;&#1605;&#1608;&#1592;&#1601;" />
            <asp:BoundField DataField="NationalId" HeaderText="&#1575;&#1604;&#1585;&#1602;&#1605; &#1575;&#1604;&#1602;&#1608;&#1605;&#1610;" />
            <asp:TemplateField HeaderText="&#1578;&#1575;&#1585;&#1610;&#1582; &#1575;&#1604;&#1605;&#1610;&#1604;&#1575;&#1583;">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BrithDate") %>'></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" 
                        TargetControlID="TextBox1">
                    </cc1:CalendarExtender>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label26" runat="server" 
                        Text='<%# Eval("BrithDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="mobil" HeaderText="&#1605;&#1608;&#1576;&#1575;&#1610;&#1604;" />
            <asp:BoundField DataField="phone" HeaderText="&#1578;&#1604;&#1610;&#1601;&#1608;&#1606;" />
            <asp:BoundField DataField="address" HeaderText="&#1593;&#1606;&#1608;&#1575;&#1606;" />
            <asp:BoundField DataField="email" HeaderText="&#1573;&#1610;&#1605;&#1610;&#1604;" />
            <asp:BoundField DataField="QualId" HeaderText="&#1575;&#1604;&#1605;&#1572;&#1607;&#1604;" />
            <asp:BoundField DataField="QualTakasos" HeaderText="&#1578;&#1582;&#1589;&#1589; &#1575;&#1604;&#1605;&#1572;&#1607;&#1604;" />
            <asp:BoundField DataField="QualGehaId" HeaderText="&#1580;&#1607;&#1577; &#1575;&#1604;&#1605;&#1572;&#1607;&#1604;" />
            <asp:BoundField DataField="YearQual" HeaderText="&#1587;&#1606;&#1577; &#1575;&#1604;&#1578;&#1582;&#1585;&#1580;" />
            <asp:BoundField DataField="QualTakder" HeaderText="&#1578;&#1602;&#1583;&#1610;&#1585; &#1575;&#1604;&#1605;&#1572;&#1607;&#1604;" />
            <asp:BoundField DataField="JobId" HeaderText="&#1575;&#1604;&#1608;&#1592;&#1610;&#1601;&#1577;" />
            <asp:BoundField DataField="JobDescId" HeaderText="&#1608;&#1589;&#1601; &#1575;&#1604;&#1608;&#1592;&#1610;&#1601;&#1577;" />
            <asp:BoundField DataField="BranchId" HeaderText="&#1575;&#1604;&#1601;&#1585;&#1593;" />
            <asp:BoundField DataField="EdaraId" HeaderText="&#1575;&#1604;&#1573;&#1583;&#1575;&#1585;&#1577;" />
            <asp:BoundField DataField="DepID" HeaderText="&#1575;&#1604;&#1602;&#1587;&#1605;" />
            <asp:BoundField DataField="BasicSalary" HeaderText="&#1575;&#1604;&#1605;&#1585;&#1578;&#1576; &#1575;&#1604;&#1571;&#1587;&#1575;&#1587;&#1610;" />
            <asp:BoundField DataField="WorkHour" HeaderText="&#1587;&#1575;&#1593;&#1575;&#1578; &#1575;&#1604;&#1593;&#1605;&#1604;" />
            <asp:BoundField DataField="SalaryTypeId" HeaderText="&#1581;&#1587;&#1575;&#1576; &#1575;&#1604;&#1605;&#1585;&#1578;&#1576;" />
                        <asp:CommandField ShowEditButton="True" EditImageUrl="~/Images/edittt.png" CancelImageUrl="~/Images/cancel.png" 
                UpdateImageUrl="~/Images/update.png" EditText="&#1578;&#1593;&#1583;&#1610;&#1604;" HeaderText="&#1578;&#1593;&#1583;&#1610;&#1604;" 
                CancelText="&#1573;&#1604;&#1594;&#1600;&#1575;&#1569;" UpdateText="&#1578;&#1593;&#1583;&#1610;&#1604;" />
            <asp:CommandField ShowDeleteButton="True" 
                DeleteImageUrl="~/Images/delete.png" DeleteText="&#1581;&#1584;&#1601;" HeaderText="&#1581;&#1584;&#1601;" />
        </Columns>
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" 
            HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" 
            ForeColor="#333333" />
        </asp:GridView>
    </div>

            </td>
        </tr>
        </table>