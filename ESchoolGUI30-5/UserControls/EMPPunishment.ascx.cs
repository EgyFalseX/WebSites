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


public partial class UserControls_Algzaat : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee EMP = new Employee();
        GridView1.DataSource = EMP.Punishment();
        GridView1.DataBind();
    }
    protected void lbl_Punishment_DataBinding(object sender, EventArgs e)
    {
        Codes TC = new Codes();
        (sender as Label).Text = TC.PunishName(Convert.ToInt32((sender as Label).Text));
       
    }
    protected void Label1_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text =new Codes().YearName(Convert.ToInt32((sender as Label).Text));
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}
