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
    public string LoadPage(bool Path1)
    {
        string Path = string.Empty;
        OleDbDataAdapter da = new OleDbDataAdapter("SELECT Data_Path, Data_Path2 FROM MenuItem Where ItemID = " + MainMenu.SelectedValue.ToString(), constr);
        DataTable dt = new DataTable();
        try
        {
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (Path1)
                    Path = dt.Rows[0]["Data_Path"].ToString();
                else
                    Path = dt.Rows[0]["Data_Path2"].ToString();
            }
        }
        catch { }
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
        string Path2 = string.Empty;
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        OleDbDataAdapter da = new OleDbDataAdapter("SELECT Data_Path, Data_Path2 FROM MenuItem Where ItemID = " + MainMenu.SelectedValue.ToString(), constr);
        DataTable dt = new DataTable();
        try
        {
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Path = dt.Rows[0]["Data_Path"].ToString();
                Path2 = dt.Rows[0]["Data_Path2"].ToString();
            }
            if (Path == string.Empty)
                Path = String.Format("../ItemData/Data{0}{1}{2}{3}.Dat", MainMenu.SelectedValue, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
            if (Path2 == string.Empty)
                Path2 = String.Format("../ItemData/Data{0}{1}{2}{3}.Dat", MainMenu.SelectedValue, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second + 1);
        }
        catch { }
        try
        {
            cmd.CommandText = String.Format("Update MenuItem Set Data_Path = '{0}', Data_Path2 = '{1}' Where ItemID = {2}", Path, Path2, MainMenu.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            Path = MapPath(Path);
            Path2 = MapPath(Path2);

            File.Create(Path).Close();
            TextWriter TW = new StreamWriter(Path, false);
            TW.Write(Request.Form["editor1"]);
            TW.Flush();
            TW.Close();

            File.Create(Path2).Close();
            TW = new StreamWriter(Path2, false);
            TW.Write(Request.Form["editor2"]);
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
        con.Close();
    }
    protected void MainMenu_MenuItemClick(object sender, MenuEventArgs e)
    {
        LoadPage(true);
        LoadPage(false);
        LblError.Text = "";
    }
    #endregion         #region -   Variables   -
    
}