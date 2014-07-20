using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;
using System.IO;
using System.Drawing;
using Telerik.Web.UI;

public partial class EditorPriceListDetails : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadData()
    {
        DataTable TblPricelists = new DataTable("FX2011-05");
        TblPricelists = MC.LoadDataTable(@"Select PricelistId, Cast(PricelistId AS nvarchar) + ' / ' + (Select Category From CdCategory Where CategoryId = TblPricelists.CategoryId) AS Details From TblPricelists");
        RadComboBoxPricelistId.DataSource = TblPricelists;
        RadComboBoxPricelistId.DataTextField = "Details";
        RadComboBoxPricelistId.DataValueField = "PricelistId";
        RadComboBoxPricelistId.DataBind();
    }
    private void LoadMainCats(RadPanelBar TV)
    {
        DataTable GeneralItems = new DataTable("FX2010-11");
        GeneralItems = MC.LoadDataTable("Select CategoryId, Category From CdCategory Where parentID = 0", "");
        foreach (DataRow R in GeneralItems.Rows)
        {
            RadPanelItem Itm = new RadPanelItem() { Text = R["Category"].ToString(), Value = R["CategoryId"].ToString(), ToolTip = "0" };
            Itm.ImageUrl = "~/Images/Folders.png";
            TV.Items.Add(Itm);
            LoadChildCats(Itm);
            LoadCatItems(Itm);
        }
    }
    private void LoadChildCats(RadPanelItem Node)
    {
        DataTable ItemChilds = new DataTable("FX2010-11");
        ItemChilds = MC.LoadDataTable("Select CategoryId, Category From CdCategory Where parentID = " + Node.Value, "");
        foreach (DataRow R in ItemChilds.Rows)
        {
            RadPanelItem Itm = new RadPanelItem() { Text = R["Category"].ToString(), Value = R["CategoryId"].ToString(), ToolTip = "0" };
            Itm.ImageUrl = "~/Images/Folders.png";
            Node.Items.Add(Itm);
            LoadChildCats(Itm);
            LoadCatItems(Itm);
        }
    }
    private void LoadCatItems(RadPanelItem Node)
    {
        DataTable CatItems = new DataTable("FX2010-11");
        CatItems = MC.LoadDataTable("Select MaterialId, Material From TblMaterialDetiels Where CategoryId = " + Node.Value, "");
        foreach (DataRow R in CatItems.Rows)
        {
            RadPanelItem Itm = new RadPanelItem() { Text = R["Material"].ToString(), Value = R["MaterialId"].ToString(), ToolTip = "1" };
            Itm.ImageUrl = "~/Images/Material.png";
            Node.Items.Add(Itm);
        }

    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
    #endregion
    #region -   Event Handlers   -
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
        {
            LoadData();
        }
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
    }
    protected void RadGridEditor_ItemUpdated(object source, GridUpdatedEventArgs e)
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
    protected void RadGridEditor_ItemInserted(object source, GridInsertedEventArgs e)
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
    protected void RadGridEditor_ItemDeleted(object source, GridDeletedEventArgs e)
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
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    protected void RadPanelBarItems_Load(object sender, EventArgs e)
    {
        RadPanelBar TV = (RadPanelBar)sender;
        if (((RadPanelBar)sender).Items.Count == 0)
            LoadMainCats((RadPanelBar)sender);
    }
    protected void BtnOk_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        Button btn = (Button)sender;
        TextBox TxtItemCatID = (TextBox)btn.Parent.Parent.FindControl("TxtItemCatID");
        HiddenField HiddenFieldMaterialId = (HiddenField)btn.Parent.Parent.FindControl("HiddenFieldMaterialId");
        Label LblItemName = (Label)btn.Parent.Parent.FindControl("LblItemName");
        RadPanelBar rtv = (RadPanelBar)btn.Parent.Parent.FindControl("RadPanelBarItems");
        if (TxtItemCatID.Text.Trim().Length > 0)
        {
            DataTable dt = MC.LoadDataTable("Select MaterialId, Material, CategoryId From TblMaterialDetiels Where CategoryId = " + TxtItemCatID.Text.Trim(), "");
            if (dt.Rows.Count > 0)
            {
                try
                {
                    LblItemName.Text = dt.Rows[0]["Material"].ToString() + " [" + MC.LoadDataTable("Select OutPrice From TblMaterialDetiels Where MaterialId = " + dt.Rows[0]["MaterialId"], "").Rows[0][0] + "]";
                }
                catch
                { }
                HiddenFieldMaterialId.Value = dt.Rows[0]["MaterialId"].ToString();
                rtv.FindItemByValue(dt.Rows[0]["MaterialId"].ToString()).Selected = true;
                return;
            }
        }
        if (rtv.SelectedItem == null)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            LblItemName.Text = string.Empty;
            TxtItemCatID.Text = string.Empty;
            HiddenFieldMaterialId.Value = string.Empty;
            return;
        }
        if (rtv.SelectedItem.ToolTip == "0")
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            LblItemName.Text = string.Empty;
            TxtItemCatID.Text = string.Empty;
            HiddenFieldMaterialId.Value = string.Empty;
            return;
        }
        LblItemName.Text = rtv.SelectedItem.Text + " [" + MC.LoadDataTable("Select ISNULL(OutPrice, '0') AS OutPrice From TblMaterialDetiels Where MaterialId = " + rtv.SelectedItem.Value, "").Rows[0][0] + "]";
        TxtItemCatID.Text = MC.LoadDataTable("Select CategoryId From TblMaterialDetiels Where MaterialId = " + rtv.SelectedItem.Value, "").Rows[0][0].ToString();
        HiddenFieldMaterialId.Value = rtv.SelectedItem.Value;
    }
    #endregion
}