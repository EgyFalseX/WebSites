using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Client_friendsMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["UserName"] == null) || (Session["Password"] == null))
            Response.Redirect("Login.aspx");

        if (Session["IsActive"] != null)
            articlesASPxButton.Enabled = true;
    }
    protected void leganASPxButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("FriendsPersnalData.aspx");
    }
    protected void syndicateASPxButton_Click(object sender, EventArgs e)
    {
       // Response.Redirect("Syndicate.aspx");
    }
}
