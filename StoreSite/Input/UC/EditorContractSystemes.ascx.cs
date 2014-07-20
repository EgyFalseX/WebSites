using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class EditorContractSystemes : UserControl
{
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
        SqlDataSourcepaid.ConnectionString = MC.ConnectionStr();
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
    }
    protected void RadGridEditor_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            if (e.Exception.Message != "String was not recognized as a valid DateTime.")
            {
                e.KeepInEditMode = false;
                e.ExceptionHandled = true;
                DisplayMessage("تم التعديل");
            }
            else
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                SqlException ex = e.Exception as SqlException;
                if (ex == null)
                    DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
                else
                    DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + Functions.MC.CheckExp(ex));
            }
            
        }
        else
            DisplayMessage("تم التعديل");
    }
    protected void RadGridEditor_ItemInserted(object source, Telerik.Web.UI.GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            if (e.Exception.Message != "String was not recognized as a valid DateTime.")
            {
                e.ExceptionHandled = true;
                e.KeepInInsertMode = false;
                DisplayMessage("تم الاضافه");
            }
            else
            {
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
                SqlException ex = e.Exception as SqlException;
                if (ex == null)
                    DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
                else
                    DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + Functions.MC.CheckExp(ex));
            }
        }
        else
            DisplayMessage("تم الاضافه");
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
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    protected void HiddenFieldContractId_ValueChanged(object sender, EventArgs e)
    {
        HiddenField hf = (HiddenField)sender;
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)hf.Parent.Parent.FindControl("RadComboBoxContractId");
        RCB.SelectedValue = hf.Value;
    }
    protected void RadComboBoxContractId_SelectedIndexChanged(object o, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)o;
        HiddenField hf = (HiddenField)RCB.Parent.Parent.FindControl("HiddenFieldContractId");
        hf.Value = RCB.SelectedValue;
    }
    protected void RadComboBoxContractId_Load(object sender, EventArgs e)
    {
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)sender;
        DataTable dt = MC.LoadDataTable(@"SELECT [ContractId],
        CAST(ContractId as nvarchar) + ' / ' +(Select Customer From TblCommercialCustomers Where CustomerId = TblContractes.CustomerId) + ' / ' + CONVERT(nvarchar, ContractDate, 103) + ' / ' + CAST(ValueOrder as nvarchar) AS Details
        FROM [TblContractes]", "");
        RCB.DataSource = dt;
        RCB.DataTextField = "Details";
        RCB.DataValueField = "ContractId";
    }
    protected void SqlDataSourceCodez_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        string ContractId = e.Command.Parameters["@ContractId"].Value.ToString();
        string ValueOrder = MC.LoadDataTable(@"Select ValueOrder From TblContractes Where ContractId = " + ContractId , "").Rows[0][0].ToString();
        string Added = MC.LoadDataTable(@"Select ISNULL(Sum(SystemValue), 0) From TblContractSystemes Where ContractId = " + ContractId, "").Rows[0][0].ToString();
        if (e.Command.Parameters["@SystemValue"].Value == string.Empty)
        {
            e.Cancel = true;
            DisplayMessage("لا يمكن اضافة قيمه فارغه");
            return;
        }
        if ((Convert.ToSingle(e.Command.Parameters["@SystemValue"].Value) + Convert.ToSingle(Added)) > Convert.ToSingle(ValueOrder))
        {
            e.Cancel = true;
            DisplayMessage("لا يمكن اضافة قيم انظمه اكبر من قيمة العقد");
            return;
        }
        DateTime ContractDate = DateTime.Parse(MC.LoadDataTable(@"Select ContractDate From TblContractes Where ContractId = " + ContractId, "").Rows[0][0].ToString());
        DateTime LastDate = DateTime.Parse(e.Command.Parameters["@LastDate"].Value.ToString());
        if (ContractDate < LastDate)
        {
            e.Cancel = true;
            DisplayMessage("تاريخ اخر سحب يجب ان يكون اصغر من تاريخ العقد " + ContractDate.ToShortDateString() + " لم ");
            return;
        }
    }
}