﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class Editadvcourse : System.Web.UI.UserControl
{
    private System.Collections.ArrayList ab = new System.Collections.ArrayList();
    #region -   Functions   -
    private void prepareDataSources()
    {
        DSData.DataFile = DB.AATSWEBPath;
        
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
    protected void RadAsyncUploadImg_FileUploaded(object sender, FileUploadedEventArgs e)
    {
        RadAsyncUpload UL = (RadAsyncUpload)sender;
        HiddenField HFimg = (HiddenField)UL.Parent.FindControl("HFimg");
        string time = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + ".jpg";
        string FPath = MapPath("../../CourseFiles/advcourse/");
        e.File.SaveAs(FPath + time);
        HFimg.Value = time;
    }
    protected void DSData_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //Get new ID to insert at
        //e.Command.Parameters["TraineeID"].Value = DB.GetNewID(DB.DBTablesNames.TBLTrainee);
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
                footerItem["id"].Text = "العـــــدد:  " + ViewState["rowcount"];
            }
        }

    }
    protected void DSData_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        ViewState["rowcount"] = e.AffectedRows;
    }

    #endregion

    
   
}