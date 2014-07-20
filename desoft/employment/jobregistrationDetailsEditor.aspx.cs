using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class jobregistrationDetailsEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["uIDJob"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
    }
}