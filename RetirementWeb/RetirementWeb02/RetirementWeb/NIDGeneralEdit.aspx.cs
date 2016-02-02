using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class NIDGeneralEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("SelectSyn_Sarf.aspx");
            return;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblStatus.Text = string.Empty;
        //DSData.DataFile = MapPath(@"~/App_Data/" + sessionRetirementWeb.DatabaseName);
        OleDbConnection con = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + MapPath("../App_Data/") +  Request.QueryString["db"] + ";Persist Security Info=True");
        OleDbCommand cmd = new OleDbCommand("", con);
        cmd.CommandText = @"UPDATE tblmember SET mnid = '" + tbNID.Value + "' WHERE memberid = " + Request.QueryString["id"];
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("SelectSyn_Sarf.aspx");
        }
        catch (Exception ex)
        {
            lblStatus.Text = ex.Message;
            con.Close();
        }
        
    }
}