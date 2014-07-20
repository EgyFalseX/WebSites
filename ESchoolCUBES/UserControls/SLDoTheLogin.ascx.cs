using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_DoTheLogin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (TheSessions.EmploeeID == null)
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
        if (lg.DoLogin(txtUserName.Text, txtPassWord.Text))
        {
            //dv.Visible = false;
            TheSessions.EmploeeID = txtUserName.Text;
            lblRong.Visible = false;
            Response.Redirect("~/Admin.aspx");
            
        }
        else
        {
            TheSessions.EmploeeID = null;
            lblRong.Visible = true;
        }
    }
    protected override void OnPreRender(EventArgs e)
    {
            //base.OnPreRender(e);
            //if (TheSessions.StudentID == null)
            //{
            //    dv.Visible = true;
            //    logined.Visible = false;
            //}
            //else
            //{
            //    dv.Visible = false;
                
            //    Login lg = new Login();
            //    if (lg.UserName != null)
            //    {
            //        logined.Visible = true;
            //    }
            //}
    }

    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        TheSessions.EmploeeID = null;
    }
}
