using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class ViewReservation : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void prepareDataSources()
    {
        DSData.DataFile = DB.AATSWEBPath;
        DSCdcountry.DataFile = DB.AATSWEBPath;
        DSCdNationality.DataFile = DB.AATSWEBPath;
        DSTBLCourses.DataFile = DB.AATSWEBPath;
        DStd_starting1.DataFile = DB.AATSWEBPath;
    }
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
    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //Get new ID to insert at
        e.Command.Parameters["TraineeID"].Value = DB.GetNewID(DB.DBTablesNames.TBLTrainee);
    }
    protected void RadGridEdit_ItemInserted(object sender, Telerik.Web.UI.GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            System.Data.OleDb.OleDbException ex = e.Exception as System.Data.OleDb.OleDbException;
            if (ex == null)
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message, true);
            else
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + ex.Message, true);
        }
        else
            DisplayMessage("تم الاضافه", false);
    }
    protected void RadGridEdit_ItemUpdated(object sender, Telerik.Web.UI.GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            System.Data.OleDb.OleDbException ex = e.Exception as System.Data.OleDb.OleDbException;
            if (ex == null)
                DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message, true);
            else
                DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + ex.Message, true);
        }
        else
            DisplayMessage("تم التعديل", false);
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
        if (e.Item is GridFooterItem)
        {
            if (ViewState["rowcount"] != null)
            {
                GridFooterItem footerItem = e.Item as GridFooterItem;
                footerItem["TraineeName"].Text = "العـــــدد:  " + ViewState["rowcount"];
            }
        }

    }
    protected void DSData_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        ViewState["rowcount"] = e.AffectedRows;
    }
    #endregion

    protected void DSData_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        if (Request.QueryString["CourseId"] != null )
        {
            e.Command.CommandText = "SELECT TBLTraineenotime.TraineeID, TBLTraineenotime.TraineeName, TBLTraineenotime.NameInEnglish, TBLTraineenotime.GenderID, TBLTraineenotime.NationalityId, TBLTraineenotime.Mobile, TBLTraineenotime.tel, TBLTraineenotime.Email, TBLTraineenotime.City, TBLTraineenotime.Address, TBLTraineenotime.jobID, TBLTraineenotime.OtherJob, TBLTraineenotime.CertificateAddress, TBLTraineenotime.MembershipTypeID, TBLTraineenotime.MembershipNo, TBLTraineenotime.REM, TBLTraineenotime.UserName, TBLTraineenotime.[password], TBLTraineenotime.[image], TBLTraineenotime.TraineeTypeId, TBLTraineenotime.TimeIn, TBLTraineenotime.mony, TBLTraineenotime.accname, TBLTraineenotime.CourseId, TBLTraineenotime.countryId, TBLTraineenotime.sdd, TBLCoursesnotime.CourseName, CdNationality.Nationality, CdGender.Gender, Cdcountry.country FROM ((((TBLTraineenotime LEFT OUTER JOIN CdNationality ON TBLTraineenotime.NationalityId = CdNationality.NationalityId) LEFT OUTER JOIN CdGender ON TBLTraineenotime.GenderID = CdGender.GenderID) LEFT OUTER JOIN TBLCoursesnotime ON TBLTraineenotime.CourseId = TBLCoursesnotime.CourseId) LEFT OUTER JOIN Cdcountry ON TBLTraineenotime.countryId = Cdcountry.countryId) WHERE TBLTraineenotime.CourseId = " + Request.QueryString["CourseId"];
        }
    }
}
