using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class EditorPricelists : System.Web.UI.UserControl
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
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            SqlException ex = e.Exception as SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + Functions.MC.CheckExp(ex));
            
        }
        else
            DisplayMessage("تم التعديل");
    }
    protected void RadGridEditor_ItemInserted(object source, Telerik.Web.UI.GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            SqlException ex = e.Exception as SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + Functions.MC.CheckExp(ex));
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
    protected void HiddenFieldCategoryId_ValueChanged(object sender, EventArgs e)
    {
        HiddenField hf = (HiddenField)sender;
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)hf.Parent.Parent.FindControl("RadComboBoxCategoryId");
        RCB.SelectedValue = hf.Value;
    }
    protected void RadComboBoxCategoryId_SelectedIndexChanged(object o, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)o;
        HiddenField hf = (HiddenField)RCB.Parent.Parent.FindControl("HiddenFieldCategoryId");
        hf.Value = RCB.SelectedValue;
    }
    protected void RadComboBoxCategoryId_Load(object sender, EventArgs e)
    {
        Telerik.Web.UI.RadComboBox RCB = (Telerik.Web.UI.RadComboBox)sender;
        DataTable dt = MC.LoadDataTable("SELECT [CategoryId], [Category] FROM [CdCategory] Where parentID > 0", "");
        RCB.DataSource = dt;
        RCB.DataTextField = "Category";
        RCB.DataValueField = "CategoryId";
    }
    protected void SqlDataSourceCodez_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        DateTime Start = ConvertFromDMYtoDateVar(e.Command.Parameters["@PricelistDatestart"].Value.ToString());
        DateTime End = ConvertFromDMYtoDateVar(e.Command.Parameters["@PricelistDateEnd"].Value.ToString());
        
        if (Start > End)
        {
            e.Cancel = true;
            DisplayMessage("تاريخ البدايه يجب ان يكون اصغر من تاريخ النهايه لم ");
        }
    }
    protected void SqlDataSourceCodez_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        DateTime Start = ConvertFromDMYtoDateVar(e.Command.Parameters["@PricelistDatestart"].Value.ToString());
        DateTime End = ConvertFromDMYtoDateVar(e.Command.Parameters["@PricelistDateEnd"].Value.ToString());
        if (Start > End)
        {
            e.Cancel = true;
            DisplayMessage("تاريخ البدايه يجب ان يكون اصغر من تاريخ النهايه لم ");
        }
    }
    private static DateTime ConvertFromDMYtoDateVar(string DateString)
    {
        string[] Arr = DateString.Split("/".ToCharArray());
        DateTime ReturnMe = new DateTime(Convert.ToInt16(Arr[2]), Convert.ToInt16(Arr[1]), Convert.ToInt16(Arr[0]));
        return ReturnMe;
    }
    protected void BtnEditorPriceListDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Input/EditorPriceListDetails.aspx");
    }
}