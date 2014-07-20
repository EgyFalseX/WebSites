using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Downloader : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            RepeaterMain.DataSource = Main.LoadTable(@"Select LinkID, LinkName, LinkURL, '../DownloadFiles/' + LinkURL AS LinkURL2, UpdateDate From Downloads");
            RepeaterMain.DataBind();
        }
    }
}