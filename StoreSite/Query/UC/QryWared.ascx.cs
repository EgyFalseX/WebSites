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

public partial class QryWared : System.Web.UI.UserControl
{
    private void LoadDefaultData()
    {
        DataTable dt = new DataTable("FX2011-01");
        dt = MC.LoadDataTable("Select SupplierId, Supplier From TblSuppliers");
        DDLSup.DataSource = dt;
        DDLSup.DataTextField = "Supplier";
        DDLSup.DataValueField = "SupplierId";
        DDLSup.DataBind();

    }
    private void LoadGrid()
    {
        //" IN (1)"
        //" <> - 1"
        string SupplierId = (string)ViewState["SupplierId"];
        string DateFrom = (string)ViewState["DateFrom"];
        string DateTo = (string)ViewState["DateTo"];
        DataTable dt = new DataTable("FX2011-01");
        if (SupplierId == string.Empty)
        {
            dt = MC.LoadDataTable(string.Format(@"SELECT TblWareddetails.InvIDIn, TblWareddetails.MaterialId, TblWareddetails.UnitPriceIn, TblWareddetails.InQty, 
        TblWareddetails.UnitPriceIn * TblWareddetails.InQty AS Total, TblWared.SupplierId,
        (Select Material From TblMaterialDetiels Where MaterialId = TblWareddetails.MaterialId) AS Material,
        (SELECT Supplier FROM TblSuppliers WHERE (SupplierId = TblWared.SupplierId)) AS Supplier, TblWared.DateIn
        FROM TblWared INNER JOIN TblWareddetails ON TblWared.InvIDIn = TblWareddetails.InvIDIn WHERE (TblWared.SupplierId {0}) AND (CONVERT(DATETIME, TblWared.DateIn, 20) 
        BETWEEN CONVERT(DATETIME, '{1}', 20) AND CONVERT(DATETIME, '{2}', 20))", " <> - 1", DateFrom, DateTo), "");
        }
        else
        {
            SupplierId = string.Format(@" IN ({0}) ", SupplierId);
            dt = MC.LoadDataTable(string.Format(@"SELECT TblWareddetails.InvIDIn, TblWareddetails.MaterialId, TblWareddetails.UnitPriceIn, TblWareddetails.InQty, 
        TblWareddetails.UnitPriceIn * TblWareddetails.InQty AS Total, TblWared.SupplierId,
        (Select Material From TblMaterialDetiels Where MaterialId = TblWareddetails.MaterialId) AS Material,
        (SELECT Supplier FROM TblSuppliers WHERE (SupplierId = TblWared.SupplierId)) AS Supplier, TblWared.DateIn
        FROM TblWared INNER JOIN TblWareddetails ON TblWared.InvIDIn = TblWareddetails.InvIDIn WHERE (TblWared.SupplierId {0}) AND (CONVERT(DATETIME, TblWared.DateIn, 20) 
        BETWEEN CONVERT(DATETIME, '{1}', 20) AND CONVERT(DATETIME, '{2}', 20))", SupplierId, DateFrom, DateTo), "");
        }
        if (dt.Rows.Count != 0)//Calc Sum of Total
            ViewState["GetTotal"] = dt.Compute("Sum(Total)", "").ToString();
        else
            ViewState["GetTotal"] = "0";
        GridViewResult.DataSource = dt;
        GridViewResult.DataBind();
    }
    public string GetTotal()
    {
        return ViewState["GetTotal"].ToString();
    }
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
            LoadDefaultData();
        }
    }
    protected void GridViewResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewResult.PageIndex = e.NewPageIndex;
        LoadGrid();
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        if (TxtDateStart.Text.Trim().Length == 0 || TxtDateEnd.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل تاريخ بداية و نهاية البحث";
            LblState.ForeColor = Color.Red;
            return;
        }
        ViewState["SupplierId"] = DDLSup.SelectedValue;
        ViewState["DateFrom"] = MC.ConvertToDateDMY(TxtDateStart.Text.Trim());
        ViewState["DateTo"] = MC.ConvertToDateDMY(TxtDateEnd.Text.Trim());
        LoadGrid();
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}