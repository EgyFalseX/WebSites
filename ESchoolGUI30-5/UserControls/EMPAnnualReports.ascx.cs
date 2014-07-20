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

public partial class UserControls_AnnualReports : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee EMP = new Employee();
        GridView1.DataSource = EMP.AnnualReports();
        GridView1.DataBind();

    }
    protected void lbl_Takder_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().TakderName(Convert.ToInt32((sender as Label).Text));
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}
