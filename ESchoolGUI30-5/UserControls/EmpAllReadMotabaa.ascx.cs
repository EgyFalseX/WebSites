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

public partial class UserControls_EmpshowHWforAstudent : System.Web.UI.UserControl
{
    Employee Emp = new Employee();

    protected void Page_Load(object sender, EventArgs e)
    {
        gr_StudentMotaba.DataSource = Emp.GetAllReadMotabaa();
        gr_StudentMotaba.DataBind();

       
    }
    protected void lblStudname_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().StudentName(Convert.ToInt32((sender as Label).Text));
    }
   
    protected void lblStatus_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().ReplyStatus(Convert.ToInt32((sender as Label).Text));
    }

    protected void gr_StudentMotaba_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gr_StudentMotaba.PageIndex = e.NewPageIndex;
        gr_StudentMotaba.DataBind();
    }
}
