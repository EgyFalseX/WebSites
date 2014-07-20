using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;

public partial class TreeEditor : System.Web.UI.Page
{
    #region -   Variables   -
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("~/App_Data/Data.mdb");
    #endregion
    #region -    Functions    -
    public string LoadPage()
    {
        DSDataContains.SelectParameters[0].DefaultValue = treeList.FocusedNode["ID"].ToString(); 
        DataView DV = (DataView)DSDataContains.Select(DataSourceSelectArguments.Empty);
        if (DV.Count > 0)
            return DV[0]["Contains"].ToString();
        else
            return string.Empty;
        
        //string Path = string.Empty;
        //OleDbConnection Con = new OleDbConnection(constr);
        //OleDbCommand CMD = new OleDbCommand("SELECT Data_Path FROM MenuItem Where ItemID = " + MainMenu.SelectedValue.ToString(), Con);
        //try
        //{
        //    Con.Open();
        //    Path = CMD.ExecuteScalar().ToString();

        //}
        //catch { }
        //Con.Close();
        //if (Path == string.Empty)
        //{
        //    //HtmlEditorQA.Html = string.Empty;
        //    return string.Empty;
        //}
        //Path = MapPath(Path);
        //if (!File.Exists(Path))
        //{
        //    return string.Empty;
        //}
        //else
        //{
        //    TextReader TR = new StreamReader(Path);
        //    string tt = TR.ReadToEnd().ToString();

        //    TR.Close();
        //    TR.Dispose();
        //    return tt;
        //}
    }

    #endregion
    #region - Event Handlers -

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        LblError.Text = string.Empty;

        if (treeList.FocusedNode == null)
            return;

        DSDataContains.UpdateParameters["Contains"].DefaultValue = Request.Form["editor1"].ToString();
        DSDataContains.UpdateParameters["ID"].DefaultValue = treeList.FocusedNode["ID"].ToString();

        DSDataContains.Update();

        LblError.Text = "Data Saved ...";
        LblError.ForeColor = System.Drawing.Color.Green;
    }
    #endregion         #region -   Variables   -
    protected void treeList_FocusedNodeChanged(object sender, EventArgs e)
    {
        LblError.Text = string.Empty;
        if (treeList.FocusedNode == null)
            return;
        LoadPage();
    }
}