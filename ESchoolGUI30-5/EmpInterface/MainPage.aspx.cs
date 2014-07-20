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
using System.Data.OleDb;

public partial class EmpInterface_MainPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DataTable dt = new DataTable();
        //dt.Columns.Add(new DataColumn("id"));
        //dt.Columns.Add(new DataColumn("name"));
        //DataRow drw = dt.NewRow();
        //OleDbDataReader dr= com;
        //while(dr.Read())
        //{
        //    drw["id"] = dr["mawad_id"];
        //    drw["name"] = new Codes().SubjectName(Convert.ToInt32(dr["mawad_id"]));
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EmpShoaoon.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/DefaultHW.aspx");
    }
    
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/DefaultMotabaa.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("../EmpInterface/EmpGadwal.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        TheSessions.EmploeeID = null;
        Response.Redirect("../EmpLogin.aspx");
    }
}
