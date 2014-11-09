<%@ Page Title="" Language="C#" MasterPageFile="~/frsan/masteruser.master" AutoEventWireup="true" CodeFile="CommentEditor.aspx.cs" Inherits="CommentEditor" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRatingControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1" dir="rtl">
        <tr>
            <td style="text-align: center">
                <dx:ASPxValidationSummary ID="ASPxValidationSummary1" runat="server" ShowErrorsInEditors="True" Theme="iOS" ValidationGroup="vg" Visible="False">
                </dx:ASPxValidationSummary>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxMemo ID="txt" runat="server" Height="100px" Theme="iOS" Width="500px">
                    <ValidationSettings ErrorTextPosition="Bottom" SetFocusOnError="True" ValidationGroup="vg">
                        <RequiredField ErrorText="يجب ادخال تعليق" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxRatingControl ID="RatingControl" runat="server" FillPrecision="Exact" Theme="Default" Titles="هل اعجبك" Value="0" RightToLeft="True">
                </dx:ASPxRatingControl>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ التعليق" Theme="iOS" ValidationGroup="vg">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="lblState" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

