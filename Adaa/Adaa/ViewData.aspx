<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewData.aspx.cs" Inherits="Adaa_ViewData" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</head>
<body style="direction: rtl">
    <form id="form1" runat="server">
        <div>

            <table align="center" class="auto-style1">
                <tr>
                    <td>

            <dx:ASPxHtmlEditor runat="server" ClientInstanceName="HtmlEditorViewer" ActiveView="Preview" ID="ASPxHtmlEditorViewer">
                <Settings AllowDesignView="False" AllowHtmlView="False"></Settings>
            </dx:ASPxHtmlEditor>

                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
