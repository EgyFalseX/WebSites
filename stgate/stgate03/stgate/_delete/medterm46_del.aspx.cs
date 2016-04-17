using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class medterm46_del : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDst"] == null)
            Response.Redirect("StLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());


        DataTable userData = LoadDataTable(string.Format(@"SELECT [manth_code], [arabic], [math], [english], [englishe], [frensh], [deen], drasat, since FROM [month_net] 
        WHERE ([stu_code] = {0}) AND (perm = TRUE)", HttpContext.Current.Session["UserIDst"]), false);
        if (userData.Rows.Count == 0)
        {
            ASPxFormLayout1.Visible = false;
            lblMsg.Text = "عذرا يرجى الرجوع لللادارة";
            return; 
        }
        lblmanth_code.Text = userData.Rows[0]["manth_code"].ToString();
        lblarabic.Text = userData.Rows[0]["arabic"].ToString();
        lblmath.Text = userData.Rows[0]["math"].ToString();
        lblenglish.Text = userData.Rows[0]["english"].ToString();
        lbldrasat.Text = userData.Rows[0]["drasat"].ToString();
        lblsince.Text = userData.Rows[0]["since"].ToString();
        lblenglishe.Text = userData.Rows[0]["englishe"].ToString();
        lblfrensh.Text = userData.Rows[0]["frensh"].ToString();
        lblenglishe.Text = userData.Rows[0]["deen"].ToString();

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
            catch (Exception) { }
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
        constr += sv.MapPath(@"data/2/Datanet.mdb");
        return constr;
    }
}