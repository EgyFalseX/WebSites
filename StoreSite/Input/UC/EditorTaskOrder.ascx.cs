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

public partial class EditorTaskOrder : System.Web.UI.UserControl
{
    private void LoadDefaultData()
    {
        DDLServiceTypeId.DataSource = MC.LoadDataTable(@"Select ServiceTypeId, ServiceTypeName From CdServiceType", "");
        DDLServiceTypeId.DataTextField = "ServiceTypeName";
        DDLServiceTypeId.DataValueField = "ServiceTypeId";
        DDLServiceTypeId.DataBind();

        DDLWorker.DataSource = MC.LoadDataTable(@"Select worker_code, worker_name From TBLworkers", "");
        DDLWorker.DataTextField = "worker_name";
        DDLWorker.DataValueField = "worker_code";
        DDLWorker.DataBind();

        DDLPeriod.DataSource = MC.LoadDataTable(@"Select PeriodId, PeriodName From CdPeriod", "");
        DDLPeriod.DataTextField = "PeriodName";
        DDLPeriod.DataValueField = "PeriodId";
        DDLPeriod.DataBind();
    }
    private void LoadData(bool TakeOrder)
    {
        GridViewCom.DataSource = MC.LoadDataTable(@"Select CommId, 
        (Select HeadCompanyName From CdHeadCompany Where HeadCompanyId = TblCommunicationes.HeadCompanyId) AS HeadCompanyName, 
        (Select Customer From TblCustomes Where CustomerId = TblCommunicationes.CustomerId) AS Customer, 
        CONVERT(nvarchar, CommDate, 103) AS CommDate, CONVERT(nvarchar, MaintenanceDate, 103) AS MaintenanceDate, CommDes From TblCommunicationes", "");
        GridViewCom.DataBind();
    }
    private void LoadTaskOrder(string CommId)
    {
        GridViewTaskOrder.DataSource = MC.LoadDataTable(@"Select TaskOrderId, (Select ServiceTypeName From CdServiceType Where ServiceTypeId = TblTaskOrder.ServiceTypeId) AS ServiceTypeName, 
        CONVERT(nvarchar, TaskOrderdate, 103) AS TaskOrderdate From TblTaskOrder Where CommId = " + CommId, "");
        GridViewTaskOrder.DataBind();
    }
    private void LoadTaskWorker(string TaskOrderId)
    {
        GridViewWorker.DataSource = MC.LoadDataTable(@"Select TaskOrderId, workerId, PeriodId, TaskClose, 
        CONVERT(nvarchar, EffectiveDate, 103) AS EffectiveDate, 
        (Select worker_name From TBLworkers Where worker_code = TblTaskrworker.workerId) AS worker_name, 
        (Select PeriodName From CdPeriod Where PeriodId = TblTaskrworker.PeriodId) AS PeriodName From TblTaskrworker Where TaskOrderId = " + TaskOrderId, "");
        GridViewWorker.DataBind();
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
            LoadData(false);
        }
    }
    protected void DDLFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLFilter.SelectedIndex == 0)
            LoadData(false);
        else
            LoadData(true);
        TabContainerDetails.Visible = false;
    }
    protected void GridViewCom_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewCom.SelectedRow;
        HiddenField hf = (HiddenField)row.FindControl("HiddenFieldCommId");
        LoadTaskOrder(hf.Value);
        TabContainerDetails.Visible = true;
        PnlWorker.Visible = false;
    }
    protected void GridViewTaskOrder_SelectedIndexChanged(object sender, EventArgs e)
    {
        PnlWorker.Visible = true;
        GridViewRow row = (GridViewRow)GridViewTaskOrder.SelectedRow;
        HiddenField hfTaskOrderId = (HiddenField)row.FindControl("HiddenFieldTaskOrderId");
        LoadTaskWorker(hfTaskOrderId.Value);
    }
    protected void BtnAddTask_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewCom.SelectedRow;
        HiddenField hf = (HiddenField)row.FindControl("HiddenFieldCommId");
        if (DDLServiceTypeId.SelectedIndex == -1 || TxtTaskOrderdate.Text.Trim().Length == 0 || hf.Value == string.Empty)
        {
            LblState.Text = "من فضلك اكمل البيانات";
            LblState.ForeColor = Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO TblTaskOrder (CommId, ServiceTypeId, TaskOrderdate, TimeIn, UserIn)
            VALUES ({0}, {1}, CONVERT(nvarchar, '{2}', 103), GETDATE(), {3})", hf.Value, DDLServiceTypeId.SelectedValue, TxtTaskOrderdate.Text, TheSessions.UserID);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadTaskOrder(hf.Value);
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void BtnDelTask_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow rowCom = (GridViewRow)GridViewCom.SelectedRow;
        HiddenField hfCommId = (HiddenField)rowCom.FindControl("HiddenFieldCommId");//CommId
        ImageButton btn = (ImageButton)sender;
        GridViewRow row = (GridViewRow)btn.Parent.Parent;
        HiddenField hfTaskOrderId = (HiddenField)row.FindControl("HiddenFieldTaskOrderId");//TaskOrderId
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Delete From TblTaskOrder Where TaskOrderId = {0} AND CommId = {1}", hfTaskOrderId.Value, hfCommId.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadTaskOrder(hfCommId.Value);
            LblState.Text = "تم الحذف";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
        PnlWorker.Visible = false;
    }
    protected void BtnAddWorker_Click(object sender, EventArgs e)
    {
        GridViewRow row = (GridViewRow)GridViewTaskOrder.SelectedRow;
        HiddenField hf = (HiddenField)row.FindControl("HiddenFieldTaskOrderId");
        if (DDLWorker.SelectedIndex == -1 || DDLPeriod.SelectedIndex == -1 || TxtEffectiveDate.Text.Trim().Length == 0 || hf.Value == string.Empty)
        {
            LblState.Text = "من فضلك اكمل البيانات";
            LblState.ForeColor = Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO TblTaskrworker (TaskOrderId, workerId, PeriodId, TaskClose, EffectiveDate, TimeIn, UserIn)
            VALUES ({0}, {1}, {2}, '{3}', CONVERT(nvarchar, '{4}', 103), GETDATE(), {5})", hf.Value, DDLWorker.SelectedValue, DDLPeriod.SelectedValue, CBClose.Checked.ToString(), TxtEffectiveDate.Text, TheSessions.UserID);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadTaskWorker(hf.Value);
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void BtnDelWorker_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow row = (GridViewRow)btn.Parent.Parent;
        HiddenField hfTaskOrderId = (HiddenField)row.FindControl("HiddenFieldTaskOrderId");//TaskOrderId
        HiddenField hfworkerId = (HiddenField)row.FindControl("HiddenFieldworkerId");//workerId
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Delete From TblTaskrworker Where TaskOrderId = {0} AND workerId = {1}", hfTaskOrderId.Value, hfworkerId.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadTaskWorker(hfTaskOrderId.Value);
            LblState.Text = "تم الحذف";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void GridViewCom_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridViewCom.PageIndex = e.NewPageIndex;
        if (DDLFilter.SelectedIndex == 0)
            LoadData(false);
        else
            LoadData(true);
        TabContainerDetails.Visible = false;
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}
