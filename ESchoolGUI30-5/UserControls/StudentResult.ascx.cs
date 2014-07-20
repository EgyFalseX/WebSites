using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
public partial class UserControls_StudentResult : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        fillGrid();
    }
    public void fillGrid()
    {
        int y = 0;
        if (Request.QueryString["Term"] != null)
        {
            int.TryParse(Request.QueryString["Term"].ToString(), out y);
        }
        if (y == 1)
        {
            GridView1.DataSource = new Students.Resultrs().FirstTerm();
            
        }
        else if (y == 2)
        {
            GridView1.DataSource = new Students.Resultrs().SecondTerm();
        }
        else if (y == 3)
        {
            GridView1.DataSource = new Students.Resultrs().MonthsResult();
        }
        GridView1.DataBind();
 
    }
    enum Stages
    {
        Primary1,
        Primary2,
        Secondary
    }
}

