using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_stPayments : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.DataSource = new Students().Payments();
        GridView1.DataBind();
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().PaymentType(Convert.ToInt32((sender as Label).Text));
    }
}
