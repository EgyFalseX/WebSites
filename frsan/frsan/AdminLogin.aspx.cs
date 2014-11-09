using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class Login : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessionsfrsan.UserID == null)
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
        DataTable userData = MCfrsan.LoadDataTable(string.Format(@"SELECT id, user, [pass]
        FROM adminfrsan WHERE (user = '{0}') AND ([pass] = '{1}')", TxtUserName.Text, TxtPassword.Text), false, MCfrsan.Connection.ConnectionString);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessionsfrsan.UserID = userData.Rows[0]["id"].ToString();
        TheSessionsfrsan.IsAdmin = true;
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/frsan/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }

}