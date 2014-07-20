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
        if (!Page.IsPostBack )
        {
            Emp.GetSafForEmp(Convert.ToInt32(TheSessions.EmploeeID),ddlSaf);
        }     
    }
    protected void lblStudname_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().StudentName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lblHesa_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().SessionName(Convert.ToInt32((sender as Label).Text));
    }
    protected void lblStatus_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().ReadStatus(Convert.ToInt32((sender as Label).Text));
    }
   

    protected void lblMadah_DataBinding1(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().SubjectName(Convert.ToInt32((sender as Label).Text));
    }

    protected void ddl_Elfasl_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetStudentsForFasl(Convert.ToInt32(ddlSaf.SelectedValue), Convert.ToInt32(ddl_Elfasl.SelectedValue), ddl_Studens);
    }
    protected void ddl_Studens_SelectedIndexChanged(object sender, EventArgs e)
    {
        gr_StudentHomeW.DataSource = Emp.GetAllHomeWorksForAstudent(Convert.ToInt32(ddl_Studens.SelectedValue));
        gr_StudentHomeW.DataBind();

    }

    protected void ddlSaf_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetFaslForSaf(Convert.ToInt32(TheSessions.EmploeeID), Convert.ToInt32(ddlSaf.SelectedValue), ddl_Elfasl);
    }
    protected void gr_StudentHomeW_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gr_StudentHomeW.PageIndex = e.NewPageIndex;
        gr_StudentHomeW.DataBind();
    }
    protected void lblMadah_DataBinding(object sender, EventArgs e)
    {
        (sender as Label).Text = new Codes().SubjectName(Convert.ToInt32((sender as Label).Text));
    }
}
