using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Functions;
using System.Data.SqlClient;

public partial class EditorOptions : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadMainCats(Telerik.Web.UI.RadTreeView RadTreeViewX)
    {
        Telerik.Web.UI.RadTreeNode MainNodI = new Telerik.Web.UI.RadTreeNode("شجرة الحسابات", "-1");
        MainNodI.ImageUrl = "~/Images/Folders.png";
        MainNodI.Category = "0";
        MainNodI.LongDesc = "0";
        RadTreeViewX.Nodes.Add(MainNodI);

        DataTable GeneralItems = new DataTable("FX2010-12");
        GeneralItems = MC.LoadDataTable(@"Select AccountId, AccountName, AccountTreeId From TblAccounts Where BasicAccountId = 0", "");
        foreach (DataRow R in GeneralItems.Rows)
        {
            Telerik.Web.UI.RadTreeNode NodI = new Telerik.Web.UI.RadTreeNode(R["AccountName"].ToString(), R["AccountId"].ToString()) 
            { ImageUrl = "~/Images/Folders.png", Category = R["AccountTreeId"].ToString() };
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
        DataTable Tbl = new DataTable("FX2011-01");
        Tbl = MC.LoadDataTable(@"Select opname, opvalue, (Select AccountName From TblAccounts Where AccountId = CDOptions.opvalue) AS AccountName From CDOptions", "");
        foreach (DataRow row in Tbl.Rows)
        {
            if (row["opname"].ToString() == MC.AppOptions.customer.ToString())
            {
                Lblcus.Text = row["AccountName"].ToString();
                HiddenFieldCus.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.supplier.ToString())
            {
                LblSup.Text = row["AccountName"].ToString();
                HiddenFieldSup.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.inventory.ToString())
            {
                LblInv.Text = row["AccountName"].ToString();
                HiddenFieldInv.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.purchasing.ToString())
            {
                LblPur.Text = row["AccountName"].ToString();
                HiddenFieldPur.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.sales.ToString())
            {
                LblSale.Text = row["AccountName"].ToString();
                HiddenFieldSale.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.UnderExchange.ToString())
            {
                LblUnderEx.Text = row["AccountName"].ToString();
                HiddenFieldUnderEx.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.UnderCollection.ToString())
            {
                LblUnderCol.Text = row["AccountName"].ToString();
                HiddenFieldUnderCol.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.SaleReturner.ToString())
            {
                LblSaleReturner.Text = row["AccountName"].ToString();
                HiddenFieldSaleReturner.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.BuyReturner.ToString())
            {
                LblBuyReturner.Text = row["AccountName"].ToString();
                HiddenFieldBuyReturner.Value = row["opvalue"].ToString();
            }
            else if (row["opname"].ToString() == MC.AppOptions.CommercialCustomer.ToString())
            {
                LblCommercialCustomer.Text = row["AccountName"].ToString();
                HiddenFieldCommercialCustomer.Value = row["opvalue"].ToString();
            }
        }

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
            LoadMainCats(RadTreeViewAccCus);
            LoadMainCats(RadTreeViewAccSup);
            LoadMainCats(RadTreeViewAccInv);
            LoadMainCats(RadTreeViewAccPur);
            LoadMainCats(RadTreeViewAccSale);
            LoadMainCats(RadTreeViewUnderEx);
            LoadMainCats(RadTreeViewUnderCol);
            LoadMainCats(RadTreeViewSaleReturner);
            LoadMainCats(RadTreeViewBuyReturner);
            LoadMainCats(RadTreeViewCommercialCustomer);
            LoadDefaultDate();
        }
    }
    protected void BtnOkCus_Click(object sender, EventArgs e)
    {
        if (RadTreeViewAccCus.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            Lblcus.Text = string.Empty;
            HiddenFieldCus.Value = string.Empty;
            return;
        }
        Lblcus.Text = RadTreeViewAccCus.SelectedNode.Text;
        HiddenFieldCus.Value = RadTreeViewAccCus.SelectedNode.Value;
    }
    protected void BtnOkSup_Click(object sender, EventArgs e)
    {
        if (RadTreeViewAccSup.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblSup.Text = string.Empty;
            HiddenFieldSup.Value = string.Empty;
            return;
        }
        LblSup.Text = RadTreeViewAccSup.SelectedNode.Text;
        HiddenFieldSup.Value = RadTreeViewAccSup.SelectedNode.Value;
    }
    protected void BtnOkInv_Click(object sender, EventArgs e)
    {
        if (RadTreeViewAccInv.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblInv.Text = string.Empty;
            HiddenFieldInv.Value = string.Empty;
            return;
        }
        LblInv.Text = RadTreeViewAccInv.SelectedNode.Text;
        HiddenFieldInv.Value = RadTreeViewAccInv.SelectedNode.Value;
    }
    protected void BtnOkPur_Click(object sender, EventArgs e)
    {
        if (RadTreeViewAccPur.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblPur.Text = string.Empty;
            HiddenFieldPur.Value = string.Empty;
            return;
        }
        LblPur.Text = RadTreeViewAccPur.SelectedNode.Text;
        HiddenFieldPur.Value = RadTreeViewAccPur.SelectedNode.Value;
    }
    protected void BtnOkSale_Click(object sender, EventArgs e)
    {
        if (RadTreeViewAccSale.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblSale.Text = string.Empty;
            HiddenFieldSale.Value = string.Empty;
            return;
        }
        LblSale.Text = RadTreeViewAccSale.SelectedNode.Text;
        HiddenFieldSale.Value = RadTreeViewAccSale.SelectedNode.Value;

    }
    protected void BtnOkUnderEx_Click(object sender, EventArgs e)
    {
        if (RadTreeViewUnderEx.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblUnderEx.Text = string.Empty;
            HiddenFieldUnderEx.Value = string.Empty;
            return;
        }
        LblUnderEx.Text = RadTreeViewUnderEx.SelectedNode.Text;
        HiddenFieldUnderEx.Value = RadTreeViewUnderEx.SelectedNode.Value;

    }
    protected void BtnOkUnderCol_Click(object sender, EventArgs e)
    {
        if (RadTreeViewUnderCol.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblUnderCol.Text = string.Empty;
            HiddenFieldUnderCol.Value = string.Empty;
            return;
        }
        LblUnderCol.Text = RadTreeViewUnderCol.SelectedNode.Text;
        HiddenFieldUnderCol.Value = RadTreeViewUnderCol.SelectedNode.Value;

    }
    protected void BtnOkSaleReturner_Click(object sender, EventArgs e)
    {
        if (RadTreeViewSaleReturner.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblSaleReturner.Text = string.Empty;
            HiddenFieldSaleReturner.Value = string.Empty;
            return;
        }
        LblSaleReturner.Text = RadTreeViewSaleReturner.SelectedNode.Text;
        HiddenFieldSaleReturner.Value = RadTreeViewSaleReturner.SelectedNode.Value;
    }
    protected void BtnOkBuyReturner_Click(object sender, EventArgs e)
    {
        if (RadTreeViewBuyReturner.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblBuyReturner.Text = string.Empty;
            HiddenFieldBuyReturner.Value = string.Empty;
            return;
        }
        LblBuyReturner.Text = RadTreeViewBuyReturner.SelectedNode.Text;
        HiddenFieldBuyReturner.Value = RadTreeViewBuyReturner.SelectedNode.Value;
    }
    protected void BtnOkCommercialCustomer_Click(object sender, EventArgs e)
    {
        if (RadTreeViewCommercialCustomer.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = System.Drawing.Color.Red;
            LblCommercialCustomer.Text = string.Empty;
            HiddenFieldCommercialCustomer.Value = string.Empty;
            return;
        }
        LblCommercialCustomer.Text = RadTreeViewCommercialCustomer.SelectedNode.Text;
        HiddenFieldCommercialCustomer.Value = RadTreeViewCommercialCustomer.SelectedNode.Value;
    }
    protected void BtnCus_Click(object sender, EventArgs e)
    {
        if (HiddenFieldCus.Value == string.Empty || HiddenFieldCus.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldCus.Value, MC.AppOptions.customer.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnSup_Click(object sender, EventArgs e)
    {
        if (HiddenFieldSup.Value == string.Empty || HiddenFieldSup.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldSup.Value, MC.AppOptions.supplier.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnInv_Click(object sender, EventArgs e)
    {
        if (HiddenFieldInv.Value == string.Empty || HiddenFieldInv.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldInv.Value, MC.AppOptions.inventory.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnPur_Click(object sender, EventArgs e)
    {
        if (HiddenFieldPur.Value == string.Empty || HiddenFieldPur.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldPur.Value, MC.AppOptions.purchasing.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnSale_Click(object sender, EventArgs e)
    {
        if (HiddenFieldSale.Value == string.Empty || HiddenFieldSale.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldSale.Value, MC.AppOptions.sales.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnUnderEx_Click(object sender, EventArgs e)
    {
        if (HiddenFieldUnderEx.Value == string.Empty || HiddenFieldUnderEx.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldUnderEx.Value, MC.AppOptions.UnderExchange.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnUnderCol_Click(object sender, EventArgs e)
    {
        if (HiddenFieldUnderCol.Value == string.Empty || HiddenFieldUnderCol.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldUnderCol.Value, MC.AppOptions.UnderCollection.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnSaleReturner_Click(object sender, EventArgs e)
    {
        if (HiddenFieldSaleReturner.Value == string.Empty || HiddenFieldSaleReturner.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldSaleReturner.Value, MC.AppOptions.SaleReturner.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnBuyReturner_Click(object sender, EventArgs e)
    {
        if (HiddenFieldBuyReturner.Value == string.Empty || HiddenFieldBuyReturner.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldBuyReturner.Value, MC.AppOptions.BuyReturner.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnCommercialCustomer_Click(object sender, EventArgs e)
    {
        if (HiddenFieldCommercialCustomer.Value == string.Empty || HiddenFieldCommercialCustomer.Value == "-1")
        {
            LblState.Text = "من فضلك اختار حساب اولا ..";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format("Update CDOptions Set opvalue = N'{0}' Where opname = N'{1}'", HiddenFieldCommercialCustomer.Value, MC.AppOptions.CommercialCustomer.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحفظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
#endregion


    
}