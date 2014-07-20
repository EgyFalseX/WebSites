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

public partial class UserControls_TrainingPrograms : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee EMP = new Employee();
        GridView1.DataSource = EMP.TrainingProgramms();
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void lbl_ProgName_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.ProgramName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_Takder_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.TakderName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_TPlace_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.PlaceName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lbl_TYear_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
    //  (sender as Label).Text = TC.YearName(Convert.ToInt32((sender as Label).Text));
    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {
            HiddenField hd = (HiddenField)gr.FindControl("HiddenField1");
            Codes c = new Codes();

            Label l = (Label)gr.FindControl("Label1");
            l.Text = c.YearName(Convert.ToInt32(hd.Value));

        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}
