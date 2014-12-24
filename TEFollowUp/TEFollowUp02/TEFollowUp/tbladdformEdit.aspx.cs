using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class tbladdformEdit : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        //if (!TheSessionsTEFollowUp.IsAdmin)
        //    Response.Redirect("AccessDenied");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (cbplanid0.Value.ToString() == string.Empty)
        {
            return;
        }

        Response.Redirect("tbladdformdetailsEditor.aspx?id=" + cbplanid0.Value);
    }
}