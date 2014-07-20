using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class EditorContractes : System.Web.UI.UserControl
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
    protected void HiddenFieldCustomerId_ValueChanged(object sender, EventArgs e)
    {
        HiddenField hf = (HiddenField)sender;
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)hf.Parent.Parent.FindControl("RadComboBoxCustomerId");
        RCB.SelectedValue = hf.Value;
    }
    protected void RadComboBoxCustomerId_SelectedIndexChanged(object o, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)o;
        HiddenField hf = (HiddenField)RCB.Parent.Parent.FindControl("HiddenFieldCustomerId");
        hf.Value = RCB.SelectedValue;
    }
    protected void RadComboBoxCustomerId_Load(object sender, EventArgs e)
    {
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)sender;
        DataTable dt = MC.LoadDataTable("SELECT [CustomerId], [Customer] FROM [TblCommercialCustomers]", "");
        RCB.DataSource = dt;
        RCB.DataTextField = "Customer";
        RCB.DataValueField = "CustomerId";
    }
    
}