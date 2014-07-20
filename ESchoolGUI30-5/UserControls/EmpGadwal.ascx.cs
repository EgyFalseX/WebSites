using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

public partial class UserControls_EmpGadwal : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (! Page.IsPostBack)
        {
            GridView1.DataSource = new Employee().EmpGadwal(8);
            GridView1.DataBind();
            GridView1.CellSpacing = 2;
            GridView1.BorderStyle = BorderStyle.Groove;
            GridView1.BorderWidth = 10;
            GridView1.BorderColor = Color.Turquoise;
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            foreach (TableCell cell in e.Row.Cells)
            {
                cell.Text = Server.HtmlDecode(cell.Text);
            }
        }
        e.Row.Cells[0].BackColor = Color.Green;
        e.Row.Cells[0].Font.Bold = true;
        e.Row.Cells[0].ForeColor = Color.White;
        e.Row.Cells[0].Font.Size = 10;
        e.Row.Cells[1].BackColor = Color.GreenYellow;
        e.Row.Cells[1].Font.Bold = true;
        e.Row.Cells[1].ForeColor = Color.DarkRed;
        e.Row.Cells[1].Font.Size = 10;
        e.Row.BorderWidth = 10;
        e.Row.BackColor = Color.LightYellow;
        e.Row.BorderColor = Color.Blue;
        e.Row.Font.Size=8;
        e.Row.Font.Bold = true;
        e.Row.BorderStyle = BorderStyle.Groove;
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.BackColor = Color.GreenYellow;
            e.Row.ForeColor = Color.DarkRed;
            e.Row.Font.Size = 10;
        }
    }
}
