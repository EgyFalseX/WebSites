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

public partial class EditorMaterial : System.Web.UI.UserControl
{
    private void FixCharz()
    {
        TxtMaterial.Text = MC.FixChar(TxtMaterial.Text);
        TxtRestorePoint.Text = MC.FixChar(TxtRestorePoint.Text);
        TxtOutPrice.Text = MC.FixChar(TxtOutPrice.Text);
    }
    private void LoadGrid(string MaterialId)
    {
        DataTable MaterialTbl = new DataTable("FX2010-11");
        MaterialTbl = MC.LoadDataTable(@"SELECT MaterialId, CategoryId, (Select Category From CdCategory Where CategoryId = TblMaterialDetiels.CategoryId) AS Category, Material, RestorePoint, OutPrice, SerNotNull, '" + MC.MatrialFilePath + "' + PicUrl AS PicUrl FROM TblMaterialDetiels WHERE CategoryId = " + MaterialId, "");
        GridViewMaterial.DataSource = MaterialTbl;
        GridViewMaterial.DataBind();
        ViewState["MaterialTbl"] = MaterialTbl;
    }
    private void LoadMainCats()
    {
        DataTable GeneralItems = new DataTable("FX2010-11");
            GeneralItems = MC.LoadDataTable("Select CategoryId, Category From CdCategory Where parentID = 0", "");
            foreach (DataRow R in GeneralItems.Rows)
            {
                Telerik.Web.UI.RadTreeNode NodI = new Telerik.Web.UI.RadTreeNode(R["Category"].ToString(), R["CategoryId"].ToString());
                NodI.ImageUrl = "~/Images/Folders.png";
                NodI.Category = "0";
                RadTreeViewCat.Nodes.Add(NodI);
                LoadChildCats(NodI);
            }
    }
    private void LoadChildCats(Telerik.Web.UI.RadTreeNode Node)
    {
        DataTable ItemChilds = new DataTable("FX2010-11");
        ItemChilds = MC.LoadDataTable("Select CategoryId, Category From CdCategory Where parentID = " + Node.Value, "");
        foreach (DataRow R in ItemChilds.Rows)
        {
            Telerik.Web.UI.RadTreeNode NodI = new Telerik.Web.UI.RadTreeNode(R["Category"].ToString(), R["CategoryId"].ToString());
            NodI.ImageUrl = "~/Images/Folders.png";
            NodI.Category = "0";
            Node.Nodes.Add(NodI);
            LoadChildCats(NodI);
        }
    }
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
            LoadMainCats();
            RadUploadPicUrl.TargetPhysicalFolder = MapPath(MC.TempFilePath);
            RadUploadPicUrl.TargetFolder = MapPath(MC.MatrialFilePath);
        }
    }
    protected void RadTreeViewCat_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
    {
        LoadGrid(e.Node.Value);
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        if (TxtMaterial.Text.Trim().Length == 0 || RadTreeViewCat.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك ادخل اسم الصنف و اختار تصنيف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            return;
        }
        if (RadTreeViewCat.SelectedNode.Nodes.Count != 0)
        {
            LblState.Text = "لا يمكن اضافة صنف الا في المستوي الاخير";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            return;
        }
        BtnUpdate.Enabled = false;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        FixCharz();// remove أ
        string RestorePoint = "NULL", OutPrice = "NULL", PicUrl = "NULL";
        if (TxtRestorePoint.Text.Trim().Length != 0)
        {
            if (!MC.IsInteger(TxtRestorePoint.Text.Trim()))
            {
                LblState.Text = "من فضلك ادخل حد الطلب صحيح"; LblState.ForeColor = System.Drawing.Color.Red; LblState.Visible = true;
                return;
            }
            RestorePoint = TxtRestorePoint.Text.Trim();
        }
        if (TxtOutPrice.Text.Trim().Length != 0)
        {
            if (!MC.IsDecimal(TxtOutPrice.Text.Trim()))
            {
                LblState.Text = "من فضلك ادخل سعر البيع صحيح"; LblState.ForeColor = System.Drawing.Color.Red; LblState.Visible = true;
                return;
            }
            OutPrice = "N'" + TxtOutPrice.Text.Trim() + "'";
        }
        if (RadUploadPicUrl.UploadedFiles.Count != 0)
        {
            string NewFileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + RadUploadPicUrl.UploadedFiles[0].GetName();
            File.Move(RadUploadPicUrl.TargetPhysicalFolder + @"\" + RadUploadPicUrl.UploadedFiles[0].GetName(), RadUploadPicUrl.TargetFolder + NewFileName);
            PicUrl = "N'" + NewFileName + "'";
        }
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO TblMaterialDetiels
            (MaterialId, CategoryId, Material, RestorePoint, OutPrice, SerNotNull, PicUrl, UserIn, TimeIn)
            VALUES ({0}, {1}, N'{2}', {3}, {4}, '{5}', {6}, {7}, GETDATE())",
            MC.GetNewID("TblMaterialDetiels", "MaterialId"), RadTreeViewCat.SelectedValue, TxtMaterial.Text.Trim(), 
            RestorePoint, OutPrice, CheckBoxSerNotNull.Checked.ToString(), PicUrl, TheSessions.UserID);
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = System.Drawing.Color.Green;
            LblState.Visible = true;
            LoadGrid(RadTreeViewCat.SelectedValue);
            //ClearFrm
            TxtMaterial.Text = string.Empty;
            TxtRestorePoint.Text = string.Empty;
            TxtOutPrice.Text = string.Empty;
            CheckBoxSerNotNull.Checked = false;
            RadUploadPicUrl.UploadedFiles.Clear();
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
        }
        con.Close();

    }
    protected void ImageButtonEdit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = (ImageButton)sender;
        GridViewRow gr = (GridViewRow)imgbtn.Parent.Parent;
        HiddenField hdStoreID = (HiddenField)gr.FindControl("HiddenFieldEditMaterialId");
        HiddenField hdPicUrl = (HiddenField)gr.FindControl("HiddenFieldEditPicUrl");
        //string x = gr.Cells[0].Text + Environment.NewLine + gr.Cells[1].Text + Environment.NewLine + gr.Cells[2].Text + Environment.NewLine + gr.Cells[3].Text + Environment.NewLine + gr.Cells[4].Text;
        BtnUpdate.Enabled = true;
        TxtMaterial.Text = gr.Cells[0].Text;
        TxtRestorePoint.Text = gr.Cells[1].Text;
        TxtOutPrice.Text = gr.Cells[2].Text;
        CheckBoxSerNotNull.Checked = Convert.ToBoolean(gr.Cells[3].Text);

        ViewState["MaterialId"] = hdStoreID.Value;
        ViewState["PicUrl"] = hdStoreID.Value;
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        if (TxtMaterial.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل اسم الصنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            return;
        }
        if (ViewState["MaterialId"] == null)
            return;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        FixCharz();// remove أ
        string RestorePoint = "NULL", OutPrice = "NULL", PicUrl = string.Empty;
        if (TxtRestorePoint.Text.Trim().Length != 0)
        {
            if (!MC.IsInteger(TxtRestorePoint.Text.Trim()))
            {
                LblState.Text = "من فضلك ادخل حد الطلب صحيح"; LblState.ForeColor = System.Drawing.Color.Red; LblState.Visible = true;
                return;
            }
            RestorePoint = TxtRestorePoint.Text.Trim();
        }
        if (TxtOutPrice.Text.Trim().Length != 0)
        {
            if (!MC.IsDecimal(TxtOutPrice.Text.Trim()))
            {
                LblState.Text = "من فضلك ادخل سعر البيع صحيح"; LblState.ForeColor = System.Drawing.Color.Red; LblState.Visible = true;
                return;
            }
            OutPrice = "N'" + TxtOutPrice.Text.Trim() + "'";
        }
        if (RadUploadPicUrl.UploadedFiles.Count != 0)
        {
            string NewFileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + RadUploadPicUrl.UploadedFiles[0].GetName();
            File.Move(RadUploadPicUrl.TargetPhysicalFolder + @"\" + RadUploadPicUrl.UploadedFiles[0].GetName(), RadUploadPicUrl.TargetFolder + NewFileName);
            PicUrl = "PicUrl = N'" + NewFileName + "',";
        }
        try
        {
            cmd.CommandText = string.Format(@"UPDATE TblMaterialDetiels
            SET Material = N'{0}', RestorePoint = {1}, OutPrice = {2}, SerNotNull = '{3}', 
            {4} TimeIn = GETDATE(), UserIn = {5}
            WHERE (MaterialId = {6})", TxtMaterial.Text.Trim(), RestorePoint, OutPrice, CheckBoxSerNotNull.Checked.ToString(), PicUrl, TheSessions.UserID, ViewState["MaterialId"].ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم التعديل";
            LblState.ForeColor = System.Drawing.Color.Green;
            LblState.Visible = true;
            LoadGrid(RadTreeViewCat.SelectedValue);
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
        }
        con.Close();
    }
    protected void ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = (ImageButton)sender;
        GridViewRow gr = (GridViewRow)imgbtn.Parent.Parent;
        HiddenField hd = (HiddenField)gr.FindControl("HiddenFieldDeleteMaterialId");
        HiddenField hdPicUrl = (HiddenField)gr.FindControl("HiddenFieldDeletePicUrl");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"DELETE FROM TblMaterialDetiels WHERE MaterialId = {0}", hd.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            if (hdPicUrl.Value != null)
            {
                if (File.Exists(MapPath(MC.MatrialFilePath) + @"\" + hdPicUrl.Value))
                    File.Delete(MapPath(MC.MatrialFilePath) + @"\" + hdPicUrl.Value);    
            }
            LblState.Text = "تم الحذف";
            LblState.ForeColor = System.Drawing.Color.Green;
            LblState.Visible = true;
            LoadGrid(RadTreeViewCat.SelectedValue);
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
        }
        con.Close();
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}