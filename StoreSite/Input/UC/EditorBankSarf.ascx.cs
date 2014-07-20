using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using Functions;
using Telerik.Web.UI;

public partial class EditorBankSarf : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadMainCats()
    {
        RadTreeViewAcc.Nodes.Clear();
        Telerik.Web.UI.RadTreeNode MainNodI = new Telerik.Web.UI.RadTreeNode("شجرة الحسابات", "-1");
        MainNodI.ImageUrl = "~/Images/Folders.png";
        MainNodI.Category = "0";
        MainNodI.LongDesc = "0";
        RadTreeViewAcc.Nodes.Add(MainNodI);
        DataTable GeneralItems = MC.LoadDataTable(@"Select AccountId, AccountName, AccountTreeId From TblAccounts Where BasicAccountId = 0", "");
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
        DataTable ItemChilds = MC.LoadDataTable("Select AccountId, AccountName, AccountTreeId, BasicAccountId From TblAccounts Where BasicAccountId = " + Node.Value, "");
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
    private void LoadAccName()
    {
        DDLbankacountcode.DataSource = MC.LoadDataTable(@"Select bankacountcode, bankacountname From CDbank");
        DDLbankacountcode.DataTextField = "bankacountname";
        DDLbankacountcode.DataValueField = "bankacountcode";
        DDLbankacountcode.DataBind();
    }
    private void LoadSheek(string bankacountcode)
    {
        DDLsheek_no.DataSource = MC.LoadDataTable(@"SELECT [sheek_no] FROM [TBLsheekno]
        Where del = 'False' And used = 'False' And mortd = 'False' And bankacountcode = " + bankacountcode, "");
        DDLsheek_no.DataTextField = "sheek_no";
        DDLsheek_no.DataTextField = "sheek_no";
        DDLsheek_no.DataBind();
    }
    private void TarhelCommand(string haraka_no)
    {
        // Save 2 Transaction and 2 detials;

//        string TRANSID = MC.GetNewID("TBLTRANSACTION", "TRANSID");
//        DataRow row = MC.LoadDataTable(String.Format(@"Select bankacountnumber, bankname, AccountId, (Select sheek_no From TBLalbankSarf Where haraka_no = {0}) AS sheek_no From CDbank Where bankacountcode = (Select bankacountcode From TBLalbankSarf Where haraka_no = {0})", haraka_no), "").Rows[0];
//        string KIEDDATE = String.Format("'{0}'", Txtsheek_date.Text.Trim());
//        string KIEDDESC = @"دفعة مسددة بالشيك رقم " + row["sheek_no"] + " حساب رقم " + row["bankacountnumber"] + " " + row["bankname"] + " يستحق في " + Txteshkakdate.Text.Trim();
//        SqlConnection con = MC.EStoreConnection;
//        SqlCommand cmd = new SqlCommand("", con);
//        SqlTransaction tr = null;
//        try
//        {
//            con.Open();
//            tr = con.BeginTransaction();
//            cmd.Transaction = tr;
//            cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//            VALUES ({0}, 7, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, 1, {2}, {3}, GETDATE())",
//            TRANSID, haraka_no, KIEDDATE, TheSessions.UserID);
//            cmd.ExecuteNonQuery();
//            cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//            VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')", TRANSID, RadTreeViewAcc.SelectedNode.Value, MC.GetOptionValue(MC.AppOptions.UnderExchange), Txttotalsheek.Text.Trim(), KIEDDESC);
//            cmd.ExecuteNonQuery();
//            KIEDDATE = String.Format("'{0}'", Txteshkakdate.Text.Trim());
//            TRANSID = (MC.ConvertStringToInt(TRANSID) + 1).ToString();
//            cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//            VALUES ({0}, 7, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, 1, {2}, {3}, GETDATE())",
//            TRANSID, haraka_no, KIEDDATE, TheSessions.UserID);
//            cmd.ExecuteNonQuery();
//            cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//            VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')", TRANSID, MC.GetOptionValue(MC.AppOptions.UnderExchange), row["AccountId"], Txttotalsheek.Text.Trim(), KIEDDESC);
//            cmd.ExecuteNonQuery();
//            tr.Commit();
//        }
//        catch (SqlException ex)
//        {
//            tr.Rollback();
//            LblState.Text = MC.CheckExp(ex);
//            LblState.ForeColor = Color.Red;
//            LblState.Visible = true;
//        }
//        con.Close();
    }
    private void ClearFrm()
    {
        Txtesal_no.Text = string.Empty;
        Txtsname.Text = string.Empty;
        Txtsheek_date.Text = DateTime.Today.ToShortDateString();
        Txteshkakdate.Text = DateTime.Today.ToShortDateString();
        Txttotalsheek.Text = string.Empty;
        Txtnotes.Text = string.Empty;
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
            LoadMainCats();
            LoadAccName();
        }
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
    }
    protected void DDLbankacountcode_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDLbankacountcode.SelectedIndex == -1)
            return;
        LoadSheek(DDLbankacountcode.SelectedValue);
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        DDLbankacountcode.SelectedIndex = -1;
        DDLbankacountcode.Enabled = true;
        DDLsheek_no.SelectedIndex = -1;
        DDLsheek_no.Enabled = true;
        HiddenFieldDDLharaka_no.Value = string.Empty;
        Txtesal_no.Text = string.Empty;
        Txtsname.Text = string.Empty;
        Txtsheek_date.Text = string.Empty;
        Txteshkakdate.Text = string.Empty;
        Txttotalsheek.Text = string.Empty;
        RadTreeViewAcc.ClearSelectedNodes();
        Txtnotes.Text = string.Empty;
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (DDLbankacountcode.SelectedIndex <= 0 || DDLsheek_no.SelectedIndex == -1 || Txtesal_no.Text == string.Empty || Txtsname.Text == string.Empty || Txtsheek_date.Text == string.Empty || Txteshkakdate.Text == string.Empty || Txttotalsheek.Text == string.Empty || RadTreeViewAcc.SelectedNode == null)
        {
            LblState.Text = "من فضلك اكمل البيانات";
            LblState.ForeColor = Color.Red;
            return;
        }
        string notes;
        if (Txtnotes.Text.Trim().Length != 0)
            notes = String.Format("N'{0}'", Txtnotes.Text.Trim());
        else
            notes = "NULL";
        string haraka_no = MC.GetNewID("TBLalbankSarf", "haraka_no");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        SqlTransaction trn = null;
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO TBLalbankSarf (sheek_no, bankacountcode, haraka_no, esal_no, sname, sheek_date, eshkakdate, AccountId, totalsheek, notes, trhel, UserIn, TimeIn)
            VALUES ({0}, {1}, {2}, N'{3}', N'{4}', '{5}', '{6}', {7}, {8}, {9}, '{10}', {11}, GETDATE())", DDLsheek_no.SelectedValue, DDLbankacountcode.SelectedValue, haraka_no,
            Txtesal_no.Text.Trim(), Txtsname.Text.Trim(), Txtsheek_date.Text.Trim(), Txteshkakdate.Text.Trim(), RadTreeViewAcc.SelectedNode.Value, Txttotalsheek.Text.Trim(), notes, CheckBoxTrhel.Checked, TheSessions.UserID);
            con.Open();
            trn = con.BeginTransaction();
            cmd.Transaction = trn;
            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"Update TBLsheekno Set used = 'True' Where sheek_no = {0} And bankacountcode = {1}", DDLsheek_no.SelectedValue, DDLbankacountcode.SelectedValue);
            cmd.ExecuteNonQuery();
            trn.Commit();
            if (CheckBoxTrhel.Checked)
                TarhelCommand(haraka_no);
            ClearFrm();
            RadGridEditor.DataBind();
            LoadSheek(DDLbankacountcode.SelectedValue);
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            trn.Rollback();
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (HiddenFieldDDLharaka_no.Value == string.Empty)
        {
            LblState.Text = "من فضلك اختار شيك للتعديل";
            LblState.ForeColor = Color.Red;
            return;
        }
        if (Txtesal_no.Text == string.Empty || Txtsname.Text == string.Empty || Txtsheek_date.Text == string.Empty || Txteshkakdate.Text == string.Empty || Txttotalsheek.Text == string.Empty || RadTreeViewAcc.SelectedNode == null)
        {
            LblState.Text = "من فضلك اكمل البيانات";
            LblState.ForeColor = Color.Red;
            return;
        }
        string notes;
        if (Txtnotes.Text.Trim().Length != 0)
            notes = String.Format("N'{0}'", Txtnotes.Text.Trim());
        else
            notes = "NULL";
        bool trhel = (bool)MC.LoadDataTable("Select trhel From TBLalbankSarf Where haraka_no = " + HiddenFieldDDLharaka_no.Value, "").Rows[0][0];
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Update TBLalbankSarf Set esal_no = N'{0}', sname = N'{1}', sheek_date = '{2}', eshkakdate = '{3}', AccountId = {4}, 
            totalsheek = {5}, notes = {6}, trhel = '{7}', UserIn = {8}, TimeIn = GETDATE() Where haraka_no = {9}",
            Txtesal_no.Text.Trim(), Txtsname.Text.Trim(), Txtsheek_date.Text.Trim(), Txteshkakdate.Text.Trim(), RadTreeViewAcc.SelectedNode.Value,
            Txttotalsheek.Text.Trim(), notes, CheckBoxTrhel.Checked, TheSessions.UserID, HiddenFieldDDLharaka_no.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            if (CheckBoxTrhel.Checked && !trhel)
                TarhelCommand(HiddenFieldDDLharaka_no.Value);
            RadGridEditor.DataBind();
            LblState.Text = "تم التعديل";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void RadGridEditor_EditCommand(object source, GridCommandEventArgs e)
    {
        e.Canceled = true;
        RadGridEditor.MasterTableView.ClearEditItems();
        DDLbankacountcode.Enabled = false;
        DDLsheek_no.Enabled = false;
        HiddenFieldDDLharaka_no.Value = e.Item.Cells[5].Text;
        Txtesal_no.Text = e.Item.Cells[6].Text;
        Txtsname.Text = e.Item.Cells[7].Text;
        Txtsheek_date.Text = e.Item.Cells[8].Text;
        Txteshkakdate.Text = e.Item.Cells[9].Text;
        Txttotalsheek.Text = e.Item.Cells[12].Text;
        RadTreeViewAcc.FindNodeByValue(e.Item.Cells[10].Text).Selected = true;
        RadTreeViewAcc.FindNodeByValue(e.Item.Cells[10].Text).Expanded = true;
        Txtnotes.Text = e.Item.Cells[14].Text;
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    protected void RadGridEditor_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        LblState.Text = string.Empty;
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            SqlException ex = e.Exception as SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + MC.CheckExp(ex));
        }
        else
        {
            SqlConnection con = MC.EStoreConnection;
            SqlCommand cmd = new SqlCommand("", con);
            try
            {
                string sheek_no = e.Item.KeyValues.Substring(e.Item.KeyValues.LastIndexOf(":") + 2);
                sheek_no = sheek_no.Substring(0, sheek_no.Length - 2);
                con.Open();
                cmd.CommandText = "Update TBLsheekno Set used = 'False' Where sheek_no = " + sheek_no;
                cmd.ExecuteNonQuery();
                LoadSheek(DDLbankacountcode.SelectedValue);
            }
            catch (SqlException ex)
            {
                DisplayMessage(MC.CheckExp(ex));
            }
            con.Close();
            DisplayMessage("تم الحذف");
        }
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
    protected void RadGridEditor_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem) //Condition to disable tarhel row
        {
            if (((e.Item as GridDataItem)["trhel"].Controls[0] as CheckBox).Checked == true)
                e.Item.Enabled = false;
            else
                e.Item.Enabled = true;
        }
    }
#endregion
}