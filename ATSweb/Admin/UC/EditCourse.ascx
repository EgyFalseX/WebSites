<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditCourse.ascx.cs" Inherits="EditCourse" %>
<style type="text/css">
    .style1
    {
        width: 600px;
        height: 200px;
    }
    .style2
    {
        width: 144px;
    }
    .style3
    {
        width: 144px;
        height: 36px;
    }
    .style4
    {
        height: 36px;
    }
</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Label ID="Label16" runat="server" Font-Size="18pt" 
                    Text="الدورات التدريبيه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="Gray" colspan="2" style="text-align: center">
                <asp:Label ID="Label1" runat="server" style="font-size: x-large" 
                    Text="ادخال دوره تدريبيه" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="اسم الدوره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAdd" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <asp:Label ID="Label6" runat="server" Text="مسار الصوره"></asp:Label>
            </td>
            <td>
                <telerik:RadProgressManager ID="RProgressManager" Runat="server" />
                <telerik:RadAsyncUpload ID="RAsyncUploadAdd" runat="server" InputSize="10" 
                    MaxFileInputsCount="1" MaxFileSize="1048576">
                    <Localization Cancel="الغاء" Remove="حذف" Select="اختار صوره" />
                </telerik:RadAsyncUpload>
                <telerik:RadProgressArea ID="RProgressArea" Runat="server" 
                    HeaderText="ارسال الصوره">
                <Localization Uploaded="تم الارسال" Cancel="الغاء" CurrentFileName="ارسال ملف:" 
                        ElapsedTime="الوقت:" EstimatedTime="الوقت المتبقي:" Total="ج" 
                        TotalFiles="اجمالي الملفات:" TransferSpeed=":" UploadedFiles="الملفات المرسله:"></Localization>
                </telerik:RadProgressArea>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label7" runat="server" Text="معلومه مختصره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtAddInfo" runat="server" Width="300px" Height="90px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label10" runat="server" Text="تاريخ البدايه"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="RDPStartDateAdd" Runat="server" Culture="en-US" 
                    Width="200px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label11" runat="server" Text="تاريخ النهايه"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="RDPEndDateAdd" Runat="server" Culture="en-US" 
                    Width="200px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label12" runat="server" Text="سعر الدوره"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="RNTxtPriceAdd" Runat="server" Width="200px">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label17" runat="server" Text="يعرض"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="CBShowOnlineAdd" runat="server" Text="يعرض" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:ImageButton ID="IBAdd" runat="server" Height="32px" 
                    ImageUrl="../images/add.png" onclick="IBAdd_Click" ToolTip="ادخال" 
                    Width="32px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="Gray" colspan="2" style="text-align: center">
                <asp:Label ID="Label3" runat="server" style="font-size: x-large" 
                    Text="عرض/تعديل الدورات التدريبيه" ForeColor="White"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label4" runat="server" Text="اختار دوره للتعديل"></asp:Label>
            </td>
            <td class="style4">
                <asp:DropDownList ID="DDLItems" runat="server" DataTextField="CourseName" 
                    DataValueField="CourseId" Width="300px" AutoPostBack="True" 
                    onselectedindexchanged="DDLItems_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:ImageButton ID="IBDelete" runat="server" Height="32px" 
                    ImageUrl="../images/delete.png"
                    onclientclick="javascript: return confirm('هل انت متاكد ؟')"
                    onclick="IBDelete_Click" ToolTip="حذف" 
                    Width="32px" />
                <br />
                <asp:HyperLink ID="HLDetails" runat="server" Font-Bold="True" ForeColor="Blue" 
                    NavigateUrl="../EditCourse.aspx">عرض التفاصيل</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="اسم الدوره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEdit" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2" valign="top">
                <asp:Label ID="Label8" runat="server" Text="مسار الصوره"></asp:Label>
            </td>
            <td>
                <asp:Image ID="ImgEdit" runat="server" Height="64px" Width="64px" />
                <telerik:RadAsyncUpload ID="RAsyncUploadEdit" runat="server" InputSize="10" 
                    MaxFileInputsCount="1" MaxFileSize="1048576">
                    <Localization Cancel="الغاء" Remove="حذف" Select="اختار صوره" />
                </telerik:RadAsyncUpload>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label9" runat="server" Text="معلومه مختصره"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtEditInfo" runat="server" Width="300px" Height="90px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label13" runat="server" Text="تاريخ البدايه"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="RDPStartDateEdit" Runat="server" Culture="en-US" 
                    Width="200px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label14" runat="server" Text="تاريخ النهايه"></asp:Label>
            </td>
            <td>
                <telerik:RadDatePicker ID="RDPEndDateEdit" Runat="server" Culture="en-US" 
                    Width="200px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label15" runat="server" Text="سعر الدوره"></asp:Label>
            </td>
            <td>
                <telerik:RadNumericTextBox ID="RNTxtPriceEdit" Runat="server" Width="200px">
                </telerik:RadNumericTextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style2">
                <asp:Label ID="Label18" runat="server" Text="يعرض"></asp:Label>
            </td>
            <td>
                <asp:CheckBox ID="CBShowOnlineEdit" runat="server" Text="يعرض" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:ImageButton ID="IBEdit" runat="server" Height="32px" 
                    ImageUrl="../images/edit.png" onclick="IBEdit_Click" ToolTip="تعديل" 
                    Width="32px" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblMsg" runat="server" style="font-size: x-large"></asp:Label>
            </td>
        </tr>
    </table>
</div>