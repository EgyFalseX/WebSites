using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_DoTheLogin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ET_Lib.Empid == null)
        {
            lbtnlogout.Visible = false;
  
        }
        else
        {
            lbtnlogout.Visible = true;
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Login lg = new Login();
        if (ET_Lib.TryLogin(txtUserName.Text, txtPassWord.Text))
        {
            lblRong.Visible = false;
            Response.Redirect("~/MainPage.aspx");
        }
        else
        {
            ET_Lib.Empid = null;
            lblRong.Visible = true;
        }
    }
    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        ET_Lib.Empid = null;
        ET_Lib.UserName = null;
    }

}
