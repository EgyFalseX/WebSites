using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Main.UserID = null;
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (Main.LoginRequest(TxtUser.Text, TxtPass.Text))
            {
                Main.UserID = TxtUser.Text;
                Response.Redirect("Default.aspx");
            }
            else
            {
                LblState.Text = "Incorrect Username/Password";
                LblState.ForeColor = System.Drawing.Color.Red;
            }
        }
        catch (SqlException ex)
        {
            LblState.Text = ex.Message;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        
    }
}