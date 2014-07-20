using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class BirthDate : System.Web.UI.UserControl
{
    //Ryad Atfal: desoft/database/1/dstudent/dataschool.mdb
    //Abteda2i: desoft/database/2/dstudent/dataschool.mdb
    //A3dadi: desoft/database/3/dstudent/dataschool.mdb
    //Sanawi: desoft/database/4/dstudent/dataschool.mdb

    string ConStr_dataschool = String.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", HttpContext.Current.Server.MapPath(@"../database/all/dataschool.mdb"));
    string ConStr_code = String.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", HttpContext.Current.Server.MapPath(@"../database/all/code.mdb"));
    //string ConStr_dataschool = String.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", HttpContext.Current.Server.MapPath(@"dataschool.mdb"));
    //string ConStr_code = String.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"{0}\";Persist Security Info=True", HttpContext.Current.Server.MapPath(@"code.mdb"));
    private void LoadData()
    {
        OleDbConnection con1 = new OleDbConnection(ConStr_dataschool);
        try
        {
            con1.Open();
            con1.Close();
        }
        catch (OleDbException ex)
        {
            Label6.Text = ex.Message;
        }
        OleDbConnection con2 = new OleDbConnection(ConStr_code);
        try
        {
            con2.Open();
            con2.Close();
        }
        catch (OleDbException ex2)
        {
            Label6.Text += Environment.NewLine +  ex2.Message;
        }
        OleDbDataAdapter da = new OleDbDataAdapter(@"SELECT stu_code, stu_name, Parthday, 
        (Select alsofof_code From student_t Where stu_code = student.stu_code And asase_code = (Select Max(asase_code) From student_t)) AS alsofof_code, 
        (Select fasl_code From student_t Where stu_code = student.stu_code And asase_code = (Select Max(asase_code) From student_t)) AS fasl_code, 
        '' AS alsofof, '' AS fasl, '' AS Pic
        FROM student
        Where Month(Parthday) = Month(date()) And Day(Parthday) = Day(date())", ConStr_dataschool);
        DataTable dt = new DataTable("FX2011-01");
        da.Fill(dt);
        OleDbConnection con = new OleDbConnection(ConStr_code);
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            con.Open();
            foreach (DataRow row in dt.Rows)
            {
                row["Pic"] = String.Format(@"~/desoft/database/photo/picstudent/{0}.jpg", row["stu_code"]);
                if (row["alsofof_code"].ToString() == string.Empty)
                    continue;
                cmd.CommandText = @"Select alsofof_name From alsofof Where alsofof_code = " + row["alsofof_code"].ToString();
                row["alsofof"] = cmd.ExecuteScalar().ToString();
                cmd.CommandText = @"Select fasl_name From fasl Where fasl_code = " + row["fasl_code"].ToString();
                row["fasl"] = cmd.ExecuteScalar().ToString();
                //row["Pic"] = HttpContext.Current.Server.MapPath(String.Format(@"~/pic/{0}.jpg", row["stu_code"]));
                
            }
        }
        catch (OleDbException)
        {
            dt = new DataTable("FX2011-01");
        }
        con.Close();
        DataListStd.DataSource = dt;
        DataListStd.DataBind();
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }
}