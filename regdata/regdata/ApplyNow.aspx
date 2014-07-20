<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ApplyNow.aspx.cs" Inherits="ApplyNow" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function OnTabChanging(s, e) {
            var tabName = (pageControl.GetActiveTab()).name;
            e.cancel = !ASPxClientEdit.ValidateGroup('group' + tabName);
        }
        function OnButtonClick(s, e) {
            var indexTab = (pageControl.GetActiveTab()).index;
            pageControl.SetActiveTab(pageControl.GetTab(indexTab + 1));

        }
        function OnFinishClick(s, e) {
            if (ASPxClientEdit.ValidateGroup('groupTabOther')) {
                var str = '<b>Student Info:</b><br />' + txtFirstName.GetValue() + '<br />' + txtLastName.GetValue() + '<hr />';
                str += '<b>Date Info:</b><br />' + getShortDate(deAnyDate.GetValue().toString()) + '<br />' + cbStates.GetValue() + '<hr />';
                str += '<b>Contact Info:</b><br />' + txtEmail.GetValue() + '<br />' + txtZipcode.GetValue() + '<hr />';
                popupControl.SetContentHtml(str);
                popupControl.ShowAtElement(pageControl.GetMainElement());
                popupControl.UpdatePositionAtElement(pageControl.GetMainElement());//ShowTabs
            }
        }
        function getShortDate(longDate) {
            var date = new Date(longDate);
            var month = date.getMonth() + 1;
            var str = month.toString() + '/' + date.getDate().toString() + '/' + date.getFullYear().toString();
            return str;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <dx:ASPxCheckBox ID="showTabs" runat="server" AutoPostBack="True" Text="Show Tabs" OnCheckedChanged="showTabs_CheckedChanged" OnInit="showTabs_Init" CheckState="Unchecked" Visible="False">
        </dx:ASPxCheckBox><br />
        <dx:ASPxPageControl ID="pageControl" ClientInstanceName="pageControl" runat="server"
            ActiveTabIndex="0" EnableHierarchyRecreation="True" RenderMode="Lightweight">
            <ClientSideEvents ActiveTabChanging="OnTabChanging" />
            <TabPages>
                <dx:TabPage Name="TabStudent" Text="">
                    <TabImage Height="65px" Url="~/regdata/images/StudentInfoTab.png">
                    </TabImage>
                    <TabStyle Height="65px">
                    </TabStyle>
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl1" runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                                <Items>
                                    <dx:LayoutItem Caption="School Sector">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="cbSectorId" runat="server" AutoPostBack="True" DataSourceID="dsSectorId" TextField="Sector" ValueField="SectorId" Width="300px">
                                                    <Columns>
                                                        <dx:ListBoxColumn FieldName="Sector" Name="Sector" />
                                                    </Columns>
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="School Sector" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Grade Level">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="cbGradeId" runat="server" DataSourceID="dsGradeId" TextField="Grade" ValueField="GradeId" Width="300px">
                                                    <Columns>
                                                        <dx:ListBoxColumn FieldName="Grade" Name="Grade" />
                                                    </Columns>
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Grade Level" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Student Name">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="tbstudentname" runat="server" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Student Name" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Gender ">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxComboBox ID="cbGenderId" runat="server" DataSourceID="dsGenderId" TextField="Gender" ValueField="GenderId" Width="300px">
                                                    <Columns>
                                                        <dx:ListBoxColumn FieldName="Gender" Name="Gender" />
                                                    </Columns>
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Gender " />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Date Of Birth">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxDateEdit ID="deBirthdate" runat="server" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Date Of Birth" />
                                                    </ValidationSettings>
                                                </dx:ASPxDateEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Religion">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="tbReligion" runat="server" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Religion " />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Nationality">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="tbNationality" runat="server" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Nationality " />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Language most commonly spoken at home">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer8" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="tbLanguage" runat="server" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Language most commonly spoken at home" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Previous nursery/school attended">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer9" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="tbPreviousschool" runat="server" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Previous nursery/school attended" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Language of instruction">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer10" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="tbLanguageofInstruction" runat="server" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Language of instruction" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Present class level">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer11" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxTextBox ID="tbPresentClassLevel" runat="server" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Present class level" />
                                                    </ValidationSettings>
                                                </dx:ASPxTextBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Attendane from (YEAR)">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer12" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxSpinEdit ID="tbAttendaneFROMYEAR" runat="server" Height="21px" Number="0" Width="300px" MaxValue="2099" MinValue="1950">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Attendane from (YEAR)" />
                                                    </ValidationSettings>
                                                </dx:ASPxSpinEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Attendane to (YEAR)">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer13" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxSpinEdit ID="tbAttendaneTOYEAR" runat="server" Height="21px" Number="0" Width="300px" MaxValue="2099" MinValue="1950">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Attendane to (YEAR)" />
                                                    </ValidationSettings>
                                                </dx:ASPxSpinEdit>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Has the student ever skipped a year">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer14" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxCheckBox ID="ceskippedyear" runat="server" CheckState="Unchecked" Width="300px">
                                                    <ValidationSettings ValidationGroup="groupTabStudent">
                                                        <RequiredField IsRequired="True" ErrorText="Has the student ever skipped a year" />
                                                    </ValidationSettings>
                                                </dx:ASPxCheckBox>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer15" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxValidationSummary ID="ASPxFormLayout1_E15" runat="server" ValidationGroup="groupTabStudent">
                                                </dx:ASPxValidationSummary>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer16" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxButton ID="btnNextPersonal" runat="server" AutoPostBack="False" ClientInstanceName="btnNextPersonal" Text="Next" ValidationGroup="groupTabPersonal">
                                                    <ClientSideEvents Click="OnButtonClick" />
                                                </dx:ASPxButton>
                                                <asp:AccessDataSource ID="dsSectorId" runat="server" DataFile="~/App_Data/regdata.mdb" SelectCommand="SELECT [SectorId], [Sector] FROM [CdSector]"></asp:AccessDataSource>
                                                <asp:AccessDataSource ID="dsGradeId" runat="server" DataFile="~/App_Data/regdata.mdb" SelectCommand="SELECT [GradeId], [Grade], [SectorId] FROM [CdGrade] WHERE ([SectorId] = ?)">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="cbSectorId" DefaultValue="0" Name="SectorId" PropertyName="Value" Type="Byte" />
                                                    </SelectParameters>
                                                </asp:AccessDataSource>
                                                <asp:AccessDataSource ID="dsGenderId" runat="server" DataFile="~/App_Data/regdata.mdb" SelectCommand="SELECT [GenderId], [Gender] FROM [CdGender]"></asp:AccessDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:EmptyLayoutItem>
                                    </dx:EmptyLayoutItem>
                                </Items>
                                <SettingsItemCaptions VerticalAlign="Middle" />
                            </dx:ASPxFormLayout>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="TabParent" Text="">
                    <TabImage Height="65px" Url="~/regdata/images/ParentInfoTab.png">
                    </TabImage>
                    <TabStyle Height="65px">
                    </TabStyle>
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout3" runat="server">
                                <Items>
                                    <dx:LayoutGroup Caption="Father Info">
                                        <Items>
                                            <dx:LayoutItem Caption="Name (First, Family)">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer17" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbNameFather" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Name (First, Family) " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Nationality ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer18" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbFatherNationality" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Nationality " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Occupation ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer19" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbOccupation" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Occupation " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Home Address">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer20" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbHomeAddress" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Home Address" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Telephone Number">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer21" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbTelephone" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Telephone Number" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Mobile Number">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer22" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbMobile" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Mobile Number" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Email ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer23" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbEmail" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                <RequiredField ErrorText="Email " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="Mother Info">
                                        <Items>
                                            <dx:LayoutItem Caption="Name (First, Family)">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer24" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbNameMother" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Name (First, Family)" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Nationality ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer25" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbMotherNationality" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Nationality " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Occupation ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer26" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbMotherOccupation" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Occupation " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Home Address">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer27" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbMotherHomeAddress" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Home Address" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Telephone Number">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer28" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbMotherTelephone" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Telephone Number" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Mobile Number">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer29" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbMotherMobile" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Mobile Number" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Email ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer30" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbMotherEmail" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                <RequiredField ErrorText="Email " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Parental Marital Status">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer31" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxComboBox ID="cbMaritalStatusId" runat="server" DataSourceID="dsMaritalStatusId" TextField="MaritalStatus" ValueField="MaritalStatusId" Width="300px">
                                                            <Columns>
                                                                <dx:ListBoxColumn FieldName="MaritalStatus" Name="MaritalStatus" />
                                                            </Columns>
                                                            <ValidationSettings ValidationGroup="groupTabParent">
                                                                <RequiredField ErrorText="Parental Marital Status" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxComboBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer32" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxValidationSummary ID="ASPxFormLayout2_E17" runat="server" ValidationGroup="groupTabParent">
                                                </dx:ASPxValidationSummary>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer33" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxButton ID="btnNext" runat="server" AutoPostBack="False" ClientInstanceName="btnNextDate" Text="Next" ValidationGroup="groupTabParent">
                                                    <ClientSideEvents Click="OnButtonClick" />
                                                </dx:ASPxButton>
                                                <asp:AccessDataSource ID="dsMaritalStatusId" runat="server" DataFile="~/App_Data/regdata.mdb" SelectCommand="SELECT [MaritalStatusId], [MaritalStatus] FROM [CdMaritalStatus]"></asp:AccessDataSource>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:EmptyLayoutItem>
                                    </dx:EmptyLayoutItem>
                                </Items>
                            </dx:ASPxFormLayout>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="TabOther" Text="">
                    <TabImage Height="65px" Url="~/regdata/images/OtherTab.png">
                    </TabImage>
                    <TabStyle Height="65px">
                    </TabStyle>
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl3" runat="server">
                            <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server">
                                <Items>
                                    <dx:LayoutGroup Caption="Guardian Info">
                                        <Items>
                                            <dx:LayoutItem Caption="Name (First, Family)">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer34" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbNameGuard" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Name (First, Family)" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Nationality ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer35" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbGuardNationality" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Nationality " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Occupation ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer36" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbGuardrOccupation" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Occupation " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Home Address">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer37" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbGuardHomeAddress" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Home Address" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Telephone Number">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer38" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbGuardTelephone" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Telephone Number" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Mobile Number">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer39" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbGuardMobile" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Mobile Number" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Email ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer40" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbGuardEmail" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                <RequiredField ErrorText="Email " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutGroup Caption="In case of emergency please notify Info">
                                        <Items>
                                            <dx:LayoutItem Caption="Name (First, Family)">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer41" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbOtherGuard" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Name (First, Family)" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Nationality ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer42" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbOtheNationality" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Nationality " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Occupation ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer43" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbOtheOccupation" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Occupation " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Home Address">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer44" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbOtheHomeAddress" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Home Address" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Telephone Number">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer45" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbOtheTelephone" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Telephone Number " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Mobile Number">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer46" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbOtheMobile" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RequiredField ErrorText="Mobile Number" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                            <dx:LayoutItem Caption="Email ">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer47" runat="server" SupportsDisabledAttribute="True">
                                                        <dx:ASPxTextBox ID="tbOtheEmail" runat="server" Width="300px">
                                                            <ValidationSettings ValidationGroup="groupTabOther">
                                                                <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                <RequiredField ErrorText="Email " IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>
                                        </Items>
                                    </dx:LayoutGroup>
                                    <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer48" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxValidationSummary ID="ASPxFormLayout2_E16" runat="server" ValidationGroup="groupTabOther">
                                                </dx:ASPxValidationSummary>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                    <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                        <LayoutItemNestedControlCollection>
                                            <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer49" runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxButton ID="btnFinish" runat="server" Text="Finish" ValidationGroup="groupTabOther" OnClick="btnFinish_Click">
                                                </dx:ASPxButton>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>
                            </dx:ASPxFormLayout>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
            <TabImage Height="60px" Width="270px">
            </TabImage>
        </dx:ASPxPageControl>
    <dx:ASPxPopupControl ID="popupControl" runat="server" CloseAction="CloseButton" ClientInstanceName="popupControl"
        HeaderText="Summary" PopupHorizontalAlign="OutsideRight" PopupHorizontalOffset="10">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>

