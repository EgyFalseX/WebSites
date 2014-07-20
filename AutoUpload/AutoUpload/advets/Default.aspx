<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
            <td class="auto-style1" style="border-style: solid; border-color: #FF0000">

                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="Selecttbladv.aspx">تعديل الفعاليات</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="border-style: solid; border-color: #FF0000">

                <asp:HyperLink ID="HyperLink15" runat="server" 
                    NavigateUrl="tbladvEditor.aspx">اضافة فعاليات</asp:HyperLink>

            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="border-style: solid; border-color: #FF0000">

                <asp:HyperLink ID="HyperLink16" runat="server" 
                    NavigateUrl="tbladvViewer.aspx">عرض الفعاليات</asp:HyperLink>

            </td>
        </tr>
        </table>

</div>
</asp:Content>

