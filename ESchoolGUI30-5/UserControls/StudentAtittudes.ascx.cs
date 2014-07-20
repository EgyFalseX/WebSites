using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_StudentAtittudes : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Students st = new Students ();
        GridView1.DataSource = st.StudentAttitudes();
        GridView1.DataBind();
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.YearName(Convert.ToInt32((sender as Label).Text));
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Label2_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.AttitudeName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label3_DataBinding(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.AttitudeType(Convert.ToInt32((sender as Label).Text));
    }
}
