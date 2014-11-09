using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectPageViewer : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string LoadContain()
    {
        if (Request.QueryString["id"] == null)
        {
            return string.Empty;
        }
        string Path = string.Empty;
        string RetData = string.Empty;
        using (OleDbConnection Con = MCfrsan.Connection)
        {
            OleDbDataAdapter da = new OleDbDataAdapter(String.Format("SELECT Data_Path FROM tblproject WHERE (projectid = {0})", Request.QueryString["id"]), Con.ConnectionString);
            DataTable dt = new DataTable();
            try
            {
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Path = dt.Rows[0]["Data_Path"].ToString();
                }
                if (Path != string.Empty)
                    Path = MapPath(Path);
                if (File.Exists(Path))
                {
                    TextReader TR = new StreamReader(Path);
                    RetData = TR.ReadToEnd();
                    TR.Close();
                    TR.Dispose();
                }
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