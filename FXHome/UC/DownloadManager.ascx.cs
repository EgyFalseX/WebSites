using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class DownloadManager : System.Web.UI.UserControl
{
    
    #region -   Functions   -
    private void LoadData()
    {
        DDLDownloads.DataSource = Main.LoadTable(@"Select LinkID, LinkName, LinkURL From Downloads");
        DDLDownloads.DataBind();
        ViewState["dt"] = DDLDownloads.DataSource;
    }
    private void ShowMsg(string msg, bool isError)
    {
        if (isError)
        {
            LblResult.Text = msg;
            LblResult.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            LblResult.Text = msg;
            LblResult.ForeColor = System.Drawing.Color.Green;
        }
    }
    #endregion
    #region - Event Handlers -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    protected void DDLDownloads_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataRow row = ((DataTable)ViewState["dt"]).Rows[DDLDownloads.SelectedIndex];
        TxtEditName.Text = row["LinkName"].ToString();
        TxtEditFileName.Text = row["LinkURL"].ToString();
    }
    protected void BtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        LblResult.Text = string.Empty;

        SqlConnection con = Main.GetConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"Insert Into Downloads (LinkName, LinkURL, UpdateDate) VALUES (N'{0}', N'{1}', GETDATE())", TxtAddName.Text, TxtAddFileName.Text);
            cmd.ExecuteNonQuery();
            ShowMsg("تم الاضافه", false);
        }
        catch (SqlException ex)
        {
            ShowMsg(ex.Message, true);
        }
        con.Close();
        LoadData();
    }
    protected void BtnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        LblResult.Text = string.Empty;

        SqlConnection con = Main.GetConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"Update Downloads Set LinkName = N'{0}', LinkURL = N'{1}', UpdateDate = GETDATE() Where LinkID = {2}", TxtEditName.Text, TxtEditFileName.Text, DDLDownloads.SelectedValue);
            cmd.ExecuteNonQuery();
            ShowMsg("تم التعديل", false);

        }
        catch (SqlException ex)
        {
            ShowMsg(ex.Message, true);
        }
        con.Close();
        LoadData();
    }
    protected void BtnDel_Click(object sender, ImageClickEventArgs e)
    {
        LblResult.Text = string.Empty;

        SqlConnection con = Main.GetConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"Delete From Downloads Where LinkID = {0}", DDLDownloads.SelectedValue);
            cmd.ExecuteNonQuery();
            ShowMsg("تم الحذف", false);

        }
        catch (SqlException ex)
        {
            ShowMsg(ex.Message, true);
        }
        con.Close();
        LoadData();
    }
    #endregion         #region -   Variables   -

}