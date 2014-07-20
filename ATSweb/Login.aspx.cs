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
        if (TheSessions.UserID == null)
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
        DataTable userData = DB.LoadTableAATSWEB(string.Format(@"SELECT uanem, skinname
        FROM uid WHERE (uanem = '{0}') AND (upss = '{1}')", TxtUserName.Text, TxtPassword.Text));
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        TheSessions.UserID = userData.Rows[0]["uanem"].ToString();
        TheSessions.TelerikSkin = userData.Rows[0]["skinname"].ToString();
        //SqlConnection con = MC.EStoreConnection;
        //SqlCommand cmd = new SqlCommand("", con);
        //try
        //{
        //    con.Open();
        //    cmd.CommandText = @"Update Users Set LastActivityDate = GETDATE() Where UserID = " + TheSessions.UserID;
        //    cmd.ExecuteNonQuery();
        //}
        //catch (SqlException ex)
        //{
        //    LblState.Text = MC.CheckExp(ex);
        //    LblState.ForeColor = Color.Red;
        //}
        //con.Close();
        Response.Redirect("Default.aspx");
    }
}