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

public partial class EmpInterface_HWMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee Emp = new Employee();
        lbl_Fullname.Text = Emp.GetEmpFullhName(Convert.ToInt32(TheSessions.EmploeeID));
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/MainPage.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EmpAllMotabaa.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EmpAllMotabaForDay.aspx");
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EmpAllReadMotabaa.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EmpAllUnReadMotabaa.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EmpAddMotabaaForAstudent.aspx");
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        TheSessions.EmploeeID = null;
        Response.Redirect("../EmpLogin.aspx");
    }
}
