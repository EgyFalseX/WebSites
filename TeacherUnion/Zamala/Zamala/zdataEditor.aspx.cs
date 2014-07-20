using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

public partial class zdataEditor : System.Web.UI.Page
{
    List<zdata> list = new List<zdata>();

    protected void Page_Load(object sender, EventArgs e)
    {
        DSData.DataFile = MapPath(@"~/App_Data/" + TheSessionsZamala.dbName);
        if (!TheSessionsZamala.IsAuth)
            Response.Redirect("Login.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());

        int start = GVEditor.PageIndex * GVEditor.SettingsPager.PageSize;
        int end = (GVEditor.PageIndex + 1) * GVEditor.SettingsPager.PageSize;
        GridViewDataColumn colsalary = GVEditor.Columns["salary"] as GridViewDataColumn;
        GridViewDataColumn colrema = GVEditor.Columns["rema"] as GridViewDataColumn;

        for (int i = start; i < end; i++)
        {
            ASPxTextBox txtsalary = (ASPxTextBox)GVEditor.FindRowCellTemplateControl(i, colsalary, "txt");
            ASPxTextBox txtrema = (ASPxTextBox)GVEditor.FindRowCellTemplateControl(i, colrema, "txt");
            if (txtsalary == null)
                continue;

            int id = Convert.ToInt32(GVEditor.GetRowValues(i, GVEditor.KeyFieldName));

            list.Add(new zdata(id, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, txtsalary.Value, txtrema.Value, TheSessionsZamala.UserID, DateTime.Now));
        }
    }

    protected void GVEditor_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم الاضـــافه ...";
    }
    protected void GVEditor_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم التعــــديل ...";

    }
    protected void GVEditor_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
    {
        if (e.Exception != null)
            GVEditor.JSProperties["cpShowPopup"] = e.Exception.Message;
        else
            GVEditor.JSProperties["cpShowPopup"] = "تم الحـــذف ...";
    }
    protected void GVEditor_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
    {

    }
    protected void GVEditor_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("attach");
    }
    protected void GVEditor_CancelRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {
        Session.Remove("attach");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        lblState.Text = string.Empty;
        for (int i = 0; i < list.Count; i++)
        {
            if (list[i].salary_ == null)
                DSData.UpdateParameters["salary"].DefaultValue = string.Empty;
            else
                DSData.UpdateParameters["salary"].DefaultValue = list[i].salary_.ToString();
            if (list[i].rema_ == null)
                DSData.UpdateParameters["rema"].DefaultValue = string.Empty;
            else
                DSData.UpdateParameters["rema"].DefaultValue = list[i].rema_.ToString();
            DSData.UpdateParameters["memberid"].DefaultValue = list[i].memberid_.ToString();
            DSData.UpdateParameters["datein"].DefaultValue = DateTime.Now.ToShortDateString();
            DSData.Update();  //<< Uncomment this line to update data!
        }
        GVEditor.DataBind();
        lblState.Text = "تم الحفـــــظ";
    }
    protected void GVEditor_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
    {
        
    }

}