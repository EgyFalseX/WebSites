<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TrainershowViewer.ascx.cs" Inherits="TrainershowViewer" %>

<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<style type="text/css">
    .style1
    {
        width: 297px;
    }
    .style2
    {
        text-align: center;
    }
</style>
<table align="center">
    <tr>
        <td style="text-align: center">
            <table class="style1">
                <tr>
                    <td style="direction: rtl">
                        <dx:ASPxComboBox ID="CBFilter" runat="server" 
                            CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                            DataSourceID="DScd_Trainer_type" Spacing="0" 
                            SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" TextField="Trainer_type" 
                            ValueField="Trainer_type_id">
                            <Columns>
                                <dx:ListBoxColumn Caption="اختار اسم" FieldName="Trainer_type" />
                            </Columns>
                            <ItemStyle HorizontalAlign="Center" />
                            <ListBoxStyle HorizontalAlign="Center">
                            </ListBoxStyle>
                            <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <LoadingPanelStyle ImageSpacing="5px">
                            </LoadingPanelStyle>
                            <ButtonStyle Width="13px">
                            </ButtonStyle>
                        </dx:ASPxComboBox>
                        <asp:AccessDataSource ID="DScd_Trainer_type" runat="server" 
                            DataFile="../App_Data/AATSWEB.mdb" 
                            SelectCommand="SELECT [Trainer_type_id], [Trainer_type] FROM [cd_Trainer_type]">
                        </asp:AccessDataSource>
                    </td>
                    <td style="direction: rtl">
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" 
                            Text="اختـــــــــار : ">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="direction: rtl">
                        <dx:ASPxCheckBox ID="CBSelectAll" runat="server" CheckState="Unchecked" 
                            CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                            SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Text="اختار الكــــل">
                        </dx:ASPxCheckBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="direction: rtl">
                        <dx:ASPxButton ID="BtnFilter" runat="server" 
                            CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                            onclick="BtnFilter_Click" 
                            SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Text="عـــــــــــرض" 
                            Width="120px">
                        </dx:ASPxButton>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
<dx:ASPxDataView ID="ASPxDataViewViewer" runat="server" 
    CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
    ItemSpacing="4px" PagerAlign="Justify" PagerPanelSpacing="2px" 
    SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" 
    style="text-align: center" DataSourceID="DSData">
    <ItemTemplate>
        <table cellspacing="0" class="rlvEditTable" dir="rtl" style="height: 292px;">
            <tr>
                <td bgcolor="Gray" class="style2" colspan="2" 
                    style="border: 10pt solid white; text-align: center">
                    <asp:Image ID="img" runat="server" BackColor="White" BorderColor="White" 
                        BorderWidth="2px" Height="150px" 
                        ImageUrl='<%# Eval("Trainepic", "../Files/{0}") %>' 
                        Width="150px" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style4" valign="top">
                    <asp:Label ID="cnameLabel2" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="الاسم:"></asp:Label>
                </td>
                <td class="style2" valign="top">
                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("TrainerName") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style4" valign="top">
                    <asp:Label ID="cityLabel2" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="الاســـــــره"></asp:Label>
                </td>
                <td class="style2" valign="top">
                    <asp:Label ID="lblTrainer_type" runat="server" Text='<%# Eval("Trainer_type") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style4" valign="top">
                    <asp:Label ID="tatLabel2" runat="server" Font-Bold="True" ForeColor="Blue" 
                        Text="التخصص : "></asp:Label>
                </td>
                <td class="style2" valign="top">
                    <asp:Label ID="lbltel" runat="server" Text='<%# Eval("tat") %>'></asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    <PagerSettings SEOFriendly="CrawlerOnly">
        <Summary AllPagesText="كل الصفحات" Text="صفحه {0} من {1}" />
    </PagerSettings>
    <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
    </LoadingPanelImage>
    <LoadingPanelStyle ImageSpacing="5px">
    </LoadingPanelStyle>
    <EmptyDataTemplate>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="X-Large" 
            Text="لا يوجد بيانات">
        </dx:ASPxLabel>
    </EmptyDataTemplate>
    <DisabledStyle ForeColor="#B1B1B8">
    </DisabledStyle>
</dx:ASPxDataView>

            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="../App_Data/AATSWEB.mdb" onselecting="DSData_Selecting" 
                SelectCommand="SELECT id, TrainerName, 
(Select Trainer_type From cd_Trainer_type Where Trainer_type_id = Trainer_show.Trainer_type_id) AS Trainer_type, 
tat, Trainepic, Trainer_type_id FROM Trainer_show WHERE (viewpage = true)">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>


