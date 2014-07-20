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

public partial class UserControls_Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Login lg = new Login();
        if (lg.DoLogin(txtUserName.Text, txt_PassWord.Text))
        {
            dv.Visible = false;
            TheSessions.EmploeeID = txtUserName.Text;
            lblRong.Visible = false;
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
                lblname.Text = lg.UserName;
                logined.Visible = true;
            }
        }
    }
    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        TheSessions.EmploeeID = null;
    }
}
