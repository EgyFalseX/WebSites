using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class UserControls_StudentCourses : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
      

        if (!IsPostBack)
        {
            fillDrop();
            fillGrid();
        }
    }

    private void fillDrop()
    {
        DropDownList1.DataSource = new Codes().GetDays();
        DropDownList1.DataTextField = "dayname";
        DropDownList1.DataValueField = "daycode";
        DropDownList1.DataBind();
    }

    private void fillGrid()
    {
        GridView1.CellSpacing = 2;
        GridView1.BorderStyle = BorderStyle.Groove;
        GridView1.BorderWidth = 10;
        GridView1.BorderColor = Color.Turquoise;
        GridView1.DataSource = new Students().mySubjects(8);
        GridView1.DataBind();
    }
    private void fillGrid(int Day)
    {
        GridView1.CellSpacing = 2;
        GridView1.BorderStyle = BorderStyle.Groove;
        GridView1.BorderWidth = 10;
        GridView1.BorderColor = Color.Turquoise;
        GridView1.DataSource = new Students().mySubjects(8,Day);
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[0].BackColor = Color.GreenYellow;
        e.Row.Cells[0].Font.Bold = true; ;
        e.Row.BorderWidth = 15;
        e.Row.BackColor = Color.Yellow;
        e.Row.BorderColor = Color.Blue;
        e.Row.BorderStyle = BorderStyle.Groove;
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.BackColor = Color.Green;
        }
        
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            DropDownList1.Visible = true;
            fillGrid(Convert.ToInt32(DropDownList1.SelectedValue));
        }
        else
        {
            DropDownList1.Visible = false;
            fillGrid();
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            DropDownList1.Visible = true;
            fillGrid(Convert.ToInt32(DropDownList1.SelectedValue));
        }
        else
        {
            DropDownList1.Visible = false;
            fillGrid();
        }
    }
}

