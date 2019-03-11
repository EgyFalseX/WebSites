using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class Login : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDUploadFiles"] == null)
            PnlLogin.Visible = true;
        else
            PnlLogin.Visible = false;
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "من فضلك ادخل اسم المستخدم و كلمة المرور";
            LblState.ForeColor = Color.Red;
            return;
        }
        DataTable userData = LoadDataTable(string.Format(@"SELECT id, user, [pass]
        FROM Users WHERE (user = '{0}') AND ([pass] = '{1}')", TxtUserName.Text, TxtPassword.Text));
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        HttpContext.Current.Session["UserIDUploadFiles"] = userData.Rows[0]["id"].ToString();
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("~/");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }
 
    public DataTable LoadDataTable(string CommandString)
    {
        DataTable ReturnMe = new DataTable("FX2014-09");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, Connection))
        {
            try
            {
                DA.Fill(ReturnMe);
            }
            catch (SqlException) { }
        }

        return ReturnMe;
    }//Load Table From Database
    public OleDbConnection Connection
    {
        get
        {
            OleDbConnection con = new OleDbConnection(ConnectionString());
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            return con;
        }
    }
    static string ConnectionString()
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;
        constr += sv.MapPath(@"DB/UploadFilesPaths.mdb");
        return constr;
    }
}