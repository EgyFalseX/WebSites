using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditGridCourse : System.Web.UI.UserControl
{
    #region -   Variables   -
    private void prepareDataSources()
    {
        DSData.DataFile = DB.AATSWEBPath;
    }
    #endregion
    #region -   Functions   -
    private void DisplayMessage(string text, bool isError)
    {
        //RadGridEdit.Controls.Add(new LiteralControl(text));
        RadNotificationInfo.Text = text;

        if (isError)
        {
            RadNotificationInfo.Title = "خطــــــــاء";
            RadNotificationInfo.TitleIcon = "deny";
            RadNotificationInfo.ContentIcon = "deny";
        }
        else
        {
            RadNotificationInfo.Title = "تمت العمليه";
            RadNotificationInfo.TitleIcon = "info";
            RadNotificationInfo.ContentIcon = "info";
        }
        RadNotificationInfo.Show();
    }

    #endregion
    #region -   Event Handlers   -

    protected void Page_Load(object sender, EventArgs e)
    {
        prepareDataSources();
    }
    protected void DSData_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        ViewState["rowcount"] = e.AffectedRows;
    }
    protected void RadGridEdit_ItemDeleted(object sender, Telerik.Web.UI.GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            System.Data.OleDb.OleDbException ex = e.Exception as System.Data.OleDb.OleDbException;
            if (ex == null)
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message, true);
            else
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + ex.Message, true);
        }
        else
            DisplayMessage("تم الحذف", false);
    }
    protected void RadGridEdit_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is Telerik.Web.UI.GridFooterItem)
        {
            if (ViewState["rowcount"] != null)
            {
                Telerik.Web.UI.GridFooterItem footerItem = e.Item as Telerik.Web.UI.GridFooterItem;
                footerItem["CourseName"].Text = "العـــــدد:  " + ViewState["rowcount"];
            }
        }

    }
    #endregion
    
}