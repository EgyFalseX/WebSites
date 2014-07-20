using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_STudentHomeWorkDetails : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void FillDetails(int id, bool SpecialHomeWork)
    {
        DetailsView1.DataSource = new Students().HomeWorkDetails(id, SpecialHomeWork);
        DetailsView1.DataBind();
    }
}
