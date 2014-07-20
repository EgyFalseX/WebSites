using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.OleDb;

public partial class Login : Page
{

    private bool LogMeIn(string uid, string pss)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/tawzif.mdb");
        OleDbDataAdapter da = new OleDbDataAdapter(string.Format("Select [id] from admin where [user] = '{0}' And pass = '{1}'", uid, pss), constr);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            HttpContext.Current.Session["uIDJob"] = dt.Rows[0][0].ToString();
            return true;
        }
        else
            return false;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["uIDJob"] == null)
            PnlLogin.Visible = true;
        else
            PnlLogin.Visible = false;
        
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "من فضلك ادخل اسم المستخدم و كلمة المرور";
            LblState.ForeColor = Color.Red;
            return;
        }
        if (!LogMeIn(TxtUserName.Text, TxtPassword.Text))
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        Response.Redirect("Default.aspx");
    }
}