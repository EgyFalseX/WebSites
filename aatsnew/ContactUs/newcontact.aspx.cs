using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class newcontact : System.Web.UI.Page
{
    private string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/ABOUT.mdb");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!tbcountry.IsValid || !tbcourses.IsValid || !tbmail.IsValid || !tbmobile.IsValid || !tbvistorname.IsValid || !captcha.IsValid)
        {
            return;
        }
        try
        {
            Insertnewcontact(tbvistorname.Text, tbcountry.Text, tbmobile.Text, tbmail.Text, tbcourses.Text);
            lblResult.Text = "تم الحفظ";
            lblResult.ForeColor = System.Drawing.Color.DarkGreen;
        }
        catch (Exception ex)
        {
            lblResult.Text = ex.Message;
            lblResult.ForeColor = System.Drawing.Color.Red;
            return;
        }
        
        lblResult.Text = "تم الحفظ";
        lblResult.ForeColor = System.Drawing.Color.DarkGreen;

        tbcountry.Text = ""; tbcourses.Text = ""; tbmail.Text = ""; tbmobile.Text = ""; tbvistorname.Text = ""; 
    }
    private string Insertnewcontact(string vistorname, string country, string mobile, string mail, string courses)
    {
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO newcontact (vistorname, country, mobile, mail, courses)
            VALUES ('{0}', '{1}', '{2}', '{3}', '{4}')", vistorname, country, mobile, mail, courses);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            return ex.Message;
        }
        con.Close();
        return string.Empty;
    }
}