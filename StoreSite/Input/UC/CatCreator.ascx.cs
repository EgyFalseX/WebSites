using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class CatCreator : System.Web.UI.UserControl
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
        if (!IsPostBack)
        {
            DataTable GeneralItems = new DataTable("FX2010-11");
            GeneralItems = MC.LoadDataTable("Select CategoryId, Category From CdCategory Where parentID = 0", "");
            Telerik.Web.UI.RadTreeNode GNodI = new Telerik.Web.UI.RadTreeNode("الرئيسي", "-1");
            RadTreeViewCat.Nodes.Add(GNodI);
            foreach (DataRow R in GeneralItems.Rows)
            {
                Telerik.Web.UI.RadTreeNode NodI = new Telerik.Web.UI.RadTreeNode(R["Category"].ToString(), R["CategoryId"].ToString());
                GNodI.Nodes.Add(NodI);
                LoadChildItems(NodI);
            }
        }
    }
    private void LoadChildItems(Telerik.Web.UI.RadTreeNode Node)
    {
        DataTable ItemChilds = new DataTable("FX2010-11");
        ItemChilds = MC.LoadDataTable("Select CategoryId, Category From CdCategory Where parentID = " + Node.Value, "");
        foreach (DataRow R in ItemChilds.Rows)
        {
            Telerik.Web.UI.RadTreeNode NodI = new Telerik.Web.UI.RadTreeNode(R["Category"].ToString(), R["CategoryId"].ToString());
            Node.Nodes.Add(NodI);
            LoadChildItems(NodI);
        }
    }
    protected void RadTreeViewCat_NodeEdit(object sender, Telerik.Web.UI.RadTreeNodeEditEventArgs e)
    {
        if (e.Node.Value == "-1")
            return;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        string msg = string.Empty;
        try
        {
            con.Open();
            if (e.Text == string.Empty)
            {
                if (e.Node.Nodes.Count != 0 || !ChildEmpty(RadTreeViewCat.SelectedValue))
                {
                    LblState.Text = "لا يمكن حذف تصنيف غير فارغ";
                    LblState.ForeColor = System.Drawing.Color.Red;
                    LblState.Visible = true;
                    return;
                }
                cmd.CommandText = string.Format(@"DELETE FROM CdCategory WHERE CategoryId = {0}", e.Node.Value);
                msg = "تم الحذف";
                cmd.ExecuteNonQuery();
                //RadTreeViewCat.Nodes.Remove(RadTreeViewCat.SelectedNode);
                e.Node.Remove();
            }
            else
            {
                cmd.CommandText = string.Format(@"UPDATE CdCategory SET Category = N'{0}', UserIn = {1}, TimeIn = GetDate() Where CategoryId = {2}",
                                            e.Text, TheSessions.UserID, e.Node.Value);
                msg = "تم التعديل";
                cmd.ExecuteNonQuery();
                e.Node.Text = e.Text;
            }
            LblState.Text = msg;
            LblState.ForeColor = System.Drawing.Color.Green;
            LblState.Visible = true;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
        }
        con.Close();
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        LblState.Visible = false;
        if (RadTreeViewCat.SelectedNodes.Count == 0)
            return;
        if (!ChildEmpty(RadTreeViewCat.SelectedValue))
        {
            LblState.Text = "لا يمكن اضافة تصنيف داخل تصنيف به اصناف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        string parentID = "0";
        if (RadTreeViewCat.SelectedNode.ParentNode != null)// Check if have parent
            parentID = RadTreeViewCat.SelectedNode.Value;
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"INSERT INTO CdCategory (CategoryId, parentID, Category, UserIn, TimeIn)
                              VALUES ({0}, {1}, N'{2}', {3}, GETDATE())", MC.GetNewID("CdCategory", "CategoryId"), parentID, "جديد", TheSessions.UserID);
            Telerik.Web.UI.RadTreeNode Nodi = new Telerik.Web.UI.RadTreeNode("جديد", MC.GetNewID("CdCategory", "CategoryId"));
            cmd.ExecuteNonQuery();
            RadTreeViewCat.SelectedNode.Nodes.Add(Nodi);
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = System.Drawing.Color.Green;
            LblState.Visible = true;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
        }
        con.Close();
    }
    private bool ChildEmpty(string CategoryId)
    {
        if (MC.LoadDataTable("Select MaterialId From TblMaterialDetiels Where CategoryId = " + CategoryId, "").Rows.Count > 0)
            return false;
        else
            return true;
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}