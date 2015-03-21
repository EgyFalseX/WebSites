using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class tbladdformNew : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsTEFollowUp.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        //if (!TheSessionsTEFollowUp.IsAdmin)
        //    Response.Redirect("AccessDenied.aspx");
        if (TheSessionsTEFollowUp.guest)
            btnSave.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        OleDbConnection con = MCTEFollowUp.Connection;
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            con.Open();
            //WHERE NOT EXISTS(SELECT planid FROM tbladdform WHERE planid = XXX.planid)
            cmd.CommandText = @"INSERT INTO tbladdform (planid, formdate, userin, datein) 
            VALUES (@planid, @formdate, @userin, Date())";
            OleDbParameter Pramplanid = new OleDbParameter("@planid", cbplanid.Value); cmd.Parameters.Add(Pramplanid);
            OleDbParameter Pramformdate = new OleDbParameter("@formdate", deformdate.Value); cmd.Parameters.Add(Pramformdate);
            //OleDbParameter Pramystfad = new OleDbParameter("@ystfad", tbystfad.Value); cmd.Parameters.Add(Pramystfad);
            //OleDbParameter Pramtawseat = new OleDbParameter("@tawseat", tbtawseat.Value); cmd.Parameters.Add(Pramtawseat);
            OleDbParameter Pramuserin = new OleDbParameter("@userin", TheSessionsTEFollowUp.UserID); cmd.Parameters.Add(Pramuserin);
            cmd.ExecuteNonQuery();
            cmd.CommandText = @"SELECT @@Identity";
            int formid = Convert.ToInt32(cmd.ExecuteScalar());

            cmd.Parameters.Clear();

            cmd.CommandText = @"INSERT INTO tbladdformdetails (formid, robrexeid, robrexedegree, robrexedescrption, userin, datein) VALUES
            (@formid, @robrexeid, @robrexedegree, @robrexedescrption, @userin, Date())";
            OleDbParameter Pramformid = new OleDbParameter("@formid", OleDbType.Numeric); cmd.Parameters.Add(Pramformid);
            OleDbParameter Pramrobrexeid = new OleDbParameter("@robrexeid", OleDbType.Numeric); cmd.Parameters.Add(Pramrobrexeid);
            OleDbParameter Pramrobrexedegree = new OleDbParameter("@robrexedegree", OleDbType.Numeric); cmd.Parameters.Add(Pramrobrexedegree);
            OleDbParameter Pramrobrexedescrption = new OleDbParameter("@robrexedescrption", OleDbType.WChar); cmd.Parameters.Add(Pramrobrexedescrption);
            OleDbParameter Pramuserin2 = new OleDbParameter("@userin", TheSessionsTEFollowUp.UserID); cmd.Parameters.Add(Pramuserin2);
            Pramformid.Value = formid; Pramrobrexedegree.Value = 0; Pramrobrexedescrption.Value = string.Empty;

            DataTable dt = MCTEFollowUp.LoadDataTable(@"SELECT robrexeid FROM cdrobrexelement", false);
            foreach (DataRow row in dt.Rows)
            {
                Pramrobrexeid.Value = row["robrexeid"].ToString();
                cmd.ExecuteNonQuery();
            }
            Response.Redirect("tbladdformdetailsEditor.aspx?id=" + formid);
        }
        catch (OleDbException ex)
        {
            throw ex;
        }
    }
}