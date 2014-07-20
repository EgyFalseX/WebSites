using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (sessionsEtsNorth.UserID == null)
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
        DataTable userData = mcEtsNorth.LoadDataTable(string.Format(@"SELECT UserID, ModereaId, IsAdmin
        FROM Users WHERE (UserName = N'{0}') AND (UserPass = N'{1}') AND (IsActive = 'true')", TxtUserName.Text, TxtPassword.Text), false);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        sessionsEtsNorth.UserID = userData.Rows[0]["UserID"].ToString();
        sessionsEtsNorth.ModereaId = userData.Rows[0]["ModereaId"].ToString();
        if (mcEtsNorth.IsNullOrEmpty(userData.Rows[0]["IsAdmin"]))
            sessionsEtsNorth.IsAdmin = false;
        else
            sessionsEtsNorth.IsAdmin = (bool)userData.Rows[0]["IsAdmin"];

        SqlConnection con = mcEtsNorth.ESchoolConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = @"Update Users Set LastActivityDate = GETDATE() Where UserID = " + sessionsEtsNorth.UserID;
            cmd.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            LblState.Text = mcEtsNorth.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
        if (Request.QueryString["RedirectURL"] == null)
        {
            Response.Redirect("~/");
        }
        else
        {
            Response.Redirect(Request.QueryString["RedirectURL"]);
        }
    }
}