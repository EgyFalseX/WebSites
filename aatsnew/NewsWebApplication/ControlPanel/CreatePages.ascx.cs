using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class CreatePages : System.Web.UI.UserControl
{
   
    #region -   Variables   - 
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("~/App_Data/News.mdb");
    #endregion
    #region -    Functions    -
    private DataTable LoadData()
    {
        DataTable dt = new DataTable("FX2012");
        using (OleDbDataAdapter da = new OleDbDataAdapter("SELECT Contain FROM NewsData ORDER BY ID", constr))
        {
            da.Fill(dt);
        }
        return dt;
    }
    public string LoadPage()
    {
        string Path = string.Empty;
        OleDbConnection Con = new OleDbConnection(constr);

        OleDbCommand CMD = new OleDbCommand("SELECT Contain FROM NewsData Where ID = " + Request.QueryString["ID"].ToString(), Con);
        try
        {
            Con.Open();
            Path = CMD.ExecuteScalar().ToString();

        }
        catch { }
        Con.Close();
        if (Path == string.Empty)
        {
            //HtmlEditorQA.Html = string.Empty;
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
        //MainMenu
        if (!IsPostBack)
        {
            //foreach (DataRow row in LoadData().Rows)
            //{
            //    MenuItem item = new MenuItem(row["ItemName"].ToString(), row["ItemID"].ToString());
            //    MainMenu.Items.Add(item);
            //}
            //cb.DataSource = LoadData();
            txt1.Html = LoadPage();
            LblError.Text = "";
        }
        if (Request.QueryString["ID"] == null)
        {
            Response.Redirect("CPNews.aspx");
        }
        
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        
        string Path = string.Empty;
        OleDbConnection Con = new OleDbConnection(constr);
        OleDbCommand CMD = new OleDbCommand("SELECT Contain FROM NewsData Where ID = " + Request.QueryString["ID"].ToString(), Con);
        try
        {
            Con.Open();
            Path = CMD.ExecuteScalar().ToString();

        }
        catch { }
        Con.Close();
        if (Path == string.Empty)
        {
            //Path = MapPath("~/QAData/QAData" + QAMainMenu.SelectedValue.ToString() + ".QA");
            if (!Directory.Exists(MapPath("../ItemData/")))
            {
                Directory.CreateDirectory(MapPath("../ItemData/"));
            }
            Path = String.Format("../ItemData/Data{0}{1}{2}{3}.Dat", Request.QueryString["ID"], DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        }
        try
        {
            CMD.CommandText = String.Format("Update NewsData Set Contain = '{0}' Where ID = {1}", Path, Request.QueryString["ID"]);
            Con.Open();
            CMD.ExecuteNonQuery();
            Path = MapPath(Path);
            //if (File.Exists(Path))
            //{
            //    File.Delete(Path);
            //}
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
    protected void MainMenu_MenuItemClick(object sender, MenuEventArgs e)
    {
        txt1.Html = LoadPage();
        LblError.Text = "";
    }
    protected void ASPxComboBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txt1.Html = LoadPage();
        LblError.Text = "";
    }
    #endregion
    
}