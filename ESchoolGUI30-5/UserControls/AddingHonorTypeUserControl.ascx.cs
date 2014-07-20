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

public partial class NewUserControl_AddingHonorTypeUserControl : System.Web.UI.UserControl
{
    public OleDbDataAdapter AccessDA = new OleDbDataAdapter("",  MySchool.ServicesConnection);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAllTypes();
        }
    }
    private void LoadAllTypes()
    {
        AccessDA.SelectCommand.CommandText = "Select * from Honor_board";
        DataTable Honor_board = new DataTable("Honor board");
        AccessDA.Fill(Honor_board);
        DDLAllHonorTypes.DataSource = Honor_board;
        DDLAllHonorTypes.DataTextField = "name_Honor_board";
        DDLAllHonorTypes.DataValueField = "Code_Honor_board";
        DDLAllHonorTypes.DataBind();
    }

    protected void BtnAddHonorType_Click(object sender, EventArgs e)
    {
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        try
        {
            OleDbCommand AccessCMD = new OleDbCommand("Insert Into Honor_board (name_Honor_board,kind_Honor_board) VALUES ('" + TxtHonorTypeName.Text + "'," + DDLDependent.SelectedValue.ToString() + ")", AccessCon);
            AccessCon.Open();
            AccessCMD.ExecuteNonQuery();
        }
        catch { }
        AccessCon.Close();
        LoadAllTypes();
    }

    protected void BtnDeleteType_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('..تم حذف النوع');</script>");
        OleDbConnection AccessCon = MySchool.ServicesConnection;
        try
        {
            OleDbCommand AccessCMD = new OleDbCommand("Delete From Honor_board Where Code_Honor_board = " + DDLAllHonorTypes.SelectedValue.ToString(), AccessCon);
            AccessCon.Open();
            AccessCMD.ExecuteNonQuery();
        }
        catch { }
        AccessCon.Close();
        LoadAllTypes();
    }
}
