using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class UserControls_StudentMedicalHistory : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    { 
        Employee Emp= new Employee ();
        DataTable dt = Emp.Hierarchy();
        if (dt.Rows.Count != 0)
        {
            GridView1.DataSource = Emp.Hierarchy();
            GridView1.DataBind();
            
        }
        else
        {
            dt.Rows.Add(dt.NewRow());
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.Rows[0].Visible = false;
       
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
    protected void lbl_Wazefa_DataBinding(object sender, EventArgs e)
    {
        //Codes TC = new Codes();
        //(sender as Label).Text = TC.WazefaName(Convert.ToInt32((sender as Label).Text));
    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        //foreach (GridViewRow gr in GridView1.Rows)
        //{
        //    HiddenField hd = (HiddenField)gr.FindControl("HiddenField1");
        //    Label L = (Label)gr.FindControl("Label2");
        //    L.Text = new Codes().WazefaName(Convert.ToInt32(hd.Value));
        //}
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
    protected void lblJop_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        try
        {
            (sender as Label).Text = TC.WazefaName(Convert.ToInt32((sender as Label).Text));
        }
        catch { }
        }
}
