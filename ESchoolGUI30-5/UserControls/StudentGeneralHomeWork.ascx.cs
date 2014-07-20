using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_StudentGeneralHomeWork : System.Web.UI.UserControl
{
    public delegate void del(int id,bool SpecialHomeWork);
    public event del ev;
    protected void Page_Load(object sender, EventArgs e)
    {

        fillGrid();
    
    }

    public void fillGrid()
    {
        if (!SpecialHomeWork)
        {
            grdGeneralHomeWork.DataSource = new Students().HomeWork(null);
            grdGeneralHomeWork.DataBind();
        }
        else
        {
            grdMyHomeWork.DataSource = new Students().MyHomeWork(null);
            grdMyHomeWork.DataBind();
        }
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().DayName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label2_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().SessionName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label3_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().SubjectName(Convert.ToInt32((sender as Label).Text));
    }
    protected void Label4_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Employee().GetEmpFullhName(Convert.ToInt32((sender as Label).Text));
    }
    protected void LinkButton1_DataBinding(object sender, EventArgs e)
    {
        (sender as LinkButton).Text = new Codes().ReadStatus(Convert.ToInt32((sender as LinkButton).Text));
    }
    private bool spw;
    public bool SpecialHomeWork { get { return spw; } set { spw = value; } }
    protected void grdGeneralHomeWork_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        ev(Convert.ToInt32((sender as LinkButton).CommandArgument), true);
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        ev(Convert.ToInt32((sender as LinkButton).CommandArgument), false);
    }
}
