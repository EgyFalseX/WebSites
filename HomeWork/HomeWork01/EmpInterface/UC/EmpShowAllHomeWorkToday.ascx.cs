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

public partial class UserControls_EmpShowHomeWork : System.Web.UI.UserControl
{
    Employee Emp = new Employee();

    protected void Page_Load(object sender, EventArgs e)
    {
        
            gr_HomeW.DataSource = Emp.GetAllHWToday(DateTime.Today);
            gr_HomeW.DataBind();
        
    }
    protected void lblElsaf_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().StageName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lblElfasl_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().ClassName(Convert.ToInt32((sender as Label).Text));
    }

    protected void lblAlhesa_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().SessionName(Convert.ToInt32((sender as Label).Text));
    }

    protected void lblMada_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().SubjectName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lblDayname_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().DayName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lblStatus_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().ReadStatus(Convert.ToInt32((sender as Label).Text));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        gr_HomeW.DataSource = Emp.GetAllHWToday(Calendar1.SelectedDate);
        gr_HomeW.DataBind();
        Calendar1.Visible = false;
    }
    protected void gr_HomeW_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gr_HomeW.PageIndex = e.NewPageIndex;
        gr_HomeW.DataBind();
    }
}
