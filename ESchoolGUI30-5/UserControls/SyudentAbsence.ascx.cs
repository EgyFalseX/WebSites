using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_SyudentAbsence : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Students st = new Students ();
        GridView1.DataSource = st.AbcenceYears();
        GridView1.DataBind();
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        
        Codes cd = new Codes();
        (sender as Label).Text = cd.YearName(Convert.ToInt32((sender as Label).Text));
        
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GridView gd = e.Row.FindControl("GridView2") as GridView;
            Students st = new Students();
            gd.DataSource = st.StudentAbcence(Convert.ToInt32((e.Row.FindControl("Label1") as Label).AccessKey));
            gd.DataBind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Label1_DataBinding1(object sender, EventArgs e)
    {
        Codes cd = new Codes();
        (sender as Label).Text = cd.AbcenceName(Convert.ToInt32((sender as Label).Text));
    }
}
