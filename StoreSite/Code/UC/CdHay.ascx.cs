using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CdHay : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!Functions.MC.GetPagePriv(new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name, TheSessions.UserID))
        {
            Response.Redirect("~/AccessDenied.aspx");
            return;
        }
        SqlDataSourceCodez.ConnectionString = Functions.MC.ConnectionStr();
        SqlDataSourcemarkaz.ConnectionString = Functions.MC.ConnectionStr();
    }
    protected void RadGridEditor_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
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
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
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
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
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
}
