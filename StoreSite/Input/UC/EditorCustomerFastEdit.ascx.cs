using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class EditorCustomerFastEdit : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadDefaultData()
    {
        DataTable CusTbl = new DataTable("FX2010-12");
        if (CBAll.Checked)
            CusTbl = MC.LoadDataTable(@"Select CustomerId, Customer, Customer_phone, Customermobil1, Customermobil2 From TblCustomes");
        else
        {
            if (TxtName.Text.Trim().Length > 0)
                CusTbl = MC.LoadDataTable(string.Format(@"Select CustomerId, Customer, Customer_phone, Customermobil1, Customermobil2 From TblCustomes Where Customer Like '%{0}%'", TxtName.Text));    
        }
        GridViewCus.DataSource = CusTbl;
        GridViewCus.DataBind();
    }
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        MC.GetReadyPageToUse(new System.IO.FileInfo(System.Web.HttpContext.Current.Request.Url.AbsolutePath).Name, "العملاء(تعديل سريع)");
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
            LoadDefaultData();
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        LoadDefaultData();
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            foreach (GridViewRow row in GridViewCus.Rows)
            {
                HiddenField hf = (HiddenField)row.FindControl("HiddenFieldCustomerId");
                if (hf.Value == string.Empty)
                    continue;
                string TxtCustomer_phone = ((TextBox)row.FindControl("TxtCustomer_phone")).Text;
                string TxtCustomermobil1 = ((TextBox)row.FindControl("TxtCustomermobil1")).Text;
                string TxtCustomermobil2 = ((TextBox)row.FindControl("TxtCustomermobil2")).Text;
                if (TxtCustomer_phone != string.Empty)
                    TxtCustomer_phone = String.Format("N'{0}'", TxtCustomer_phone);
                if (TxtCustomermobil1 != string.Empty)
                    TxtCustomermobil1 = String.Format("N'{0}'", TxtCustomermobil1);
                if (TxtCustomermobil2 != string.Empty)
                    TxtCustomermobil2 = String.Format("N'{0}'", TxtCustomermobil2);
                cmd.CommandText = string.Format(@"Update TblCustomes Set Customer_phone = {0}, Customermobil1 = {1}, Customermobil2 = {2} Where CustomerId = {3}",
                TxtCustomer_phone, TxtCustomermobil1, TxtCustomermobil2, hf.Value);
                cmd.ExecuteNonQuery();
            }
            LblState.Text = "تم الحفـــــــــظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    #endregion
    
}