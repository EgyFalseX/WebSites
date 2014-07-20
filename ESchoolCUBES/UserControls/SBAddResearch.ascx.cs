using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

public partial class UserControls_SBAddResearch : System.Web.UI.UserControl
{
    string StuID = string.Empty;
    string SPOS = string.Empty;
    string asase_code = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.StudentID == null)
        {
            BtnSaveResearch.Enabled = false;
        }
        else
        {
            asase_code = Login.CurrentYear.ToString();
            SPOS = Login.CurrentSchool.ToString();
            StuID = TheSessions.StudentID.ToString();
            //StuID = "1416002096";
        }
    }
    protected void BtnSaveResearch_Click(object sender, EventArgs e)
    {
        if (TxtResearchSubject.Text == string.Empty)
        {
            LblResearchError.Text = "من فضلك املاء البيانات";
            LblResearchError.Visible = true;
            return;
        }
        try
        {
            string search_code = string.Empty;
            OleDbConnection Con = MySchool.LibraryConnection;
            OleDbCommand CMD = new OleDbCommand("Select TOP 1 MAX(search_code) From search1", Con);
            OleDbDataReader DR;
            string SavingFileName = string.Empty;
            
            if (FileUploadResearch.HasFile)
            {
                SavingFileName = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadResearch.FileName.ToString();
                FileUploadResearch.SaveAs(HttpContext.Current.Server.MapPath("ResearchsFiles\\") + SavingFileName);
                SavingFileName = "~/ResearchsFiles/" + SavingFileName;
            }
            Con.Open();
            DR = CMD.ExecuteReader();
            if (DR.Read())
            {
                search_code = DR.GetValue(0).ToString();
                DR.Close();
                search_code = (Convert.ToInt16(search_code) + 1).ToString();
                CMD.CommandText = "Insert Into search (search_code,SPOS,asase_code,[date],subject,aim_search,Show,RelatedFile) VALUES (" + search_code + "," + SPOS + "," + asase_code + ",#" + TxtResearchDate.Text + "#,'" + TxtResearchSubject.Text + "','" + TxtAim.Text + "',0,'" + SavingFileName + "')";
                CMD.ExecuteNonQuery();
                LblResearchError.Text = "تم اضافة البحث";
                LblResearchError.ForeColor = System.Drawing.Color.Green;
                LblResearchError.Visible = true;
            }
            else
            {
                search_code = "0";
                CMD.CommandText = "Insert Into search (search_code,SPOS,asase_code,[date],subject,aim_search,Show,RelatedFile) VALUES (1," + SPOS + "," + asase_code + ",#" + TxtResearchDate.Text + "#,'" + TxtResearchSubject.Text + "','" + TxtAim.Text + "',0,'" + SavingFileName + "')";
                CMD.ExecuteNonQuery();
                LblResearchError.Text = "تم اضافة البحث";
                LblResearchError.ForeColor = System.Drawing.Color.Green;
                LblResearchError.Visible = true;
            }
            CMD.CommandText = "Insert Into search1 (search_code, code_name) VALUES (" + search_code + ", " + StuID + ")";
            CMD.ExecuteNonQuery();
            Con.Close();
        }
        catch (Exception ex)
        {
            LblResearchError.Text = ex.Message.ToString();
            LblResearchError.ForeColor = System.Drawing.Color.Red;
            LblResearchError.Visible = true;
        }
    }
}
