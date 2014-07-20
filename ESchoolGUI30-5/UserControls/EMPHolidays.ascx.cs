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

public partial class UserControls_Holidays : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee EMP = new Employee();
        GridView1.DataSource = EMP.Holiday();
        GridView1.DataBind();
    }
    protected void lbl_HolidayType_DataBinding(object sender, EventArgs e)
    {
        try
        {
            (sender as Label).Text = new Codes().HolidayName(Convert.ToInt32((sender as Label).Text));
        }
        catch { }
    }
  
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow gr in GridView1.Rows)
        {
            HiddenField hd1 = (HiddenField)gr.FindControl("HiddenField2");
            Label L = (Label)gr.FindControl("Label2");
            L.Text = new Codes().GehatAgazaName(Convert.ToInt32(hd1.Value));

        }

        foreach (GridViewRow gr in GridView1.Rows)
        {
            HiddenField hd = (HiddenField)gr.FindControl("HiddenField1");
            Label L = (Label)gr.FindControl("Label1");
            L.Text = new Codes().YearName(Convert.ToInt32(hd.Value));

        }


    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        //(sender as Label).Text = new Codes().YearName(Convert.ToInt32((sender as Label).Text));

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}
