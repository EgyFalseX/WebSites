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
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("./data/FlexibleData.mdb");
    #endregion
    #region -    Functions    -
    private DataTable LoadData()
    {
        DataTable dt = new DataTable("FX2012");
        using (OleDbDataAdapter da = new OleDbDataAdapter("SELECT ItemID, ItemName, Show_Hide, Data_Path FROM MenuItem ORDER BY ItemID", constr))
        {
            da.Fill(dt);
        }
        return dt;
    }
    public string LoadPage()
    {
        string Path = string.Empty;
        OleDbConnection Con = new OleDbConnection(constr);
        OleDbCommand CMD = new OleDbCommand("SELECT Data_Path FROM MenuItem Where ItemID = " + MainMenu.SelectedValue.ToString(), Con);
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
            foreach (DataRow row in LoadData().Rows)
            {
                MenuItem item = new MenuItem(row["ItemName"].ToString(), row["ItemID"].ToString());
                MainMenu.Items.Add(item);
            }
        }
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (MainMenu.SelectedValue.ToString() == "")
        {
            LblError.Text = "من فضلك قم بأختيار خيار من القائمه";
            LblError.ForeColor = System.Drawing.Color.Red;
            LblError.Visible = true;
        }
        string Path = string.Empty;
        OleDbConnection Con = new OleDbConnection(constr);
        OleDbCommand CMD = new OleDbCommand("SELECT Data_Path FROM MenuItem Where ItemID = " + MainMenu.SelectedValue.ToString(), Con);
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
            Path = String.Format("../ItemData/Data{0}{1}{2}{3}.Dat", MainMenu.SelectedValue, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        }
        try
        {
            CMD.CommandText = String.Format("Update MenuItem Set Data_Path = '{0}' Where ItemID = {1}", Path, MainMenu.SelectedValue);
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
    #endregion         #region -   Variables   -
    
}