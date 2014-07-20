using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Functions;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
//using System.Windows.Forms;



public partial class UC_EditorSupplier : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadData()
    {
        DataTable ItemsTbl = new DataTable("Items");
        ItemsTbl = MC.LoadDataTable("SELECT shift_code, shift, shift_Start, shift_End FROM CDATT_sheft", "");
        GridViewHarakaType.DataSource = ItemsTbl;
        GridViewHarakaType.DataBind();
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
            LoadData();
        }
    }
    #endregion
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (TxtName.Text.Trim().Length == 0 || RadTimePickerAddStart.DateInput.Text == string.Empty || RadTimePickerAddEnd.DateInput.Text == string.Empty)
        {
            LblState.Text = "من فضلك اكمل البيانات";
            LblState.ForeColor = Color.Red;
            return;
        }
        string shift_End = MC.ConvertTotimeHHmmss(RadTimePickerAddEnd.SelectedDate.Value.ToShortTimeString());
        string shift_Start = MC.ConvertTotimeHHmmss(RadTimePickerAddStart.SelectedDate.Value.ToShortTimeString());
        if (shift_Start == string.Empty || shift_End == string.Empty)
        {
            LblState.Text = "خطــاء في الوقت";
            LblState.ForeColor = Color.Red;
            return;
        }

        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO CDATT_sheft (shift_code, shift, shift_Start, shift_End)
                                VALUES ({0}, N'{1}', '{2}', '{3}')", MC.GetNewID("CDATT_sheft", "shift_code"), TxtName.Text.Trim(), shift_Start, shift_End);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadData();
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;

            TxtName.Text = string.Empty;
            TxtName.Focus();
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void BtnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow gr = (GridViewRow)btn.Parent.Parent;
        HiddenField shift_code = (HiddenField)gr.FindControl("HiddenFieldshift_code");
        string shift = ((TextBox)gr.FindControl("TxtEditItem")).Text;
        string shift_Start = ((TextBox)gr.FindControl("TxtStart")).Text;
        string shift_End = ((TextBox)gr.FindControl("TxtEnd")).Text;
        shift_Start = MC.ConvertTotimeHHmmss(shift_Start);
        shift_End = MC.ConvertTotimeHHmmss(shift_End);
        if (shift == string.Empty || shift_Start == string.Empty || shift_End == string.Empty)
        {
            LblState.Text = "خطـــــاء في البيانات";
            LblState.ForeColor = Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Update CDATT_sheft Set shift = N'{0}', shift_Start = '{1}', shift_End = '{2}' Where shift_code = {3}",
                                              shift, shift_Start, shift_End, shift_code.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadData();
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
    protected void BtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow gr = (GridViewRow)btn.Parent.Parent;
        HiddenField hf = (HiddenField)gr.FindControl("HiddenFieldshift_code");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Delete From CDATT_sheft Where shift_code = {0}", hf.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadData();
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
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}