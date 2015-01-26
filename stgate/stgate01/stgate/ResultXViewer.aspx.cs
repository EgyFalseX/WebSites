using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class ResultXViewer : System.Web.UI.Page
{
    static string DatabasePath = "data/2/Datanet.mdb";
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        lblName.Text = string.Empty;
        img.ImageUrl = @"images\st_empty.png";
        string Saf = cbSaf.Value.ToString(); string Gloos = tbGloos.Value.ToString();
        string asase_code = LoadDataTable("SELECT MAX(asase_code) FROM asase", "data/asase.mdb").Rows[0][0].ToString();
        DataTable GeneralTbl = LoadDataTable(string.Format(@"SELECT stu_code, arabic_mid, math_mid, english_mid, rsm_mid, kemea, nashat1_mid, nashat2_mid,
        englishe_mid, frensh_mid, fezea, history, deen_mid, comp_mid FROM mid_last WHERE mid_last.asase_code = {0} 
        AND mid_last.alsofof_code = {1} AND mid_last.gloos = {2}", asase_code, Saf, Gloos), DatabasePath);
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
        dt.Columns.Add("Subject"); dt.Columns.Add("Max"); dt.Columns.Add("StDegree");
        dt.Rows.Add(new string[] { "Arabic", "100", GeneralTbl.Rows[0]["arabic_mid"].ToString() });
        dt.Rows.Add(new string[] { "Maths", "100", GeneralTbl.Rows[0]["math_mid"].ToString() });
        dt.Rows.Add(new string[] { "English O-L", "100", GeneralTbl.Rows[0]["english_mid"].ToString() });
        dt.Rows.Add(new string[] { "Art", "100", GeneralTbl.Rows[0]["rsm_mid"].ToString() });
        dt.Rows.Add(new string[] { "P.E", "100", GeneralTbl.Rows[0]["kemea"].ToString() });
        dt.Rows.Add(new string[] { "Activity (1)", "100", GeneralTbl.Rows[0]["nashat1_mid"].ToString() });
        dt.Rows.Add(new string[] { "Activity (2)", "100", GeneralTbl.Rows[0]["nashat2_mid"].ToString() });
        dt.Rows.Add(new string[] { "English A-L", "100", GeneralTbl.Rows[0]["englishe_mid"].ToString() });
        dt.Rows.Add(new string[] { "Second language", "100", GeneralTbl.Rows[0]["frensh_mid"].ToString() });
        dt.Rows.Add(new string[] { "Science", "100", GeneralTbl.Rows[0]["fezea"].ToString() });
        dt.Rows.Add(new string[] { "English I-L", "100", GeneralTbl.Rows[0]["history"].ToString() });
        dt.Rows.Add(new string[] { "Religion", "100", GeneralTbl.Rows[0]["deen_mid"].ToString() });
        dt.Rows.Add(new string[] { "Computer", "100", GeneralTbl.Rows[0]["comp_mid"].ToString() });

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
