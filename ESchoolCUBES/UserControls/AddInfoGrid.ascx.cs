using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;

public partial class UserControls_AddInfoGride : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loaddata();
        }
    }

    public void loaddata()
    {
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbDataAdapter AccessDA = new OleDbDataAdapter("", AccessCon);
        DataTable DTable = new DataTable("DataTable");
        AccessDA.SelectCommand.CommandText = "select * from tb_info";
        AccessDA.Fill(DTable);
        GridViewInfo.DataSource = DTable;
        GridViewInfo.DataBind();
    }

    public string SplitIncomingData()
    {
        DataTable DTable = (DataTable)GridViewInfo.DataSource;
        return null;
    }

    protected void GridViewInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCmd = new OleDbCommand("Delete from tb_info Where id_info= " + GridViewInfo.SelectedDataKey.Value.ToString(), AccessCon);
        try
        {
            AccessCon.Open();
            AccessCmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message.ToString() + "');</script>");
        }
        AccessCon.Close();
        loaddata();
    }

    protected void GridViewInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewInfo.PageIndex = e.NewPageIndex;
        loaddata();
    }
}