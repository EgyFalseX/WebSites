using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SelectMagazine : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RBtnView_Click(object sender, EventArgs e)
    {
        if (CBAll.Checked)
            Response.Redirect("Magazines.aspx?View=All");
        else
        {
            if (RCB.SelectedIndex <= 0)
                Response.Redirect("Magazines.aspx?View=" + RCB.SelectedValue);
        }
    }
}