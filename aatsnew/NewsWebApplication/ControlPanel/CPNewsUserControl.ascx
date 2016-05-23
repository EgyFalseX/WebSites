<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CPNewsUserControl.ascx.cs" Inherits="CPNewsUserControl" %>
<%@ Register src="UploadImageUserControl1.ascx" tagname="UploadImageUserControl" tagprefix="uc1" %>


<link href="/Styles/jquery-ui.css" rel="stylesheet" />
<script src="/Scripts/jquery-1.7.1.min.js"></script>
<script src="/Scripts/jquery-ui.js"></script>

 <script>

     (function () {

         $("#DateTextBox").datepicker();
     });
  </script>

<asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource2" DefaultMode="Insert">
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
                <td>عنوان الخبر عربي:</td>
                <td>
                    <asp:TextBox ID="TitleArTextBox" runat="server" Text='<%# Bind("TitleAr") %>' ValidationGroup="VG" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TitleArTextBox" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="VG"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>عنوان الخبر إنجليزي:</td>
                <td>
                    <asp:TextBox ID="TitleEnTextBox" runat="server" Text='<%# Bind("TitleEn") %>' />
                </td>
            </tr>
            <tr>
                <td>تفاصيل الخبر عربي: </td>
                <td>
                    <asp:TextBox ID="EventArDetailsTextBox" runat="server" Text='<%# Bind("EventArDetails") %>' />
                </td>
            </tr>
            <tr>
                <td>تفاصيل الخبر إنجليزي:</td>
                <td>
                    <asp:TextBox ID="EventEnDetailsTextBox" runat="server" Text='<%# Bind("EventEnDetails") %>' />
                </td>
            </tr>
            <tr>
                <td>تاريخ الخبر:</td>
                <td>
                    <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("EventDate") %>' ClientIDMode="Static" />
                </td>
            </tr>
            <tr>
                <td>صور:</td>
                <td>
                    <asp:TextBox ID="EventImageTextBox" runat="server" Text='<%# Bind("EventImage") %>' Visible="False" />
                    <uc1:UploadImageUserControl ID="UploadImageUserControl1" runat="server" />
                </td>
            </tr>
        </table>
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="حفظ" ValidationGroup="VG" />
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
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\News.mdb;Persist Security Info=True" DeleteCommand="DELETE FROM NewsData WHERE (ID = ?)" InsertCommand="INSERT INTO NewsData(TitleAr, TitleEn, EventArDetails, EventEnDetails, EventDate, EventImage) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [NewsData]" UpdateCommand="UPDATE NewsData SET TitleAr = ?, TitleEn = ?, EventArDetails = ?, EventEnDetails = ?, EventDate = ?, EventImage = ? WHERE (ID = ?) OR (ID IS NULL) AND (? IS NULL)" OnInserted="SqlDataSource2_Inserted">
    <DeleteParameters>
        <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:FormParameter Name="TitleAr" Type="String" />
        <asp:Parameter Name="TitleEn" Type="String" />
        <asp:Parameter Name="EventArDetails" Type="String" />
        <asp:Parameter Name="EventEnDetails" Type="String" />
        <asp:Parameter Name="EventDate" Type="String" />
        <asp:Parameter Name="EventImage" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="TitleAr" Type="String" />
        <asp:Parameter Name="TitleEn" Type="String" />
        <asp:Parameter Name="EventArDetails" Type="String" />
        <asp:Parameter Name="EventEnDetails" Type="String" />
        <asp:Parameter Name="EventDate" Type="DateTime" />
        <asp:Parameter Name="EventImage" Type="String" />
        <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <%--<asp:ButtonField CommandName="DeleteCommand" Text="حذف" />--%>
        <asp:BoundField DataField="TitleAr" HeaderText="عنوان عربي" SortExpression="TitleAr" />
        <asp:BoundField DataField="TitleEn" HeaderText="عنوان إنجليزي" SortExpression="TitleEn" />
        <asp:BoundField DataField="EventArDetails" HeaderText="تفاصيل الخبر عربي" SortExpression="EventArDetails" />
        <asp:BoundField DataField="EventEnDetails" HeaderText="تفاصيل الخبر إنجليزي" SortExpression="EventEnDetails" />
        <asp:TemplateField HeaderText="التاريخ" SortExpression="EventDate">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EventDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("EventDate","{0:yyyy/MM/dd}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="التفاصيل">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink2" runat="server" Text="التفاصيل"  NavigateUrl='<%# Eval("ID", "CreatePages.aspx?ID={0}") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="الصورة" SortExpression="EventImage">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventImage") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" Height="150px" ImageUrl='<%# "~/"+Eval("EventImage") %>' Width="200px" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField DeleteText="حذف" HeaderText="حذف" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>


