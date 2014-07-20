using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.OleDb;

public partial class Login : Page
{
    static string ConnectionStr(string DataBaseName)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;
        constr += sv.MapPath(@"~/App_Data/" + DataBaseName);
        return constr;
    }
    public static OleDbConnection DBConnection
    {
        get
        {
            OleDbConnection con1 = new OleDbConnection(ConnectionStr("news.mdb"));
            if (con1.State == ConnectionState.Open)
            {
                con1.Close();
            }
            return con1;
        }
    }//oledb connection object

    public static DataTable LoadDataTable(string CommandString, bool EnableAddEmptyRow)
    {
        DataTable ReturnMe = new DataTable("FX2011-05");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, DBConnection))
        {
            try
            {
                DA.Fill(ReturnMe);
                DataRow row = ReturnMe.NewRow();
                //row[0] = "0";
                //row[1] = "اختار";
                if (EnableAddEmptyRow)
                    ReturnMe.Rows.InsertAt(row, 0);
            }
            catch (OleDbException) { }
        }

        return ReturnMe;
    }//Load Table From Database

    protected void Page_Load(object sender, EventArgs e)
    {
        if (sessionNewsBar.UserID == null)
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
        DataTable userData = LoadDataTable(string.Format(@"SELECT id, user, pass
        FROM admin WHERE (user = '{0}') AND (pass = '{1}')", TxtUserName.Text, TxtPassword.Text), false);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "خطاء في اسم المستخدم او كلمة السر";
            LblState.ForeColor = Color.Red;
            return;
        }
        sessionNewsBar.UserID = userData.Rows[0]["id"].ToString();

        if (Request.QueryString["RedirectURL"] == null)
        {
            Response.Redirect("~/NewsBar/Default.aspx");
        }
        else
        {
            Response.Redirect(Request.QueryString["RedirectURL"]);
        }
    }

}