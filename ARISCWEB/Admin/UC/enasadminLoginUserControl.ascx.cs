using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class enasadminLoginUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void vSubmitASPxButton_Click(object sender, EventArgs e)
        {
            
            string msg;
            LoginClass loginObject = new LoginClass("AATSWEB.mdb");
            loginObject.Mode = "Select";
            loginObject.IsAdmin = true;
            loginObject.UserName = userNameASPxTextBox.Text;
            loginObject.Password = passwordASPxTextBox.Text;
            msg = loginObject.LoginMethod("enasadmin", "user", "pass", "true");
            if (msg != "")
                msgASPxLabel1.Text = msg;
            else
            {
                Session["enasadmin_User"] = userNameASPxTextBox.Text;
                Session["enasadmin_Pass"] = passwordASPxTextBox.Text;
                Session["enasadmin_IsAdmin"] = true;
                if (Request.QueryString["RedirectURL"] != null)
                {
                    Response.Redirect(Request.QueryString["RedirectURL"]);
                }
                else
                {
                    Response.Redirect("CPFriendsSignUp.aspx");
                }      
                //Response.Redirect("~\\ControlPanel\\CPDefault.aspx");
            }
        }
    }
