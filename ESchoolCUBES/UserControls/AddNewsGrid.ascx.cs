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

public partial class UserControls_AddNewsGride : System.Web.UI.UserControl
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
        AccessDA.SelectCommand.CommandText = "select * from news";
        AccessDA.Fill(DTable);
        GridViewNews.DataSource = DTable;
        GridViewNews.DataBind();
        //Response.Write("<script>alert('" + DTable.Rows.Count.ToString() + "');</script>");
    }

    public string SplitIncomingData()
    {
        DataTable DTable = (DataTable)GridViewNews.DataSource;
        return null;
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Response.Write("<script>alert('" +GridView2.SelectedDataKey.Value+"');</script>");
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCmd = new OleDbCommand("Delete from news Where code_news= " + GridViewNews.SelectedDataKey.Value.ToString(), AccessCon);
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
        //Response.Redirect("AddNews.aspx");
    }

    protected void GridView2_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow GVR in GridViewNews.Rows)
        {
            HiddenField HF = (HiddenField)GVR.FindControl("HiddenField2");

            CheckBox CB = (CheckBox)GVR.FindControl("CheckBox1");
            if (HF.Value.ToString() == "1")
            {
                CB.Checked = true;
            }
            else
            {
                CB.Checked = false;
            }
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox CB = (CheckBox)sender;
        GridViewRow GVR = (GridViewRow)CB.Parent.Parent;
        HiddenField HF = (HiddenField)GVR.FindControl("HiddenField1");
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        OleDbCommand AccessCmd;
        if (CB.Checked)
        {
            AccessCmd = new OleDbCommand("Update news Set id_starting = 1 Where code_news =" + HF.Value.ToString(), AccessCon);
        }
        else
        {
            AccessCmd = new OleDbCommand("Update news Set id_starting = 2 Where code_news =" + HF.Value.ToString(), AccessCon);
        }
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

    protected void GridViewNews_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        GridViewNews.PageIndex = e.NewPageIndex;
        loaddata();
    }
}
