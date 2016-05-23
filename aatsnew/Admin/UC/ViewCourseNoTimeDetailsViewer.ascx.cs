using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using System.IO;

public partial class ViewCourseNoTimeDetailsViewer : System.Web.UI.UserControl
{
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("~/App_Data/AATSWEB.mdb");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string LoadContain()
    {
        if (Request.QueryString["CourseId"] == null)
        {
            return string.Empty;
        }
        

        string ThePath = string.Empty;
        string RetData = string.Empty;
        using (OleDbConnection Con = new OleDbConnection(constr))
        {
            OleDbCommand cmd = new OleDbCommand(String.Format("SELECT TOP 1 DataPath FROM CoursenotimeDataPath WHERE CourseId = {0}", Request.QueryString["CourseId"]), Con);
            try
            {
                Con.Open();
                ThePath = cmd.ExecuteScalar().ToString();
                //if (ThePath != string.Empty)
                //    ThePath = MapPath(DB.CourseNoTimeFileDir + ThePath);
                ThePath = DB.CourseNoTimeFileDir + ThePath;
                
                TextReader TR = new StreamReader(ThePath);
                RetData = TR.ReadToEnd();
                TR.Close();
                TR.Dispose();

            }
            catch (Exception ex)
            {
                RetData = ex.Message;
            }
            Con.Close();
        }

        return HttpUtility.HtmlDecode(RetData);

    }
}