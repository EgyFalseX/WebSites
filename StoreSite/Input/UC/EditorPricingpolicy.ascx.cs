using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class EditorPricingpolicy : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadGrid()
    {
        DataTable GridTbl = new DataTable("FX2011-01");
        GridTbl = MC.LoadDataTable(@"SELECT MaterialId, Material, RestorePoint, OutPrice FROM TblMaterialDetiels", "");
        GridViewData.DataSource = GridTbl;
        GridViewData.DataBind();
    }
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!Functions.MC.GetPagePriv(new System.IO.FileInfo(System.Web.HttpContext.Current.Request.Url.AbsolutePath).Name, TheSessions.UserID))
        {
            Response.Redirect("~/AccessDenied.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadGrid();
        }
    }
    protected void GridViewData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewData.PageIndex = e.NewPageIndex;
        LoadGrid();
    }
    protected void ImageButtonEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow row = (GridViewRow)btn.Parent.Parent;
        HiddenField hdMaterialId = (HiddenField)row.FindControl("HiddenFieldEditMaterialId");
        float TxtRestorePoint = MC.ConvertStringToInt(((TextBox)row.FindControl("TxtRestorePoint")).Text);
        float TxtOutPrice = MC.ConvertStringToInt(((TextBox)row.FindControl("TxtOutPrice")).Text);
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update TblMaterialDetiels Set RestorePoint = {0}, OutPrice = {1} Where MaterialId = {2}", TxtRestorePoint, TxtOutPrice, hdMaterialId.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadGrid();
            LblState.Text = "تم التعديل";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();

    }
#endregion
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}