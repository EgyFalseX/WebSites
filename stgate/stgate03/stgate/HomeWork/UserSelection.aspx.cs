using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserSelection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cbadd_date_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cbadd_date.SelectedIndex < 0)
            return;
        Response.Redirect("ViewDetails.aspx?id=" + cbadd_date.Value);
    }
}