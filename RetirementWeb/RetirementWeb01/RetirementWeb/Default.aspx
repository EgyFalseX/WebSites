﻿<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<div>
                
    <table align="center" class="style1">
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="tblmember.aspx">بيانات الاعضاء </asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink8" runat="server" 
                    NavigateUrl="tblpic.aspx">مرفقات الرقم القومي</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink9" runat="server" 
                    NavigateUrl="tblwarasa.aspx">بيانات الورثة</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink10" runat="server" 
                    NavigateUrl="filepathViewer.aspx">مسارات المرفقات</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">

                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">

                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="ViewChanges.aspx">التعديلات في تاريخ</asp:HyperLink>

            </td>
        </tr>
        </table>

</div>
</asp:Content>

