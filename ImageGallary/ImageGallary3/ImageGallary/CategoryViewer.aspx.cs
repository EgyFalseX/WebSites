using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CategoryViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!sessionImageGallary.IsAuth)
        {
            ASPxFileManagerMain.SettingsEditing.AllowCreate = true;
            ASPxFileManagerMain.SettingsEditing.AllowDelete = true;
            ASPxFileManagerMain.SettingsEditing.AllowMove = true;
            ASPxFileManagerMain.SettingsEditing.AllowRename = true;
            ASPxFileManagerMain.SettingsToolbar.ShowCreateButton = true;
            ASPxFileManagerMain.SettingsToolbar.ShowDeleteButton = true;
            //ASPxFileManagerMain.SettingsToolbar.ShowDownloadButton = true;
            ASPxFileManagerMain.SettingsToolbar.ShowMoveButton = true;
            ASPxFileManagerMain.SettingsToolbar.ShowRenameButton = true;
        }
        else
        {
            ASPxFileManagerMain.SettingsEditing.AllowCreate = false;
            ASPxFileManagerMain.SettingsEditing.AllowDelete = false;
            ASPxFileManagerMain.SettingsEditing.AllowMove = false;
            ASPxFileManagerMain.SettingsEditing.AllowRename = false;
            ASPxFileManagerMain.SettingsToolbar.ShowCreateButton = false;
            ASPxFileManagerMain.SettingsToolbar.ShowDeleteButton = false;
            //ASPxFileManagerMain.SettingsToolbar.ShowDownloadButton = false;
            ASPxFileManagerMain.SettingsToolbar.ShowMoveButton = false;
            ASPxFileManagerMain.SettingsToolbar.ShowRenameButton = false;
        }
    }
    protected void ASPxCallbackPanelViewer_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
    {
        string filepath = e.Parameter;
        ASPxImageViewer.ImageUrl = filepath;
    }
}