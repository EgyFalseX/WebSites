using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using Functions;
using System.IO;
using System.Collections.Generic;
using System.Windows.Forms;


public partial class _GetFiles_ : System.Web.UI.UserControl
{
    public static string Pagez()
    {
        
        
        string ReturnMe = string.Empty;
        string[] AllFiles = Directory.GetFiles(HttpContext.Current.Server.MapPath("~/"));
        OpenFileDialog OFD = new OpenFileDialog();
        foreach (string item in AllFiles)
        {
            OFD.FileName = item;
            if (item.EndsWith(".aspx"))
            {
                //ReturnMe += string.Format("<asp:HyperLink ID=\"HyperLink{0}\" runat=\"server\" NavigateUrl=\"~/{1}\">LINK</asp:HyperLink> <br />", LinkNo, OFD.SafeFileName);
                ReturnMe += string.Format("<a href=\"{0}\" style=\"color: #000000\">{1}</a>  <br />", OFD.SafeFileName, OFD.SafeFileName.Substring(0, OFD.SafeFileName.Length - 5));
            }
        }
        return ReturnMe;

    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}