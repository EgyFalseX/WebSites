using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class SubjectStudentCreateDetails : System.Web.UI.Page
{
    #region -   Variables   -
    //string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("./data/FlexibleData.mdb");
    #endregion
    #region -    Functions    -
    public string LoadPage()
    {
        string Path = string.Empty;
        OleDbConnection Con = MCfrsan.Connection;

        OleDbCommand CMD = new OleDbCommand("SELECT Data_Path FROM studentall Where autoid = " + Request.QueryString["id"].ToString(), Con);
        try
        {
            Con.Open();
            Path = CMD.ExecuteScalar().ToString();
        }
        catch { }
        Con.Close();
        if (Path == string.Empty)
        {
            return string.Empty;
        }
        Path = MapPath(Path);
        if (!File.Exists(Path))
        {
            return string.Empty;
        }
        else
        {
            TextReader TR = new StreamReader(Path);
            string tt = TR.ReadToEnd().ToString();

            TR.Close();
            TR.Dispose();
            return tt;
        }
    }

    #endregion
    #region - Event Handlers -

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!TheSessionsfrsan.IsAuth)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        if (Request.QueryString["id"] != null)
        {
            if (!IsPostBack)
                txt1.Html = LoadPage();
        }
        else
            Response.Redirect("studentallEditor.aspx");
        
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        
        string Path = string.Empty;
        OleDbConnection Con = MCfrsan.Connection;
        OleDbCommand CMD = new OleDbCommand("SELECT Data_Path FROM studentall Where autoid = " + Request.QueryString["id"].ToString(), Con);
        try
        {
            Con.Open();
            Path = CMD.ExecuteScalar().ToString();

        }
        catch { }
        Con.Close();
        if (Path == string.Empty)
        {
            Path = String.Format("ItemData/Data{0}{1}{2}{3}.Dat", Request.QueryString["id"], DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        }
        try
        {
            CMD.CommandText = String.Format("Update studentall Set Data_Path = '{0}' Where autoid = {1}", Path, Request.QueryString["id"]);
            Con.Open();
            CMD.ExecuteNonQuery();
            Path = MapPath(Path);

            File.Create(Path).Close();
            TextWriter TW = new StreamWriter(Path, false);
            TW.Write(txt1.Html);
            TW.Flush();
            TW.Close();
            LblError.Text = "تم الحفــــظ";
            LblError.ForeColor = System.Drawing.Color.Green;
            LblError.Visible = true;
        }
        catch (Exception ex)
        {
            LblError.Text = ex.Message.ToString();
            LblError.ForeColor = System.Drawing.Color.Red;
            LblError.Visible = true;
        }
        Con.Close();
    }
  
    #endregion
}