using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class LoginUserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void vSubmitASPxButton_Click(object sender, EventArgs e)
        {
            string msg;
            LoginClass loginObject = new LoginClass("AriscFriend.mdb");
            loginObject.Mode = "Select";
            loginObject.IsAdmin  = false;
            loginObject.UserName = userNameASPxTextBox.Text;
            loginObject.Password = passwordASPxTextBox.Text;

            msg = loginObject.LoginMethod("TBLFriends", "username", "pass", "isadmin");
            if (msg != "")
                msgASPxLabel1.Text = msg;
            else
            {
                Session["UserName"] = userNameASPxTextBox.Text;
                Session["Password"] = passwordASPxTextBox.Text;
                Session["IsActive"] = loginObject.IsActive;

            

                if (Request.QueryString["RedirectURL"] != null)
                {
                    Response.Redirect(Request.QueryString["RedirectURL"]);
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
      
                //Response.Redirect("~\\ControlPanel\\CPDefault.aspx");
            }
        }
    }
