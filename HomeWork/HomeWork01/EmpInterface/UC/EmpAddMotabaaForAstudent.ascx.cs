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
            Emp.GetSafForEmp(Convert.ToInt32(TheSessions.EmploeeID), ddlAlsaf);

            lblDate.Text = DateTime.Now.ToShortDateString();

        }
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        Employee Emp = new Employee();

        MotabaaClass SM = new MotabaaClass();

        if ( ddlAlfasl.SelectedIndex != 0 && ddlAlsaf.SelectedIndex != 0 && ddlStudent.SelectedIndex != 0 && txt_Title.Text != "")
        {
            SM.Stu_Code = Convert.ToInt64(ddlStudent.SelectedValue);
            SM.Code =  Convert.ToInt32(TheSessions.EmploeeID);
            SM.Asase_code = Convert.ToInt32(Login.CurrentYear);
            SM.School = Convert.ToInt64(Login.CurrentSchool);
            SM.Add_date = Convert.ToDateTime(lblDate.Text);
            SM.Title = txt_Title.Text;
            SM.Notice = txtMotabaa.Text;
            SM.ReplyCode = 2;
            SM.Reply = "";

            Emp.insertMotabaaForAstudent(SM);

            Clear();
            lblMessage.Text = " „ ≈—”«· «·„ «»⁄… »‰Ã«Õ";
        }
        else
        {
            txt_Title.Focus();
        }
    }



    protected void ddlAlsaf_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetFaslForSaf(Convert.ToInt32(TheSessions.EmploeeID), Convert.ToInt32(ddlAlsaf.SelectedValue), ddlAlfasl);
        lblMessage.Text = "";
    }
    protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void ddlAlfasl_SelectedIndexChanged(object sender, EventArgs e)
    {
        Emp.GetStudentsForFasl(Convert.ToInt32(ddlAlsaf.SelectedValue), Convert.ToInt32(ddlAlfasl.SelectedValue), ddlStudent);
    }
    protected void Clear()
    {
        ddlAlsaf.SelectedIndex = 0;
        ddlAlfasl.Items.Clear();
        ddlStudent.Items.Clear();
        txt_Title.Text = "";
        txtMotabaa.Text = "";
    }
}
