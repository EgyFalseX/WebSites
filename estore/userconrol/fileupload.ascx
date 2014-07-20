<%@ Control Language="C#" AutoEventWireup="true" CodeFile="fileupload.ascx.cs" Inherits="fileupload" %>

<style type="text/css">

html

{



font: 14px Georgia,Serif,Garamond;

}

h1

{

color: Green;

font-size: 18px;

border-bottom: Solid 1px orange;

}

.clear

{

clear: both;

}

.lbl

{

color: green;

font-weight: bold;

}

.upperColumn

{

margin: auto;

width: 600px;

border-bottom: Solid 1px orange;

background-color: white;

padding: 10px;

}

.bottomColumn

{

margin: auto;

width: 600px;

background-color: white;

padding: 10px;

}

    .style1
    {
        width: 49%;
    }

</style>
<script language="javascript" type="text/javascript">

    var size = 2;

    var id = 0;


    function ProgressBar() {

        if (document.getElementById('<%=FileUpload1.ClientID %>').value != "") {

            document.getElementById("<%=divProgress.ClientID%>").style.display = "block";

            document.getElementById("divUpload").style.display = "block";

            id = setInterval("progress()", 20);

            return true;

        }

        else {

            alert("Select a file to upload");

            return false;

        }


    }

    function progress() {

        size = size + 1;

        if (size > 299) {

            clearTimeout(id);

        }

        document.getElementById("<%=divProgress.ClientID%>").style.width = size + "pt";

        document.getElementById("<%=lblPercentage.ClientID %>").firstChild.data = parseInt(size / 3) + "%";

    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">









<body>







    <table class="style1">
        <tr>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="FileUpload1" Display="Dynamic" 
                    ErrorMessage="يجب مراعاة نوع المرفق" 
                    ValidationExpression=".*(\.txt|\.TXT|\.doc|\.DOC|\.docx|\.DOCX|\.rtf|\.RTF|\.pdf|\.PDF|\.jpeg|\.JPEG|\.jpg|\.JPG|\.jpe|\.JPE|\.png|\.PNG|\.tiff|\.TIFF|\.gif|\.GIF|\.bmp|\.BMP)$" 
                    ValidationGroup="FileUplode"></asp:RegularExpressionValidator>
            </td>
            <td>



<asp:FileUpload ID="FileUpload1" runat="server" />

            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>

<asp:Button ID="btnAddImage" runat="server" Text="Upload" OnClientClick="return ProgressBar()"

OnClick="btnAddImage_Click" Visible="False" />

            </td>
        </tr>
        <tr>
            <td colspan="2"><div id="divUpload" style="display: none">

<div style="width: 300pt; text-align: center;">

Uploading...</div>

<div style="width: 300pt; height: 20px; border: solid 1pt gray">

<div id="divProgress" runat="server" style="width: 1pt; height: 20px; background-color:Blue; display: none">

</div>

</div>

<div style="width: 300pt; text-align: center;">

<asp:Label ID="lblPercentage" runat="server" Text="Label"></asp:Label></div>

<br />

<asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>

</div>
                &nbsp;</td>
        </tr>
    </table>



</body>

</html>

