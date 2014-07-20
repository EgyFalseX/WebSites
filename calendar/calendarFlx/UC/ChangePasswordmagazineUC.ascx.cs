using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class ChangePasswordmagazineUC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserID_magazine"] == null)
            Response.Redirect("Loginmagazine.aspx");
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (Txtpass1.Text == string.Empty || Txtpass2.Text == string.Empty)
        {
            LblState.Text = "Please Type A Password";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (Txtpass1.Text != Txtpass2.Text)
        {
            LblState.Text = "Password and its confirmation is not the same";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        OleDbConnection con = new OleDbConnection(ConnectionStr("magazine.mdb"));
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Update admin Set pass = '{0}' Where id = {1}", Txtpass1.Text, HttpContext.Current.Session["UserID_magazine"]);
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.ForeColor = System.Drawing.Color.Green;
            LblState.Text = "Update complated";
        }
        catch (OleDbException ex)
        {
            LblState.ForeColor = System.Drawing.Color.Red; 
            LblState.Text = ex.Message;
            
        }
        con.Close();
    }
    static string ConnectionStr(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"App_Data\" + DataBasename);

        return constr;
    }
}