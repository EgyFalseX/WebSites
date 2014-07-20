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

using System.Collections.Generic;


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Employee Emp = new Employee();
        lbl_Fullname.Text = Emp.GetEmpFullhName(Convert.ToInt32(TheSessions.EmploeeID));
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPMInformation.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPHierarchy.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPTrainingPrograms.aspx");
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPAnnualReports.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPDegrees.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPPunishment.aspx");
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPPermissions.aspx");
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPDelay.aspx");
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPHolidays.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPQualifieds.aspx");
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPAbsence.aspx");
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPLoans.aspx");
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EMPSalary.aspx");
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        TheSessions.EmploeeID = null;
        Response.Redirect("../EmpLogin.aspx");
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/MainPage.aspx");
    }
}
