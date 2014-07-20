using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_DoTheLogin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Login lg = new Login();
        if (lg.EmpLogin(txtUserName.Text, txtPassWord.Text))
        {
            dv.Visible = false;
            TheSessions.EmploeeID = txtUserName.Text;
            lblRong.Visible = false;
            Response.Redirect(@"EmpInterface\MainPage.aspx");
        }
        else
        {
            TheSessions.EmploeeID = null;
            lblRong.Visible = true;
        }
    }
    protected override void OnPreRender(EventArgs e)
    {
            base.OnPreRender(e);
            if (TheSessions.EmploeeID == null)
            {
                dv.Visible = true;
                logined.Visible = false;
            }
            else
            {
                dv.Visible = false;
                
                Login lg = new Login();
                if (lg.UserName != null)
                {
                    Employee emp = new Employee();
                    logined.Visible = true;
                }
            }
    }
    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        TheSessions.EmploeeID = null;
    }
}
