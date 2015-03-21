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
        //    Response.Redirect("AccessDenied.aspx");

        if (TheSessionsTEFollowUp.guest)
            btnDelete.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (cbplanid0.Value.ToString() == string.Empty)
        {
            return;
        }

        Response.Redirect("tbladdformdetailsEditor.aspx?id=" + cbplanid0.Value);
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        OleDbConnection con = MCTEFollowUp.Connection;
        OleDbCommand cmd = new OleDbCommand("DELETE FROM tbladdform WHERE formid = " + cbplanid0.Value, con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        
        cbplanid0.Value = null; cbplanid0.Text = string.Empty;
        DSData.DataBind();
        cbplanid0.DataBind();
    }
    protected void btnReport_Click(object sender, EventArgs e)
    {
        if (cbplanid0.Value == null || cbplanid0.Value.ToString() == string.Empty)
            return;
        HttpContext.Current.Session["XRep08ID"] = cbplanid0.Value;
        Response.Redirect("XRepViewer08.aspx");
    }
}