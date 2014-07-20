using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SelectLagna : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (!IsNullOrEmpty(DDLLagna.SelectedItem))
        {
            Response.Redirect("snews.aspx?LagnaID=" + DDLLagna.SelectedValue);
        }
    }
    public static bool IsNullOrEmpty(object obj)
    {
        if (obj == null)
            return true;

        if (obj.ToString() == string.Empty)
            return true;
        else
            return false;
    }
}