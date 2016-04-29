<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CPSliderUserControl.ascx.cs" Inherits="CPSliderUserControl" %>
<%@ Register src="UploadImageUserControl.ascx" tagname="UploadImageUserControl" tagprefix="uc1" %>
<p>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"  EnablePartialRendering="true">
    </asp:ScriptManager>
</p>

<link href="/Styles/jquery-ui.css" rel="stylesheet" />
<script src="/Scripts/jquery-1.7.1.min.js"></script>
<script src="/Scripts/jquery-ui.js"></script>

 <script type="text/javascript">
     function Confirm() {
         var hidden = document.getElementById("<%=HiddenField1.ClientID %>");
            if (confirm("هل أنت متأكد من الحذف")) {
                hidden.value = "ok";
            }
            else {
                hidden.value = "cancel";
            }
         
            PageMethods.CallFunction();
        }
    </script>



<asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
    <EditItemTemplate>
        ID:
        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
        <br />
        TitleAr:
        <asp:TextBox ID="TitleArTextBox" runat="server" Text='<%# Bind("TitleAr") %>' />
        <br />
        TitleEn:
        <asp:TextBox ID="TitleEnTextBox" runat="server" Text='<%# Bind("TitleEn") %>' />
        <br />
        EventArDetails:
        <asp:TextBox ID="EventArDetailsTextBox" runat="server" Text='<%# Bind("EventArDetails") %>' />
        <br />
        EventEnDetails:
        <asp:TextBox ID="EventEnDetailsTextBox" runat="server" Text='<%# Bind("EventEnDetails") %>' />
        <br />
        EventDate:
        <asp:TextBox ID="EventDateTextBox" runat="server" Text='<%# Bind("EventDate") %>' />
        <br />
        EventImage:
        <asp:TextBox ID="EventImageTextBox" runat="server" Text='<%# Bind("EventImage") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        &nbsp;<table dir="rtl">
            <tr>
                <td>العنوان عربي:</td>
                <td>
                    <asp:TextBox ID="TitleArTextBox" runat="server" Text='<%# Bind("Caption") %>' Width="450px" />
                </td>
            </tr>
            <tr>
                <td>العنوان إنجليزي:</td>
                <td>
                    <asp:TextBox ID="EventEnDetailsTextBox" runat="server" Text='<%# Bind("Captione") %>' Width="450px" />
                </td>
            </tr>
            <tr>
                <td>ظهور الصفحة:</td>
                <td>
                    <asp:CheckBox ID="displayCheckBox" runat="server" Checked='<%# Bind("viewpage") %>' />
                </td>
            </tr>
            <tr>
                <td>صور:</td>
                <td>
                    <asp:TextBox ID="EventImageTextBox" runat="server" Text='<%# Bind("ImageLink") %>' Visible="False" />
                    <uc1:UploadImageUserControl ID="UploadImageUserControl1" runat="server" />
                </td>
            </tr>
        </table>
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="حفظ" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="تراجع" />
    </InsertItemTemplate>
    <ItemTemplate>
        TitleAr:
        <asp:Label ID="TitleArLabel" runat="server" Text='<%# Bind("TitleAr") %>' />
        <br />
        TitleEn:
        <asp:Label ID="TitleEnLabel" runat="server" Text='<%# Bind("TitleEn") %>' />
        <br />
        EventArDetails:
        <asp:Label ID="EventArDetailsLabel" runat="server" Text='<%# Bind("EventArDetails") %>' />
        <br />
        EventEnDetails:
        <asp:Label ID="EventEnDetailsLabel" runat="server" Text='<%# Bind("EventEnDetails") %>' />
        <br />
        EventDate:
        <asp:Label ID="EventDateLabel" runat="server" Text='<%# Bind("EventDate") %>' />
        <br />
        EventImage:
        <asp:Label ID="EventImageLabel" runat="server" Text='<%# Bind("EventImage") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
    </ItemTemplate>
</asp:FormView>
<p>
    <asp:Label ID="msgLabel" runat="server" Font-Bold="True" ForeColor="#009933"></asp:Label>
</p>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\Rotarordata.mdb;Persist Security Info=True" DeleteCommand="DELETE FROM [RotatorData] WHERE [ID] = ?" InsertCommand="INSERT INTO RotatorData(Caption, ImageLink, viewpage, Captione) VALUES (?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [RotatorData]" UpdateCommand="UPDATE RotatorData SET Caption = ?, ImageLink = ?, viewpage = ?, Captione = ? WHERE (ID = ?)" OnInserted="SqlDataSource1_Inserted">
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Byte" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Caption" Type="String" />
        <asp:Parameter Name="ImageLink" Type="String" />
        <asp:Parameter Name="viewpage" Type="Boolean" />
        <asp:Parameter Name="Captione" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Caption" Type="String" />
        <asp:Parameter Name="ImageLink" Type="String" />
        <asp:Parameter Name="viewpage" Type="Boolean" />
        <asp:Parameter Name="Captione" Type="String" />
        <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>


<asp:HiddenField ID="HiddenField1" runat="server" />



<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True">
    <Columns>
        <asp:BoundField DataField="ID" ReadOnly="True" ShowHeader="False" />
        <asp:TemplateField HeaderText="العنوان عربي" SortExpression="Caption">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Caption") %>' Width="350px"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Caption") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="هل تظهر" SortExpression="viewpage">
            <EditItemTemplate>
                <asp:CheckBox ID="displayCheckBox" runat="server" Checked='<%# Bind("viewpage") %>' />
            </EditItemTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="displayCheckBox" runat="server" Checked='<%# Eval("viewpage") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="العنوان إنجليزي" SortExpression="Captione">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Captione") %>' Width="350px"></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Captione") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="الصورة" SortExpression="ImageLink">
            <EditItemTemplate>
                 <%-- <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ImageLink") %>'></asp:TextBox>--%>
                                    <asp:TextBox ID="EventImageTextBox" runat="server" Text='<%# Bind("ImageLink") %>' Visible="False" />
                    <uc1:UploadImageUserControl ID="UploadImageUserControl1" runat="server" MFileSize="200000" PathID="2" SetImageHeight="380" SetImageWidth="980" />
<%--                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Caption") %>'></asp:TextBox>

                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Captione") %>'></asp:TextBox>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ImageLink") %>'></asp:TextBox>
                <asp:CheckBox ID="displayCheckBox" runat="server" Checked='<%# Bind("viewpage") %>' />--%>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# "~/"+Eval("ImageLink") %>' Width="110px" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField SelectText="التفاصيل" ShowSelectButton="True" />
                <asp:CommandField CancelText="تراجع" EditText="تعديل" ShowEditButton="True" UpdateText="حفظ" />

        <asp:ButtonField CommandName="DeleteCommand" Text="حذف" />
    </Columns>
</asp:GridView>






