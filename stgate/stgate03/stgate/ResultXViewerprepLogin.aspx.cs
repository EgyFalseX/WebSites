using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class ResultXViewerprepLogin : System.Web.UI.Page
{
    static string DatabasePath = "data/2/Datanet.mdb";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDst"] == null)
            Response.Redirect("StLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        //lblName.Text = string.Empty;
        img.ImageUrl = @"images\st_empty.png";
        if (HttpContext.Current.Session["UserSaf"].ToString() == "3" || HttpContext.Current.Session["UserSaf"].ToString() == "4" || HttpContext.Current.Session["UserSaf"].ToString() == "5")
        {
            LoadResult1();
        }
        else if (HttpContext.Current.Session["UserSaf"].ToString() == "6" || HttpContext.Current.Session["UserSaf"].ToString() == "7" || HttpContext.Current.Session["UserSaf"].ToString() == "8")
        {
            LoadResult2();
        }
    }
    private void LoadResult1()
    {
        string Saf = HttpContext.Current.Session["UserSaf"].ToString();  
        string asase_code = LoadDataTable("SELECT MAX(asase_code) FROM asase", "data/asase.mdb").Rows[0][0].ToString();
        DataTable GeneralTbl = LoadDataTable(string.Format(@"SELECT qmid.arabic_level, qmid.math_level, qmid.since_level, qmid.drasat_level, qmid.english_level, qmid.deen_level, 
        qmid.comp_level, qmid.rsm_level, qmid.englishe_level, qmid.frensh_level, qmid.nashat1_level, qmid.nashat2_level, qmid.fezea_level, qmid.history_level, qmid.asase_code, 
        qmid.stu_code, qmid.code_al_fasl, qmid.SPOS, qmid.gloos, qmid.perm, qmid.stu_name, qmid.fasl_code, qmid.alsofof_code, qmid.arabic_mid, qmid.arabic_last, qmid.math_mid, 
        qmid.math_last, qmid.since_mid, qmid.since_last, qmid.drasat_mid, qmid.drasat_last, qmid.english_mid, qmid.english_last, qmid.sum_mid, qmid.sum_last, qmid.deen_mid, 
        qmid.deen_last, qmid.comp_mid, qmid.comp_last, qmid.koran_mid, qmid.koran_last, qmid.rsm_mid, qmid.rsm_last, qmid.englishe_mid, qmid.englishe_last, qmid.frensh_mid, 
        qmid.frensh_last, qmid.nashat1_mid, qmid.nashat1_last, qmid.nashat2_mid, qmid.nashat2_last, qmid.ahiaa, qmid.kemea, qmid.fezea, qmid.history, qmid.geography, 
        qmid.falsafa, qmid.kemea_level FROM qmid WHERE asase_code = {0} AND alsofof_code = {1} AND stu_code = {2}", asase_code, Saf, HttpContext.Current.Session["UserIDst"]), DatabasePath);
        if (GeneralTbl.Rows.Count == 0)
        {
            GVEditor.DataSource = new DataTable(); GVEditor.DataBind();
            return;
        }
        //Get student Information
        lblName.Text = LoadDataTable(@"SELECT stu_name_e FROM student WHERE stu_code = " + GeneralTbl.Rows[0]["stu_code"], "data/dataschool.mdb").Rows[0][0].ToString();
        string imgPath = string.Format(@"data/photo/picstudent/{0}.jpg", GeneralTbl.Rows[0]["stu_code"]);
        if (System.IO.File.Exists(MapPath(imgPath)))
        {
            img.ImageUrl = imgPath;
        }
        DataTable dt = new DataTable();
        dt.Columns.Add("Subject"); dt.Columns.Add("Max"); dt.Columns.Add("StDegree"); dt.Columns.Add("StudentsAverage"); dt.Columns.Add("img");
        dt.Rows.Add(new string[] { "Arabic", "100", GeneralTbl.Rows[0]["arabic_mid"].ToString(), GeneralTbl.Rows[0]["arabic_level"].ToString(), GeneralTbl.Rows[0]["arabic_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Maths", "100", GeneralTbl.Rows[0]["math_mid"].ToString(), GeneralTbl.Rows[0]["math_level"].ToString(), GeneralTbl.Rows[0]["math_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "English O-L", "100", GeneralTbl.Rows[0]["english_mid"].ToString(), GeneralTbl.Rows[0]["english_level"].ToString(), GeneralTbl.Rows[0]["english_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Art", "100", GeneralTbl.Rows[0]["rsm_mid"].ToString(), GeneralTbl.Rows[0]["rsm_level"].ToString(), GeneralTbl.Rows[0]["rsm_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "P.E", "100", GeneralTbl.Rows[0]["kemea"].ToString(), GeneralTbl.Rows[0]["kemea_level"].ToString(), GeneralTbl.Rows[0]["kemea"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Activity (1)", "100", GeneralTbl.Rows[0]["nashat1_mid"].ToString(), GeneralTbl.Rows[0]["nashat1_level"].ToString(), GeneralTbl.Rows[0]["nashat1_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Activity (2)", "100", GeneralTbl.Rows[0]["nashat2_mid"].ToString(), GeneralTbl.Rows[0]["nashat2_level"].ToString(), GeneralTbl.Rows[0]["nashat2_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "English A-L", "100", GeneralTbl.Rows[0]["englishe_mid"].ToString(), GeneralTbl.Rows[0]["englishe_level"].ToString(), GeneralTbl.Rows[0]["englishe_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Second language", "100", GeneralTbl.Rows[0]["frensh_mid"].ToString(), GeneralTbl.Rows[0]["frensh_level"].ToString(), GeneralTbl.Rows[0]["frensh_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Science", "100", GeneralTbl.Rows[0]["fezea"].ToString(), GeneralTbl.Rows[0]["fezea_level"].ToString(), GeneralTbl.Rows[0]["fezea"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "English I-L", "100", GeneralTbl.Rows[0]["history"].ToString(), GeneralTbl.Rows[0]["history_level"].ToString(), GeneralTbl.Rows[0]["history"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Religion", "100", GeneralTbl.Rows[0]["deen_mid"].ToString(), GeneralTbl.Rows[0]["deen_level"].ToString(), GeneralTbl.Rows[0]["deen_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Computer", "100", GeneralTbl.Rows[0]["comp_mid"].ToString(), GeneralTbl.Rows[0]["comp_level"].ToString(), GeneralTbl.Rows[0]["comp_mid"].ToString() == "100" ? "images/star.png" : "" });

        GVEditor.DataSource = dt; GVEditor.DataBind();
    }
    private void LoadResult2()
    {
        string Saf = HttpContext.Current.Session["UserSaf"].ToString();  
        string asase_code = LoadDataTable("SELECT MAX(asase_code) FROM asase", "data/asase.mdb").Rows[0][0].ToString();
        DataTable GeneralTbl = LoadDataTable(string.Format(@"SELECT qmid.arabic_level, qmid.math_level, qmid.since_level, qmid.drasat_level, qmid.english_level, qmid.deen_level, 
        qmid.comp_level, qmid.rsm_level, qmid.englishe_level, qmid.frensh_level, qmid.nashat1_level, qmid.nashat2_level, qmid.fezea_level, qmid.history_level, qmid.asase_code, 
        qmid.stu_code, qmid.code_al_fasl, qmid.SPOS, qmid.gloos, qmid.perm, qmid.stu_name, qmid.fasl_code, qmid.alsofof_code, qmid.arabic_mid, qmid.arabic_last, qmid.math_mid, 
        qmid.math_last, qmid.since_mid, qmid.since_last, qmid.drasat_mid, qmid.drasat_last, qmid.english_mid, qmid.english_last, qmid.sum_mid, qmid.sum_last, qmid.deen_mid, 
        qmid.deen_last, qmid.comp_mid, qmid.comp_last, qmid.koran_mid, qmid.koran_last, qmid.rsm_mid, qmid.rsm_last, qmid.englishe_mid, qmid.englishe_last, qmid.frensh_mid, 
        qmid.frensh_last, qmid.nashat1_mid, qmid.nashat1_last, qmid.nashat2_mid, qmid.nashat2_last, qmid.ahiaa, qmid.kemea, qmid.fezea, qmid.history, qmid.geography, 
        qmid.falsafa, qmid.kemea_level FROM qmid WHERE asase_code = {0} AND alsofof_code = {1} AND stu_code = {2}", asase_code, Saf, HttpContext.Current.Session["UserIDst"]), DatabasePath);
        if (GeneralTbl.Rows.Count == 0)
        {
            GVEditor.DataSource = new DataTable(); GVEditor.DataBind();
            return;
        }
        //Get student Information
        lblName.Text = LoadDataTable(@"SELECT stu_name_e FROM student WHERE stu_code = " + GeneralTbl.Rows[0]["stu_code"], "data/dataschool.mdb").Rows[0][0].ToString();
        string imgPath = string.Format(@"data/photo/picstudent/{0}.jpg", GeneralTbl.Rows[0]["stu_code"]);
        if (System.IO.File.Exists(MapPath(imgPath)))
        {
            img.ImageUrl = imgPath;
        }
        DataTable dt = new DataTable();
        dt.Columns.Add("Subject"); dt.Columns.Add("Max"); dt.Columns.Add("StDegree"); dt.Columns.Add("StudentsAverage"); dt.Columns.Add("img");
        dt.Rows.Add(new string[] { "Arabic", "100", GeneralTbl.Rows[0]["arabic_mid"].ToString(), GeneralTbl.Rows[0]["arabic_level"].ToString(), GeneralTbl.Rows[0]["arabic_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Maths", "100", GeneralTbl.Rows[0]["math_mid"].ToString(), GeneralTbl.Rows[0]["math_level"].ToString(), GeneralTbl.Rows[0]["math_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "English O-L", "100", GeneralTbl.Rows[0]["english_mid"].ToString(), GeneralTbl.Rows[0]["english_level"].ToString(), GeneralTbl.Rows[0]["english_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Social studies", "100", GeneralTbl.Rows[0]["drasat_mid"].ToString(), GeneralTbl.Rows[0]["drasat_level"].ToString(), GeneralTbl.Rows[0]["drasat_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Science", "100", GeneralTbl.Rows[0]["since_mid"].ToString(), GeneralTbl.Rows[0]["since_level"].ToString(), GeneralTbl.Rows[0]["since_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Art", "100", GeneralTbl.Rows[0]["rsm_mid"].ToString(), GeneralTbl.Rows[0]["rsm_level"].ToString(), GeneralTbl.Rows[0]["rsm_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "P.E", "100", GeneralTbl.Rows[0]["kemea"].ToString(), GeneralTbl.Rows[0]["kemea_level"].ToString(), GeneralTbl.Rows[0]["kemea"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Activity (1)", "100", GeneralTbl.Rows[0]["nashat1_mid"].ToString(), GeneralTbl.Rows[0]["nashat1_level"].ToString(), GeneralTbl.Rows[0]["nashat1_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Activity (2)", "100", GeneralTbl.Rows[0]["nashat2_mid"].ToString(), GeneralTbl.Rows[0]["nashat2_level"].ToString(), GeneralTbl.Rows[0]["nashat2_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "English A-L", "100", GeneralTbl.Rows[0]["englishe_mid"].ToString(), GeneralTbl.Rows[0]["englishe_level"].ToString(), GeneralTbl.Rows[0]["englishe_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Second language", "100", GeneralTbl.Rows[0]["frensh_mid"].ToString(), GeneralTbl.Rows[0]["frensh_level"].ToString(), GeneralTbl.Rows[0]["frensh_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "English I-L", "100", GeneralTbl.Rows[0]["history"].ToString(), GeneralTbl.Rows[0]["history_level"].ToString(), GeneralTbl.Rows[0]["history"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Religion", "100", GeneralTbl.Rows[0]["deen_mid"].ToString(), GeneralTbl.Rows[0]["deen_level"].ToString(), GeneralTbl.Rows[0]["deen_mid"].ToString() == "100" ? "images/star.png" : "" });
        dt.Rows.Add(new string[] { "Computer", "100", GeneralTbl.Rows[0]["comp_mid"].ToString(), GeneralTbl.Rows[0]["comp_level"].ToString(), GeneralTbl.Rows[0]["comp_mid"].ToString() == "100" ? "images/star.png" : "" });

        GVEditor.DataSource = dt; GVEditor.DataBind();
    }
    public DataTable LoadDataTable(string CommandString, string dbName)
    {
        string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= ";
        HttpServerUtility sv = HttpContext.Current.Server;
        constr += sv.MapPath(dbName);

        DataTable ReturnMe = new DataTable("FX2011-05");
        using (OleDbDataAdapter DA = new OleDbDataAdapter(CommandString, constr))
        {
            try
            {
                DA.Fill(ReturnMe);
            }
            catch { }
        }

        return ReturnMe;
    }//Load Table From Database

}
