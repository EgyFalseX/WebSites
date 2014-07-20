using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Functions;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class EditorUserAtt : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadData()
    {
        DataTable ItemsTbl = new DataTable("Items");
        ItemsTbl = MC.LoadDataTable(@"SELECT EmpID, shift_code, hedor_time_Start, hedor_time_End, enseraf_time_Start, enseraf_time_End, 
                                      (Select shift From CDATT_sheft Where shift_code = ATT_Company_Emp.shift_code) AS shift, 
                                      (Select EmpName From TblEmp Where EmpID = ATT_Company_Emp.EmpID) AS EmpName
                                      FROM ATT_Company_Emp", "");
        GridViewEmpShift.DataSource = ItemsTbl;
        GridViewEmpShift.DataBind();
    }
    private void LoadDefaultData()
    {
        DataTable EmpTbl = new DataTable("Emp");
        EmpTbl = MC.LoadDataTable(@"Select EmpID, EmpName From TblEmp");
        DDLEmp.DataSource = EmpTbl;
        DDLEmp.DataTextField = "EmpName";
        DDLEmp.DataValueField = "EmpID";
        DDLEmp.DataBind();

        DataTable ShiftTbl = new DataTable("shift");
        ShiftTbl = MC.LoadDataTable(@"Select shift_code, shift From CDATT_sheft");
        DDLShift.DataSource = ShiftTbl;
        DDLShift.DataTextField = "shift";
        DDLShift.DataValueField = "shift_code";
        DDLShift.DataBind();
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
            LoadDefaultData();
            LoadData();
        }
    }
    protected void BtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (DDLEmp.SelectedIndex <= 0 || DDLShift.SelectedIndex <= 0 || RTPhedor_time_Start.DateInput.Text == string.Empty || RTPhedor_time_End.DateInput.Text == string.Empty || RTPenseraf_time_Start.DateInput.Text == string.Empty || RTPenseraf_time_End.DateInput.Text == string.Empty)
        {
            LblState.Text = "من فضلك اكمل البيانات";
            LblState.ForeColor = Color.Red;
            return;
        }
        string hedor_time_Start = MC.ConvertTotimeHHmmss(RTPhedor_time_Start.SelectedDate.Value.ToShortTimeString());
        string hedor_time_End = MC.ConvertTotimeHHmmss(RTPhedor_time_End.SelectedDate.Value.ToShortTimeString());
        string enseraf_time_Start = MC.ConvertTotimeHHmmss(RTPenseraf_time_Start.SelectedDate.Value.ToShortTimeString());
        string enseraf_time_End = MC.ConvertTotimeHHmmss(RTPenseraf_time_End.SelectedDate.Value.ToShortTimeString());
        if (hedor_time_Start == string.Empty || hedor_time_End == string.Empty || enseraf_time_Start == string.Empty || enseraf_time_End == string.Empty)
        {
            LblState.Text = "خطـــــاء في الاوقات";
            LblState.ForeColor = Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO ATT_Company_Emp (EmpID, shift_code, hedor_time_Start, hedor_time_End, enseraf_time_Start, enseraf_time_End)
                                VALUES ({0}, {1}, '{2}', '{3}', '{4}', '{5}')", DDLEmp.SelectedValue, DDLShift.SelectedValue, hedor_time_Start, hedor_time_End, enseraf_time_Start, enseraf_time_End);
            con.Open();
            cmd.ExecuteNonQuery();
            RTPhedor_time_Start.SelectedDate = null;
            RTPhedor_time_End.SelectedDate = null;
            RTPenseraf_time_Start.SelectedDate = null;
            RTPenseraf_time_End.SelectedDate = null;
            LoadData();
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
    protected void BtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow gr = (GridViewRow)btn.Parent.Parent;
        HiddenField shift_code = (HiddenField)gr.FindControl("HiddenFieldshift_code");
        HiddenField EmpID = (HiddenField)gr.FindControl("HiddenFieldEmpID");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Delete From ATT_Company_Emp Where EmpID = {0} AND shift_code = {1}", EmpID.Value, shift_code.Value);
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
    #endregion
}