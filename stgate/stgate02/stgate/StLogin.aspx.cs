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

public partial class StLogin_ : Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDst"] == null)
            PnlLogin.Visible = true;
        else
            PnlLogin.Visible = false;
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (TxtUserName.Text == string.Empty || TxtPassword.Text == string.Empty)
        {
            LblState.Text = "Please enter your user name and password";
            LblState.ForeColor = Color.Red;
            return;
        }
        DataTable userData = LoadDataTable(string.Format(@"SELECT student.stu_code, student_t.alsofof_code, student_t.fasl_code
        FROM student INNER JOIN student_t ON student.stu_code = student_t.stu_code
        WHERE (student_t.asase_code = (SELECT MAX(asase_code) FROM student_t TBL WHERE stu_code = student.stu_code)) 
        AND (student.user_name = '{0}') AND (student.[pass] = '{1}')
        ", TxtUserName.Text, TxtPassword.Text), false);
        if (userData.Rows.Count == 0)
        {
            LblState.Text = "An error in the user name or password";
            LblState.ForeColor = Color.Red;
            return;
        }
        HttpContext.Current.Session["UserIDst"] = userData.Rows[0]["stu_code"].ToString();
        HttpContext.Current.Session["UserSaf"] = userData.Rows[0]["alsofof_code"].ToString();
        HttpContext.Current.Session["UserFasl"] = userData.Rows[0]["fasl_code"].ToString();
        if (Request.QueryString["RedirectURL"] == null)
            Response.Redirect("StCenter.aspx");
        else
            Response.Redirect(Request.QueryString["RedirectURL"]);
    }
    public DataTable LoadDataTable(string CommandString, bool EnableAddEmptyRow)
    {
        DataTable ReturnMe = new DataTable("FX2011-05");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, Connection))
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
        constr += sv.MapPath(@"data/dataschool.mdb");
        return constr;
    }
}