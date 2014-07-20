using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class UC_AccTreeBuilder : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadMainCats()
    {
        Telerik.Web.UI.RadTreeNode MainNodI = new Telerik.Web.UI.RadTreeNode("شجرة الحسابات", "-1");
        MainNodI.ImageUrl = "~/Images/Folders.png";
        MainNodI.Category = "0";
        MainNodI.LongDesc = "0";
        RadTreeViewCat.Nodes.Add(MainNodI);

        DataTable GeneralItems = new DataTable("FX2010-12");
        GeneralItems = MC.LoadDataTable(@"Select AccountId, AccountName, AccountTreeId From TblAccounts Where BasicAccountId = 0", "");
        foreach (DataRow R in GeneralItems.Rows)
        {
            Telerik.Web.UI.RadTreeNode NodI = new Telerik.Web.UI.RadTreeNode(R["AccountName"].ToString(), R["AccountId"].ToString());
            NodI.ImageUrl = "~/Images/Folders.png";
            NodI.Category = R["AccountTreeId"].ToString();
            MainNodI.Nodes.Add(NodI);
            LoadChildCats(NodI);
        }
    }
    private void LoadChildCats(Telerik.Web.UI.RadTreeNode Node)
    {
        DataTable ItemChilds = new DataTable("FX2010-11");
        ItemChilds = MC.LoadDataTable("Select AccountId, AccountName, AccountTreeId, BasicAccountId From TblAccounts Where BasicAccountId = " + Node.Value, "");
        foreach (DataRow R in ItemChilds.Rows)
        {
            Telerik.Web.UI.RadTreeNode NodI = new Telerik.Web.UI.RadTreeNode(R["AccountName"].ToString(), R["AccountId"].ToString());
            NodI.ImageUrl = "~/Images/Folders.png";
            NodI.Category = R["AccountTreeId"].ToString();
            NodI.LongDesc = R["BasicAccountId"].ToString();
            Node.Nodes.Add(NodI);
            LoadChildCats(NodI);
        }
    }
    private void LoadDefaultDate()
    {
        DataTable CdAccountNatureTbl = new DataTable("FX2010-12");
        CdAccountNatureTbl = MC.LoadDataTable(@"Select AccountNatureId, AccountNature From CdAccountNature");
        RadComboBoxAccountNatureId.DataSource = CdAccountNatureTbl;
        RadComboBoxAccountNatureId.DataTextField = "AccountNature";
        RadComboBoxAccountNatureId.DataValueField = "AccountNatureId";
        RadComboBoxAccountNatureId.DataBind();

        DataTable CdAccountRasidTbl = new DataTable("FX2010-12");
        CdAccountRasidTbl = MC.LoadDataTable(@"Select AccountRasidId, AccountRasid From CdAccountRasid");
        RadComboBoxAccountRasidId.DataSource = CdAccountRasidTbl;
        RadComboBoxAccountRasidId.DataTextField = "AccountRasid";
        RadComboBoxAccountRasidId.DataValueField = "AccountRasidId";
        RadComboBoxAccountRasidId.DataBind();

        DataTable CDCloseAccountTbl = new DataTable("FX2010-12");
        CDCloseAccountTbl = MC.LoadDataTable(@"Select AccountId, AccountName From TblAccounts Where BasicAccountId = 0");
        RadComboBoxCloseAccountID.DataSource = CDCloseAccountTbl;
        RadComboBoxCloseAccountID.DataTextField = "AccountName";
        RadComboBoxCloseAccountID.DataValueField = "AccountId";
        RadComboBoxCloseAccountID.DataBind();
    }
    private string GetNewTreeId(string ParentID, string ParentTreeID)
    {
        string ReturnMe = string.Empty;
        string LatestTreeID = "0";
        SqlConnection Con = MC.EStoreConnection;
        SqlCommand Cmd = new SqlCommand("", Con);
        DataTable LatestTreeIDTbl = new DataTable("FX2010-12");
        if ((string)ParentID == "-1")// The Parent is the root
            LatestTreeIDTbl = MC.LoadDataTable(@"SELECT TOP (1) AccountTreeId FROM TblAccounts WHERE (BasicAccountId = 0) ORDER BY AccountId DESC", "");
        else
            LatestTreeIDTbl = MC.LoadDataTable(@"SELECT TOP (1) AccountTreeId FROM TblAccounts WHERE (BasicAccountId = " + ParentID + ") ORDER BY AccountId DESC", "");
        if (LatestTreeIDTbl.Rows.Count != 0)
            LatestTreeID = LatestTreeIDTbl.Rows[0][0].ToString();
        ReturnMe = IncreaseTreeID(LatestTreeID, ParentTreeID);
        return ReturnMe;
    }
    private string IncreaseTreeID(string TreeID, string ParentTreeID)
    {
        string ReturnMe = string.Empty;
        int NewIDLen = 0;
        if (ParentTreeID == "0")
        {
            ParentTreeID = string.Empty;
        }
        switch (ParentTreeID.Length)
        {
            case 0:
                NewIDLen = 1;
                break;
            case 1:// Level 1
                NewIDLen = 3;
                break;
            case 3:// Level 2
                NewIDLen = 6;
                break;
            case 6:// Level 3
                NewIDLen = 10;
                break;
            case 10:// Level 4
                NewIDLen = 15;
                break;
            case 15:// Level 5
                NewIDLen = 21;
                break;
            case 21:// Level 6
                NewIDLen = 28;
                break;
            case 28:// Level 7
                NewIDLen = 36;
                break;
            case 36:// Level 8
                NewIDLen = 45;
                break;
            case 45:// Level 9
                NewIDLen = 55;
                break;
            case 55:// Level 10
                NewIDLen = 66;
                break;
            default:
                break;
        }
        if (TreeID.Length >= NewIDLen)
        {
            TreeID = TreeID.Substring(ParentTreeID.Length);
        }
        ReturnMe = (Convert.ToInt16(TreeID) + 1).ToString();

        if ((ReturnMe.Length + ParentTreeID.Length) > NewIDLen)
        {
            return string.Empty;
        }
        for (int i = ReturnMe.Length; i < (NewIDLen - ParentTreeID.Length); i++)
        {
            ReturnMe = "0" + ReturnMe;
        }
        ReturnMe = ParentTreeID + ReturnMe;
        return ReturnMe;
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
        if (!MC.GetPagePriv(new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name, TheSessions.UserID))
        {
            Response.Redirect("~/AccessDenied.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadMainCats();
            LoadDefaultDate();
        }
    }
    protected void RadTreeViewCat_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
    {
        LblState.Text = "";
        if (e.Node.Value == "-1")
        {
            TxtAccountName.Text = string.Empty;
            RadComboBoxAccountNatureId.ClearSelection();
            RadComboBoxAccountNatureId.Text = string.Empty;
            RadComboBoxAccountRasidId.ClearSelection();
            RadComboBoxAccountRasidId.Text = string.Empty;
            RadComboBoxCloseAccountID.ClearSelection();
            RadComboBoxCloseAccountID.Text = string.Empty;
            LblAccountTreeId.Text = string.Empty;
            return;
        }
        DataTable ItemDetail = new DataTable("FX2010-11");
        ItemDetail = MC.LoadDataTable(@"SELECT AccountId, AccountName, BasicAccountId, AccountNatureId,
                    (SELECT AccountNature FROM CdAccountNature WHERE (AccountNatureId = TblAccounts.AccountNatureId)) AS AccountNature, 
                    AccountRasidId, (Select AccountRasid From CdAccountRasid Where AccountRasidId = TblAccounts.AccountRasidId ) AS AccountRasid, 
                    CloseAccountID, (Select CloseAccountName From CDCloseAccount Where CloseAccountID = TblAccounts.CloseAccountID) AS CloseAccountName, 
                    AccountTreeId FROM TblAccounts Where AccountId = " + e.Node.Value, "");
        TxtAccountName.Text = ItemDetail.Rows[0]["AccountName"].ToString();
        if (ItemDetail.Rows[0]["AccountNatureId"] != DBNull.Value)
            RadComboBoxAccountNatureId.SelectedValue = ItemDetail.Rows[0]["AccountNatureId"].ToString();
        else
        {
            RadComboBoxAccountNatureId.ClearSelection();
            RadComboBoxAccountNatureId.Text = string.Empty;
        }
        if (ItemDetail.Rows[0]["AccountRasidId"] != DBNull.Value)
            RadComboBoxAccountRasidId.SelectedValue = ItemDetail.Rows[0]["AccountRasidId"].ToString();
        else
        {
            RadComboBoxAccountRasidId.ClearSelection();
            RadComboBoxAccountRasidId.Text = string.Empty;
        }
        if (ItemDetail.Rows[0]["CloseAccountID"] != DBNull.Value)
            RadComboBoxCloseAccountID.SelectedValue = ItemDetail.Rows[0]["CloseAccountID"].ToString();
        else
        {
            RadComboBoxCloseAccountID.ClearSelection();
            RadComboBoxCloseAccountID.Text = string.Empty;
        }
        
        LblAccountTreeId.Text = ItemDetail.Rows[0]["AccountTreeId"].ToString();
    }
    protected void BtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (TxtAccountName.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل اسم الحساب";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            return;
        }
        if (RadTreeViewCat.SelectedNode == null)
        {
            LblState.Text = "من فضلك اختار مكان الحساب في الشجره";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            return;
        }
        string BasicAccountId = "0", AccountNatureId = "NULL", AccountRasidId = "NULL", CloseAccountID = "NULL", AccountTreeId = "NULL";
        if (RadComboBoxAccountNatureId.SelectedIndex > 0)
            AccountNatureId = RadComboBoxAccountNatureId.SelectedValue;
        if (RadComboBoxAccountRasidId.SelectedIndex > 0)
            AccountRasidId = RadComboBoxAccountRasidId.SelectedValue;
        if (RadComboBoxCloseAccountID.SelectedIndex > 0)
            CloseAccountID = RadComboBoxCloseAccountID.SelectedValue;
        if (RadTreeViewCat.SelectedNode.ParentNode != null)
        {
            BasicAccountId = RadTreeViewCat.SelectedNode.Value;
            AccountTreeId = GetNewTreeId(RadTreeViewCat.SelectedNode.Value, RadTreeViewCat.SelectedNode.Category);
        }
        else
            AccountTreeId = GetNewTreeId(RadTreeViewCat.SelectedNode.Value, "0");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        cmd.CommandText = string.Format(@"INSERT INTO TblAccounts (AccountId, AccountName, BasicAccountId, AccountNatureId, AccountRasidId, CloseAccountID, AccountTreeId, UserIn, TimeIn)
        VALUES ({0}, N'{1}', {2}, {3}, {4}, {5}, N'{6}', {7}, GETDATE())", MC.GetNewID("TblAccounts", "AccountId"), TxtAccountName.Text.Trim(), BasicAccountId, AccountNatureId, AccountRasidId, CloseAccountID, AccountTreeId, TheSessions.UserID);
        try
        {
            Telerik.Web.UI.RadTreeNode Nodi = new Telerik.Web.UI.RadTreeNode(TxtAccountName.Text.Trim(), MC.GetNewID("TblAccounts", "AccountId"));
            Nodi.Category = AccountTreeId;
            Nodi.ImageUrl = "~/Images/Folders.png";
            con.Open();
            cmd.ExecuteNonQuery();
            RadTreeViewCat.SelectedNode.Nodes.Add(Nodi);
            Nodi.Focus();
            LblState.Text = "تم اضافة الحساب";
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
    protected void BtnUpdate_Click(object sender, ImageClickEventArgs e)
    {
        if ( RadTreeViewCat.SelectedNodes.Count == 0)
            return;
        string AccountName = "NULL", AccountNatureId = "NULL", AccountRasidId = "NULL", CloseAccountID = "NULL";
        if (TxtAccountName.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل اسم الحساب";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            return;
        }
        else
            AccountName = "N'" + TxtAccountName.Text.Trim() + "'";
        if (RadComboBoxAccountNatureId.SelectedIndex > 0)
            AccountNatureId = RadComboBoxAccountNatureId.SelectedValue;
        if (RadComboBoxAccountRasidId.SelectedIndex > 0)
            AccountRasidId = RadComboBoxAccountRasidId.SelectedValue;
        if (RadComboBoxCloseAccountID.SelectedIndex > 0)
            CloseAccountID = RadComboBoxCloseAccountID.SelectedValue;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        cmd.CommandText = string.Format(@"Update TblAccounts Set AccountName = {0}, AccountNatureId = {1}, AccountRasidId = {2}, CloseAccountID = {3} Where AccountId = {4}"
        , AccountName, AccountNatureId, AccountRasidId, CloseAccountID, RadTreeViewCat.SelectedNode.Value);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم تعديل الحساب";
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
    protected void BtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        if (RadTreeViewCat.SelectedNode.Nodes.Count > 0)
        {
            LblState.Text = "لا يمكن حذف حساب به حسابات فرعيه";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Delete From TblAccounts Where AccountId = " + RadTreeViewCat.SelectedNode.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            RadTreeViewCat.SelectedNode.Remove();
            LblState.Text = "تم حذف الحساب";
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
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    #endregion
}