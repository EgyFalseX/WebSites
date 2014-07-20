using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SchoolInBrief : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnMain_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://moderninfinityschool.com");
    }
}
