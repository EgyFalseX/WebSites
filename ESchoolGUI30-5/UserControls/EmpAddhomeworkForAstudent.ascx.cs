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

public partial class UserControls_EmpAddhomework : System.Web.UI.UserControl
{

    Employee Emp = new Employee();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Emp.GetSafForEmp(Convert.ToInt32(TheSessions.EmploeeID), ddl_Elsaf);
        }
        lblDate.Text = DateTime.Now.ToShortDateString();
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (ddl_Elsaf.SelectedIndex != 0 && ddlFasl.SelectedIndex != 0 && ddlHesa.SelectedIndex != 0 && ddlMadah.SelectedIndex != 0 && txtHomework.Text != "")
        {
            SHWClass SHW = new SHWClass();

            SHW.School = Convert.ToInt64(Login.CurrentSchool);
            SHW.Asase_code = Convert.ToInt32(Login.CurrentYear);
            SHW.Hasa_code = Convert.ToInt32(ddlHesa.SelectedValue);
            SHW.Mawad_no = Convert.ToInt32(ddlMadah.SelectedValue);
            SHW.Add_date = Convert.ToDateTime(lblDate.Text);
            SHW.Code = Convert.ToInt64(TheSessions.EmploeeID);
            SHW.Home_work = txtHomework.Text;
            SHW.Read_code = 2;
            SHW.Stu_Code = Convert.ToInt64(ddlStudent.SelectedValue);

            Emp.insertHomeWorkForAstudent(SHW);

            lblMessage.Text = " „ «—”«· «·Ê«Ã» »‰Ã«Õ";

            Clear();
        }
        else
        {
            txtHomework.Focus();
        }
    }



    protected void ddl_Elsaf_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetFaslForSaf(Convert.ToInt32(TheSessions.EmploeeID),Convert.ToInt32(ddl_Elsaf.SelectedValue), ddlFasl);
        lblMessage.Text = "";
    }
    protected void ddlFasl_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetMadahForFasl(Convert.ToInt32(TheSessions.EmploeeID), Convert.ToInt32(ddl_Elsaf.SelectedValue),Convert.ToInt32(ddlFasl.SelectedValue), ddlMadah);
    }
    protected void ddlMadah_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetHesaForMadah(Convert.ToInt32(TheSessions.EmploeeID), Convert.ToInt32(ddl_Elsaf.SelectedValue), Convert.ToInt32(ddlFasl.SelectedValue), Convert.ToInt32(ddlMadah.SelectedValue),ddlHesa);
    }
    protected void ddlHesa_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetStudentsForFasl( Convert.ToInt32(ddl_Elsaf.SelectedValue), Convert.ToInt32(ddlFasl.SelectedValue), ddlStudent);
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void Clear()
    {
        ddl_Elsaf.SelectedIndex = 0;
        ddlStudent.Items.Clear();
        ddlMadah.Items.Clear();
        ddlHesa.Items.Clear();
        ddlFasl.Items.Clear();
        txtHomework.Text = "";
    }
}
