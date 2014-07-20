using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;

public partial class UserControl_SLCatEditor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.IsAdmin == false || TheSessions.EmploeeID == null)
        {
            Response.Redirect("~/SLDoTheLogin.aspx");
            return;
        }
        if (!IsPostBack)
            LoadDefaultCats();
    }
    private void LoadDefaultCats()
    {
        TVCats.Nodes.Clear();
        DataTable DT = new DataTable("GeneralTable");
        OleDbDataAdapter AccessDA = new OleDbDataAdapter("Select CatID,CatName From Categories Where CatParent = 0 ORDER BY CatOrder", MySchool.SLConnection);
        AccessDA.Fill(DT);
        foreach (DataRow row in DT.Rows)
        {
            TreeNode TN = new TreeNode();
            TN.Text = row["CatName"].ToString();
            TN.Value = row["CatID"].ToString();
            TVCats.Nodes.Add(TN);
        }
        LoadAllCats(TVCats);
        ViewState["CatID"] = "0";
    }
    private void LoadAllCats(TreeView NItem)
    {
        foreach (TreeNode CItem in NItem.Nodes)
            LoadSupCat(CItem);
    }
    private void LoadSupCat(TreeNode CItem)
    {
        OleDbConnection Con = MySchool.SLConnection;
        OleDbCommand CMD = new OleDbCommand("Select CatID,CatName From Categories Where CatParent = " + CItem.Value.ToString() + " ORDER BY CatOrder", Con);
        OleDbDataReader DR;
        Con.Open();
        DR = CMD.ExecuteReader();
        CItem.ChildNodes.Clear();
        while (DR.Read())
        {
            TreeNode Itemi = new TreeNode(DR.GetValue(1).ToString(), DR.GetValue(0).ToString());
            CItem.ChildNodes.Add(Itemi);
            LoadSupCat(Itemi);
        }
        Con.Close();
    }
    protected void TVCats_TreeNodeExpanded(object sender, TreeNodeEventArgs e)
    {
        if (e.Node.ChildNodes.Count == 0)
        {
            LoadSupCat(e.Node);
        }
    }
    protected void CheckBoxMainCat_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBoxMainCat.Checked)
        {
            TxtCatParent.Text = string.Empty;
        }
        else
        {
            if (TVCats.SelectedNode == null)
                return;
            if (TVCats.SelectedNode.Depth > 0)
                TxtCatParent.Text = TVCats.SelectedNode.Parent.Text.ToString();   
        }
        
    }
    protected void TVCats_SelectedNodeChanged(object sender, EventArgs e)
    {
        TVCats_TreeNodeExpanded(TVCats, new TreeNodeEventArgs(TVCats.SelectedNode));
        CatImage.Visible = false;
        LblStatus.Visible = false;
        OleDbConnection Con = MySchool.SLConnection;
        OleDbCommand CMD = new OleDbCommand("SELECT Categories.CatID, Categories.CatName, Categories.CatImage, Categories.CatInfo, Categories.CatOrder, Categories.VisitCounter, (Select TOP 1 Categories_1.CatName From Categories Categories_1 Where Categories_1.CatID= Categories.CatParent) AS CatParent FROM (Categories INNER JOIN Categories Categories_1 ON Categories.CatID = Categories_1.CatID) Where Categories.CatID = " + TVCats.SelectedNode.Value.ToString(), Con);
        OleDbDataReader DR;
        Con.Open();
        DR = CMD.ExecuteReader();
        while (DR.Read())
        {
            TxtCatName.Text = DR.GetValue(1).ToString();
            if (!DR.IsDBNull(2))
            {
                CatImage.Visible = true;
                CatImage.ImageUrl = DR.GetValue(2).ToString();
            }
            else
            {
                CatImage.Visible = true;
                CatImage.ImageUrl = "~/libimages/defaultpic.jpg";
            }
            TxtCatInfo.Text = DR.GetValue(3).ToString();
            ListBoxCatOrder.SelectedIndex = Convert.ToInt16(DR.GetValue(4).ToString()) - 1;
            TxtCatVisitCounter.Text = DR.GetValue(5).ToString();
            TxtCatParent.Text = DR.GetValue(6).ToString();
            BtnUpdateCat.Visible = true;
            ViewState["CatID"] = TVCats.SelectedNode.Value.ToString();
        }
        Con.Close();
        BtnUpdateCat.Enabled = true;
    }
    protected void BtnAddNew_Click(object sender, EventArgs e)
    {
        LblStatus.Visible = false;
        if (BtnUpdateCat.Visible == true)
        {
            BtnUpdateCat.Visible = false;
            TxtCatName.Text = String.Empty;
            TxtCatInfo.Text = String.Empty;
            TxtCatVisitCounter.Text = String.Empty;
            if (TVCats.SelectedNode != null)
            {
                if (TVCats.SelectedNode.Depth > 0)
                    TxtCatParent.Text = TVCats.SelectedNode.Parent.Text;
            }
        }
        else
        {
            string CatName = "NULL", CatImage = "NULL", CatInfo = "NULL", CatOrder = "0", CatParent = "0", VisitCounter = "0";
            if (TxtCatName.Text.Trim().Length == 0)
            {
                LblStatus.Text = "من فضلك ادخل اسم القسم";
                LblStatus.Visible = true;
                LblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }
            else
                CatName = "'" + TxtCatName.Text + "'";
            string x = FileUploadImage.FileName;
            if (FileUploadImage.HasFile)//  ---------- Upload Image
            {
                CatImage = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadImage.FileName.ToString();
                FileUploadImage.SaveAs(HttpContext.Current.Server.MapPath("libimages") + "/" + CatImage);
                CatImage = "'~/libimages/" + CatImage + "'";
            }
            if (TxtCatInfo.Text.Trim().Length != 0)
                CatInfo = "'" + TxtCatInfo.Text.Trim() + "'";
            if (ListBoxCatOrder.SelectedIndex > -1)
                CatOrder = ListBoxCatOrder.SelectedValue.ToString();
            if (CheckBoxMainCat.Checked)
                CatParent = "0";
            else
                CatParent = ViewState["CatID"].ToString();
            if (TxtCatVisitCounter.Text.Trim().Length != 0)
                VisitCounter = Convert.ToInt16(TxtCatVisitCounter.Text.Trim()).ToString();

            OleDbConnection con = MySchool.SLConnection;
            OleDbCommand cmd = new OleDbCommand("", con);
            cmd.CommandText = string.Format(@"INSERT INTO Categories
                        (CatName, CatImage, CatInfo, CatOrder, CatParent, VisitCounter)
                        VALUES        ({0}, {1}, {2}, {3}, {4}, {5})", CatName, CatImage, CatInfo, CatOrder, CatParent, VisitCounter);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                LblStatus.Text = "تم الاضافه";
                LblStatus.ForeColor = System.Drawing.Color.Green;
                LblStatus.Visible = true;
                LoadDefaultCats();
                Response.Redirect(Request.Url.ToString());
            }
            catch (OleDbException ex)
            {
                LblStatus.Visible = true;
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Text = ex.Message;
            }
            con.Close();
        }
    }
    protected void BtnUpdateCat_Click(object sender, EventArgs e)
    {
        LblStatus.Visible = false;
        OleDbConnection Con = MySchool.SLConnection;
        OleDbCommand CMD;
        string ParentID = string.Empty;
        if (TVCats.SelectedNode.Depth == 0)
            ParentID = "0";
        else
            ParentID = TVCats.SelectedNode.Parent.Value.ToString();

        if (FileUploadImage.HasFile)
        {
            string SavingImageFileName = "";
            SavingImageFileName = DateTime.Today.Year.ToString() + DateTime.Today.Month.ToString() + DateTime.Today.Day.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + DateTime.Today.Second.ToString() + FileUploadImage.FileName.ToString();
            FileUploadImage.SaveAs(HttpContext.Current.Server.MapPath("libimages") + "/" + SavingImageFileName);
            SavingImageFileName = "~/libimages/" + SavingImageFileName;
            CMD = new OleDbCommand("Update Categories Set CatName = '" + TxtCatName.Text + "', CatImage = '" + SavingImageFileName + "', CatInfo = '" + TxtCatInfo.Text + "', CatOrder = " + ListBoxCatOrder.SelectedValue.ToString() + ",CatParent = " + ParentID + ",VisitCounter = " + TxtCatVisitCounter.Text + " Where CatID = " + TVCats.SelectedNode.Value.ToString(), Con);
        }
        else
            CMD = new OleDbCommand("Update Categories Set CatName = '" + TxtCatName.Text + "', CatInfo = '" + TxtCatInfo.Text + "', CatOrder = " + ListBoxCatOrder.SelectedValue.ToString() + ",CatParent = " + ParentID + ",VisitCounter = " + TxtCatVisitCounter.Text + " Where CatID = " + TVCats.SelectedNode.Value.ToString(), Con);
        
        Con.Open();
        try
        {
            CMD.ExecuteNonQuery();
            LblStatus.Text = "تم التعديل بنجاح";
            LblStatus.ForeColor = System.Drawing.Color.Green;
            LblStatus.Visible = true;
            //LoadDefaultCats();
            //LoadAllCats(TVCats);
            TVCats.SelectedNode.Text = TxtCatName.Text;
            //<meta http-equiv="refresh" content="60" />
        }
        catch (Exception ex)
        {
            LblStatus.Text = ex.Message.ToString();
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Visible = true;
        }
        Con.Close();
    }
    protected void TxtCatName_TextChanged(object sender, EventArgs e)
    {
        if (TxtCatName.Text.Length > 0)
        {
            BtnUpdateCat.Enabled = true;
            BtnAddNew.Enabled = true;
        }
        else
        {
            BtnUpdateCat.Enabled = false;
            BtnAddNew.Enabled = false;
        }
    }
    protected void BtnDel_Click(object sender, EventArgs e)
    {
        LblStatus.Visible = false;
        if (TVCats.SelectedNode == null)
            return;
        if (TVCats.SelectedNode.ChildNodes.Count != 0)
        {
            LblStatus.Visible = true;
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Text = "لا يمكن حذف قسم به افسام فرعيه";
            return;
        }
        OleDbConnection con = MySchool.SLConnection;
        OleDbCommand cmd = new OleDbCommand("SELECT COUNT(BookID) AS BooksNo FROM Books WHERE CatID = " + TVCats.SelectedNode.Value, con);
        try
        {
            con.Open();
            if (cmd.ExecuteScalar().ToString() != "0")
            {
                LblStatus.Visible = true;
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Text = "لا يمكن حذف قسم به كتب";
                con.Close();
                return;
            }
            else
            {
                cmd.CommandText = "Delete From Categories Where CatID = " + TVCats.SelectedNode.Value;
                cmd.ExecuteNonQuery();
                LblStatus.Visible = true;
                LblStatus.ForeColor = System.Drawing.Color.Green;
                LblStatus.Text = "تم حذف القسم";
                TVCats.Nodes.Remove(TVCats.SelectedNode);
            }
        }
        catch (OleDbException ex)
        {
            LblStatus.Visible = true;
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Text = ex.Message;
        }
        con.Close();
    }
}