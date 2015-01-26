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
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("./App_Data/DataDB.mdb");
    #endregion
    #region -    Functions    -
    public string LoadPage()
    {
        string Path = string.Empty;
        OleDbDataAdapter da = new OleDbDataAdapter("SELECT Data_Path FROM RotatorData Where ID = " + DDLItems.SelectedValue, constr);
        DataTable dt = new DataTable();
        try
        {
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Path = dt.Rows[0]["Data_Path"].ToString();
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
        //DDLItems
    }
    protected void DDLItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLItems.SelectedIndex <= 0)
            return;
        LoadPage();
        LblError.Text = "";
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (DDLItems.SelectedValue.ToString() == "")
        {
            LblError.Text = "من فضلك قم بأختيار خيار من القائمه";
            LblError.ForeColor = System.Drawing.Color.Red;
            LblError.Visible = true;
            return;
        }
        string Path = string.Empty;
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        OleDbDataAdapter da = new OleDbDataAdapter("SELECT Data_Path FROM RotatorData Where ID = " + DDLItems.SelectedValue, constr);
        DataTable dt = new DataTable();
        try
        {
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Path = dt.Rows[0]["Data_Path"].ToString();
            }
            if (Path == string.Empty)
                Path = String.Format("../ItemData/Data{0}{1}{2}{3}.Dat", DDLItems.SelectedValue, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        }
        catch { }
        try
        {
            cmd.CommandText = String.Format("Update RotatorData Set Data_Path = '{0}' Where ID = {1}", Path, DDLItems.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            Path = MapPath(Path);

            File.Create(Path).Close();
            TextWriter TW = new StreamWriter(Path, false);
            TW.Write(Request.Form["editor1"]);
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
    #endregion         #region -   Variables   -

    
}