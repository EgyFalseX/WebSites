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

            lblDate.Text = DateTime.Today.ToShortDateString();

        }
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (ddl_Elsaf.SelectedIndex != 0 && ddlFasl.SelectedIndex != 0 && ddlHesa.SelectedIndex != 0 && ddlMadah.SelectedIndex != 0 && txtHomework.Text != "")
        {
            
            string DID = new Codes().DayID(Convert.ToInt64(TheSessions.EmploeeID), Convert.ToInt32(ddlHesa.SelectedValue), Convert.ToInt32(ddl_Elsaf.SelectedValue), Convert.ToInt32(ddlFasl.SelectedValue), Convert.ToInt32(ddlMadah.SelectedValue));
            HomeWorkClass pc = new HomeWorkClass();

            pc.Add_date = Convert.ToDateTime(lblDate.Text);
            pc.Alsofof_Code = Convert.ToInt32(ddl_Elsaf.SelectedValue);
            pc.Asase_code = Convert.ToInt32(Login.CurrentYear);
            pc.Code = Convert.ToInt64(TheSessions.EmploeeID);
            pc.Daycode = Convert.ToInt32(DID);
            pc.Fasl_code = Convert.ToInt32(ddlFasl.SelectedValue);
            pc.Hasa_code = Convert.ToInt32(ddlHesa.SelectedValue);
            pc.Home_work = txtHomework.Text;
            pc.Mawad_no = Convert.ToInt32(ddlMadah.SelectedValue);
            pc.School = Convert.ToInt64(Login.CurrentSchool);
            pc.Read_code = 2;
            Emp.insertHomeWork(pc);

            lblMessage.Text = " „ «—”«· «·Ê«Ã» »‰Ã«Õ";
            Clear();
        }
        else
        {
            txtHomework.Focus();
        }

    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {

        Clear();
    }
    protected void ddl_Elsaf_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetFaslForSaf(Convert.ToInt32(TheSessions.EmploeeID), Convert.ToInt32(ddl_Elsaf.SelectedValue), ddlFasl);
        lblMessage.Text = "";
    }
    protected void ddlFasl_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetMadahForFasl(Convert.ToInt32(TheSessions.EmploeeID), Convert.ToInt32(ddl_Elsaf.SelectedValue), Convert.ToInt32(ddlFasl.SelectedValue), ddlMadah);
    }
    protected void ddlMadah_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetHesaForMadah(Convert.ToInt32(TheSessions.EmploeeID), Convert.ToInt32(ddl_Elsaf.SelectedValue), Convert.ToInt32(ddlFasl.SelectedValue),Convert.ToInt32(ddlMadah.SelectedValue), ddlHesa);
    }
    protected void Clear()
    {
        ddl_Elsaf.SelectedIndex = 0;
        ddlFasl.Items.Clear();
        ddlHesa.Items.Clear();
        ddlMadah.Items.Clear();
        txtHomework.Text = "";
    }
}
