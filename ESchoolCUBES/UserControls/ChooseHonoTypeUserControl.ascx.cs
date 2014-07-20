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

public partial class NewUserControl_ChooseHonoTypeUserControl : System.Web.UI.UserControl
{
    public OleDbDataAdapter AccessDA = new OleDbDataAdapter("", MySchool.ServicesConnection);
    public bool IsStudent, IsTeacher;
    public string STDID, EMPID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["STID"] == null)
        { IsStudent = false; }
        else
        {
            IsStudent = true;
            STDID = HttpContext.Current.Session["STID"].ToString();
        }
        if (HttpContext.Current.Session["EMPID"] == null)
        { IsTeacher = false; }
        else
        {
            IsTeacher = true;
            EMPID = HttpContext.Current.Session["EMPID"].ToString();
        }
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
    protected void RBLHonorTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RBLHonorTypes.SelectedValue == "1")
        {
            DDLAllHonorTypes.Enabled = true;
        }
        else
        {
            DDLAllHonorTypes.Enabled = false;
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        if (RBLHonorTypes.SelectedValue == "1")
        {
            if (IsStudent || IsTeacher)
            {
                Response.Redirect("~/HonorBoardShow.aspx?TypeID=" + DDLAllHonorTypes.SelectedValue.ToString());
            }
        }
        else if (RBLHonorTypes.SelectedValue == "2")
        {
            Response.Redirect("~/HonorBoardShow.aspx?TypeID=ALL");
        }
    }
}
