using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Functions;
using System.Data.SqlClient;
using System.Data;
using Telerik.Web.UI;

public partial class EditorBankSarf : System.Web.UI.UserControl
{
    //1- In Insertion Should edit TBLsheekno information (used) and so on.
    //2- When Delete Should Delete Transaction.
    #region -   Functions   -
    private void LoadMainCats(Telerik.Web.UI.RadTreeView RadTreeViewCat)
    {
        RadTreeViewCat.Nodes.Clear();
        Telerik.Web.UI.RadTreeNode MainNodI = new Telerik.Web.UI.RadTreeNode("شجرة الحسابات", "-1");
        MainNodI.ImageUrl = "~/Images/Folders.png";
        MainNodI.Category = "0";
        MainNodI.LongDesc = "0";
        RadTreeViewCat.Nodes.Add(MainNodI);
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
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        TheSessions.UserID = "1";
        if (TheSessions.UserID == string.Empty)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!IsPostBack)
        {
            SqlDataSourceCodez.ConnectionString = Functions.MC.ConnectionStr();
            SqlDataSourcebankacountcode.ConnectionString = Functions.MC.ConnectionStr();
            SqlDataSourcesheek_no.ConnectionString = Functions.MC.ConnectionStr();
        }
    }
    private void Loadsheek_noData(DropDownList DDL, string bankacountcode)
    {
        DataTable dt = MC.LoadDataTable(String.Format(@"Select sheek_no, bankacountcode From TBLsheekno Where bankacountcode = {0} And del = 'False' And used = 'False' And mortd = 'False'", bankacountcode), "");
        DDL.DataSource = dt;
        DDL.DataTextField = "sheek_no";
        DDL.DataValueField = "sheek_no";
        DDL.DataBind();
    }
    protected void RadTreeViewCat_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
    {
        LblState.Text = string.Empty;
        RadTreeView rtv = (RadTreeView)sender;
        HiddenField hf = (HiddenField)rtv.Parent.Parent.FindControl("HiddenFieldAccountIdEdit");
        if (e.Node.Value != "-1")
            hf.Value = e.Node.Value;
        else
            hf.Value = string.Empty;
    }
    protected void RadTreeViewCat_Load(object sender, EventArgs e)
    {
        Telerik.Web.UI.RadTreeView TV = (Telerik.Web.UI.RadTreeView)sender;
        if (((Telerik.Web.UI.RadTreeView)sender).Nodes.Count == 0)
            LoadMainCats((Telerik.Web.UI.RadTreeView)sender);
    }
    protected void RadGridEditor_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + Functions.MC.CheckExp(ex));
        }
        else
            DisplayMessage("تم التعديل");
    }
    protected void RadGridEditor_ItemInserted(object source, Telerik.Web.UI.GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + Functions.MC.CheckExp(ex));
        }
        else
            DisplayMessage("تم الاضافه");
    }
    protected void RadGridEditor_ItemDeleted(object source, Telerik.Web.UI.GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + Functions.MC.CheckExp(ex));
        }
        else
            DisplayMessage("تم الحذف");
    }
    protected void DDLbankacountname_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlSender = (DropDownList)sender;
            DropDownList ddl = (DropDownList)ddlSender.Parent.Parent.FindControl("DDLsheek_no");
            if (ddlSender.SelectedIndex != -1)
                Loadsheek_noData(ddl, ddlSender.SelectedValue);
        }
        catch (Exception)
        {
        }
    }
    protected void RadGridEditor_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditFormItem && e.Item.IsInEditMode)
        {
            try
            {
                HiddenField hfAccountId = (HiddenField)e.Item.FindControl("HiddenFieldAccountIdEdit");
                RadTreeView RadTreeViewCat = (RadTreeView)e.Item.FindControl("RadTreeViewCat");
                RadTreeViewCat.FindNodeByValue(hfAccountId.Value).Selected = true;
            }
            catch (Exception)
            {
            }
        }
    }
    protected void SqlDataSourceCodez_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows == 0)
            return;

        // Save Transaction and 2 detials;
        string haraka_no = MC.LoadDataTable(@"Select MAX(haraka_no) From TBLalbankSarf", "").Rows[0][0].ToString();
        string TRANSID = MC.GetNewID("TBLTRANSACTION", "TRANSID");
        DataRow row = MC.LoadDataTable(@"Select bankacountnumber,bankname from CDbank Where bankacountcode = " + e.Command.Parameters["@bankacountcode"].Value.ToString()).Rows[0];
        string KIEDDATE = "'" + e.Command.Parameters["@sheek_date"].Value.ToString() + "'";
        string KIEDDESC = @"دفعة مسددة بالشيك رقم " + e.Command.Parameters["@sheek_no"].Value.ToString() + " حساب رقم " + row["bankacountnumber"] + " " + row["bankname"] + " يستحق في " + e.Command.Parameters["@eshkakdate"].Value.ToString() + " ل " + e.Command.Parameters["@notes"].Value.ToString();
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        SqlTransaction tr = null;
        try
        {
            con.Open();
            tr = con.BeginTransaction();
            cmd.Transaction = tr;
            cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, KIEDDESC, trhel, TrhelDate, UserIn, TimeIn)
            VALUES ({0}, 7, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, N'{3}', 1, GETDATE(), {4}, GETDATE())",
            TRANSID, MC.GetNewID("TBLTRANSACTION", "KIEDNO"), KIEDDATE, KIEDDESC, TheSessions.UserID);
            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountId, Madeen, Daien, MostandNo, kieddes, TimeIn, UserIn)
            VALUES ({0}, 1, {1}, 0, {2}, N'{3}', N'{4}', GETDATE(), {5})", TRANSID, e.Command.Parameters["@bankacountcode"].Value.ToString(), e.Command.Parameters["@totalsheek"].Value.ToString(), haraka_no, KIEDDESC, TheSessions.UserID);
            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountId, Madeen, Daien, MostandNo, kieddes, TimeIn, UserIn)
            VALUES ({0}, 2, {1}, {2}, 0, N'{3}', N'{4}', GETDATE(), {5})", TRANSID, e.Command.Parameters["@AccountId"].Value.ToString(), e.Command.Parameters["@totalsheek"].Value.ToString(), haraka_no, KIEDDESC, TheSessions.UserID);
            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"Update TBLsheekno Set used = 'True' Where sheek_no = {0} And bankacountcode = {1}", e.Command.Parameters["@sheek_no"].Value.ToString(), e.Command.Parameters["@bankacountcode"].Value.ToString());
            cmd.ExecuteNonQuery();
            tr.Commit();
        }
        catch (SqlException ex)
        {
            tr.Rollback();
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
            LblState.Visible = true;
        }
        con.Close();

    }
    #endregion
}