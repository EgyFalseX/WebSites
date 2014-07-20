using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_StudentAcountant : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DetailsView1.DataSource = new Students().StudentAcountant();
        DetailsView1.DataBind();
    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}
