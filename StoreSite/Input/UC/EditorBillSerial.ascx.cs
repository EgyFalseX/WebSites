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

public partial class EditorBillSerial : System.Web.UI.UserControl
{
    private void LoadDefaultData()
    {
        DDLBill.DataSource = MC.LoadDataTable(@"SELECT InvIDOut FROM TblOut");
        DDLBill.DataTextField = "InvIDOut";
        DDLBill.DataValueField = "InvIDOut";
        DDLBill.DataBind();
    }
    private static bool IsItSold(string InnerSerial)
    {
        DataTable dt = MC.LoadDataTable(String.Format("Select top(1) OUT From TblWaredSerial Where InnerSerial = N'{0}'", InnerSerial), "");
        if (dt.Rows.Count > 0)
            return (bool)dt.Rows[0][0];
        else
            return true;
    }
    private static bool IsItTrueItem(string InnerSerial, string InvIDOut)
    {
        DataTable dt = MC.LoadDataTable(String.Format(@"if Exists(Select MaterialId From tblOutDetails Where MaterialId = (Select MaterialId From TblWaredSerial Where MaterialId = tblOutDetails.MaterialId AND InnerSerial = N'{0}') 
        AND MaterialId = (Select MaterialId From tblOutDetails Where InvIDOut = {1}))
        select 'True'
        else
        select 'False'", InnerSerial, InvIDOut), "");
        if (dt.Rows.Count > 0)
            return Convert.ToBoolean(dt.Rows[0][0].ToString().ToLower());
        else
            return true;
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
            LoadDefaultData();
        SqlDataSourceCodez.ConnectionString = Functions.MC.ConnectionStr();
    }
    protected void BtnAddSerial_Click(object sender, ImageClickEventArgs e)
    {
        if (DDLBill.SelectedIndex <= 0)
        {
            LblState.Text = "من فضلك اختار فاتوره";
            LblState.ForeColor = Color.Red;
            return;
        }
        if (IsItSold(TxtSerial.Text.Trim()))
        {
            LblState.Text = "سريال خطاء او تم بيعه";
            LblState.ForeColor = Color.Red;
            return;
        }
        if (!IsItTrueItem(TxtSerial.Text.Trim(), DDLBill.SelectedValue))
        {
            LblState.Text = "سريال خطاء او خاص بوحده ليست موجوده بهذه الفاتوره";
            LblState.ForeColor = Color.Red;
            return;
        }
        
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        SqlTransaction tr = null;
        try
        {
            con.Open();
            tr = con.BeginTransaction();
            cmd.Transaction = tr;
            cmd.CommandText = string.Format(@"Select MaterialId From TblWaredSerial Where InnerSerial = N'{0}'", TxtSerial.Text.Trim());
            string MaterialId = cmd.ExecuteScalar().ToString();
            string SerNotNull = MC.LoadDataTable(@"Select SerNotNull From TblMaterialDetiels Where MaterialId = " + MaterialId, "").Rows[0][0].ToString();
            if (SerNotNull == "1")// يجب ادخال سريال المصنع
            {
                string FactorySerial = MC.LoadDataTable(string.Format(@"Select ISNULL(FactorySerial, '0') From TblWaredSerial Where InnerSerial = N'{0}'", TxtSerial.Text.Trim()), "").Rows[0][0].ToString();
                if (FactorySerial == "0")
                {
                    LblState.Text = "يجب ادخال سريال المصنع لهاذا الصنف";
                    LblState.ForeColor = Color.Red;
                    return;
                }
            }
            cmd.CommandText = string.Format(@"SELECT (SELECT ISNULL(OutQty, 0) AS A
            FROM tblOutDetails
            WHERE (MaterialId = {0}) AND (InvIDOut = {1})) -
            (SELECT ISNULL(COUNT(InnerSerial), 0) AS B
            FROM TblSerOut
            WHERE (InvIDOut = {1}) AND (InnerSerial IN
            (SELECT InnerSerial
            FROM TblWaredSerial
            WHERE (MaterialId = {0})))) AS ReturnMe", MaterialId, DDLBill.SelectedValue);
            int Remaining = Convert.ToInt16(cmd.ExecuteScalar());
            if (Remaining <= 0)
            {
                LblState.Text = "لا يمكن اضافة سريال اخر لهذه الوحده";
                LblState.ForeColor = Color.Red;
                con.Close();
                return;
            }
            cmd.CommandText = string.Format(@"Insert into TblSerOut (InnerSerial, InvIDOut, UserIn, TimeIn) VALUES (N'{0}', {1}, {2}, GETDATE())", TxtSerial.Text.Trim(), DDLBill.SelectedValue, TheSessions.UserID);
            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"Update TblWaredSerial Set OUT = 'True' Where InnerSerial = N'{0}'", TxtSerial.Text.Trim());
            cmd.ExecuteNonQuery();
            tr.Commit();
            //SqlDataSourceCodez.DataBind();
            RadGridEditor.Rebind();
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
            TxtSerial.Text = string.Empty;
        }
        catch (SqlException ex)
        {
            tr.Rollback();
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void BtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        GridViewRow row = (GridViewRow)btn.Parent.Parent;
        HiddenField hfInvIDOut = (HiddenField)row.FindControl("HiddenFieldInvIDOut");
        HiddenField hfInnerSerial = (HiddenField)row.FindControl("HiddenFieldInnerSerial");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Delete From TblSerOut Where InnerSerial = N'{0}' AND InvIDOut = {1}", hfInnerSerial, hfInvIDOut);
            con.Open();
            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format("Update TblWaredSerial Set OUT = 'False' Where InnerSerial = N'{0}'", hfInnerSerial);
            cmd.ExecuteNonQuery();
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
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    protected void RadGridEditor_ItemDeleted(object source, Telerik.Web.UI.GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SqlException ex = e.Exception as SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + Functions.MC.CheckExp(ex));
        }
        else
            DisplayMessage("تم الحذف");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format("Update TblWaredSerial Set OUT = 'False' Where InnerSerial = N'{0}'", e.Item["InnerSerial"].Text);
            cmd.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();

        SqlDataSourceCodez.DataBind();
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
}
