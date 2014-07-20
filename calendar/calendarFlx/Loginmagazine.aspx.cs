using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.OleDb;

public partial class Loginmagazine : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserID_magazine"] == null)
            PnlLogin.Visible = true;
        else
            PnlLogin.Visible = false;
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "Please Enter User Name And Password";
            LblState.ForeColor = Color.Red;
            return;
        }
        DataTable userData = LoadDataTable(string.Format(@"SELECT id
        FROM admin WHERE (user = '{0}') AND (pass = '{1}')", TxtUserName.Text, TxtPassword.Text));
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "UserName/Password is wrong";
            LblState.ForeColor = Color.Red;
            return;
        }
        HttpContext.Current.Session["UserID_magazine"] = userData.Rows[0]["id"].ToString();
        if (CBPass.Checked)
            Response.Redirect("ChangePasswordmagazine.aspx");
        else
            Response.Redirect("Default.aspx");
    }
    public static DataTable LoadDataTable(string CommandString)//Load Table From Database
    {
        DataTable ReturnMe = new DataTable("FX2010-11");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, ConnectionStr("magazine.mdb")))
        {
            try { DA.Fill(ReturnMe); }
            catch
            { }
        }
        return ReturnMe;
    }
    static string ConnectionStr(string DataBasename)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;

        constr += sv.MapPath(@"App_Data\" + DataBasename);

        return constr;
    }

}