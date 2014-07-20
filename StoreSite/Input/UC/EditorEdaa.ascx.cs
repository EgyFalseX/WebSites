using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Functions;
using System.Data;
using System.Data.SqlClient;
using Telerik.Web.UI;
using System.Drawing;

public partial class EditorEdaa : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadMainCats(RadTreeView RadTreeViewCat)
    {
        RadTreeViewCat.Nodes.Clear();
        RadTreeNode MainNodI = new RadTreeNode("شجرة الحسابات", "-1");
        MainNodI.ImageUrl = "~/Images/Folders.png";
        MainNodI.Category = "0";
        MainNodI.LongDesc = "0";
        RadTreeViewCat.Nodes.Add(MainNodI);
        DataTable GeneralItems = MC.LoadDataTable(@"Select AccountId, AccountName, AccountTreeId From TblAccounts Where BasicAccountId = 0", "");
        foreach (DataRow R in GeneralItems.Rows)
        {
            RadTreeNode NodI = new RadTreeNode(R["AccountName"].ToString(), R["AccountId"].ToString());
            NodI.ImageUrl = "~/Images/Folders.png";
            NodI.Category = R["AccountTreeId"].ToString();
            MainNodI.Nodes.Add(NodI);
            LoadChildCats(NodI);
        }
    }
    private void LoadChildCats(RadTreeNode Node)
    {
        DataTable ItemChilds = MC.LoadDataTable("Select AccountId, AccountName, AccountTreeId, BasicAccountId From TblAccounts Where BasicAccountId = " + Node.Value, "");
        foreach (DataRow R in ItemChilds.Rows)
        {
            RadTreeNode NodI = new RadTreeNode(R["AccountName"].ToString(), R["AccountId"].ToString());
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
    private void LoadDefaultData()
    {
        DataTable edaatypeTbl = new DataTable("FX2010-12");
        edaatypeTbl = MC.LoadDataTable(@"Select edaatype, edaaname From CDedaatype", "");
        DDLedaatype.DataSource = edaatypeTbl;
        DDLedaatype.DataTextField = "edaaname";
        DDLedaatype.DataValueField = "edaatype";
        DDLedaatype.DataBind();

        DataTable CDbankTbl = new DataTable("FX2010-12");
        CDbankTbl = MC.LoadDataTable(@"Select bankacountcode, bankname, bankacountname From CDbank", "");
        RCBbankacountcode.DataSource = CDbankTbl;
        RCBbankacountcode.DataTextField = "bankacountname";
        RCBbankacountcode.DataValueField = "bankacountcode";
        RCBbankacountcode.DataBind();
    }
    private void ClearFrm()
    {
        Lblharaka_no.Text = MC.GetNewID("TBLalbank_edaa", "haraka_no");
        Txtkasema_no.Text = string.Empty;
        Txttotalsheek.Text = "0";
        Txtname.Text = string.Empty;
        Txtedaadate.Text = String.Format("{0}/{1}/{2}", DateTime.Today.Day, DateTime.Today.Month, DateTime.Today.Year);
        RCBbankacountcode.ClearSelection();
        Txtnotes.Text = string.Empty;
        RadTreeViewAcc.ClearSelectedNodes();
        Txtbankedaaname.Text = string.Empty;
        Txtsheek_date.Text = string.Empty;
        Txteshkakdate.Text = string.Empty;
        Txtsheek_no.Text = string.Empty;
        Txtbankedaaname.Enabled = true;
        Txtsheek_date.Enabled = true;
        Txteshkakdate.Enabled = true;
        Txtsheek_no.Enabled = true;
        CBtrhel.Checked = false;// tarhel Off
        BtnSave.Enabled = true;// Save On
        BtnUpdate.Enabled = false;// Update Off
    }
    private void TarhelCommand()
    {
//        string TRANSID = MC.GetNewID("TBLTRANSACTION", "TRANSID");
//        string TRTypeID;
//        string KIEDNO = Lblharaka_no.Text;
//        string KIEDDATE;
//        string TrhelDate;
//        DataRow row = MC.LoadDataTable(@"Select bankacountnumber, bankname, AccountId , (Select AccountName From TblAccounts Where AccountId = CDbank.AccountId) AS AccountName From CDbank Where bankacountcode = " + RCBbankacountcode.SelectedValue, "").Rows[0];
//        string kieddes;
//        SqlConnection con = MC.EStoreConnection;
//        SqlCommand cmd = new SqlCommand("", con);
//        SqlTransaction tr = null;
//        try
//        {
//            con.Open();
//            tr = con.BeginTransaction();
//            cmd.Transaction = tr;
//            if (DDLedaatype.SelectedValue == "1") //الايداع النقدي 
//            {
//                KIEDDATE = String.Format("'{0}'", Txtedaadate.Text);
//                TrhelDate = KIEDDATE;
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//                VALUES ({0}, 8, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, 1, {2}, {3}, GETDATE())",
//                TRANSID, KIEDNO, KIEDDATE, TheSessions.UserID);
//                cmd.ExecuteNonQuery();
//                kieddes = "ايداع نقدي بالقسيمه رقم " + Txtkasema_no.Text.Trim() + " حساب رقم " + row["bankacountnumber"] + " بنك " + row["bankname"] + " بتاريخ " + Txtedaadate.Text;
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//                VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')", TRANSID, row["AccountId"], RadTreeViewAcc.SelectedNode.Value, Txttotalsheek.Text.Trim(), kieddes);
//                cmd.ExecuteNonQuery();
//            }
//            else//الايداع شيكات  
//            {

//                KIEDDATE = String.Format("'{0}'", Txtedaadate.Text);
//                TrhelDate = KIEDDATE;
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//                VALUES ({0}, 13, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, 1, {2}, {3}, GETDATE())",
//                TRANSID, KIEDNO, KIEDDATE, TheSessions.UserID);
//                cmd.ExecuteNonQuery();
//                kieddes = "ايداع شيك بالقسيمه رقم " + Txtkasema_no.Text.Trim() + " حساب رقم " + row["bankacountnumber"] + " بنك " + row["bankname"] + " بتاريخ " + Txtedaadate.Text;
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//                VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')", TRANSID, MC.GetOptionValue(MC.AppOptions.UnderCollection), RadTreeViewAcc.SelectedNode.Value, Txttotalsheek.Text.Trim(), kieddes);
//                cmd.ExecuteNonQuery();
//                TRANSID = (Convert.ToInt16(TRANSID) + 1).ToString();
//                KIEDDATE = String.Format("'{0}'", Txteshkakdate.Text);
//                TrhelDate = KIEDDATE;
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//                VALUES ({0}, 13, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, 1, {2}, {3}, GETDATE())",
//                TRANSID, KIEDNO, KIEDDATE, TheSessions.UserID);
//                cmd.ExecuteNonQuery();
//                kieddes = "ايداع شيك بالقسيمه رقم " + Txtkasema_no.Text.Trim() + " لحساب " + row["AccountName"]  + " بتاريخ " + Txtedaadate.Text;
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//                VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')", TRANSID, row["AccountId"], MC.GetOptionValue(MC.AppOptions.UnderCollection), Txttotalsheek.Text.Trim(), kieddes);
//                cmd.ExecuteNonQuery();
//            }
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
            LoadDefaultData();
            LoadMainCats(RadTreeViewAcc);
            ClearFrm();
        }
            SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
    }
    protected void DDLedaatype_SelectedIndexChanged(object sender, EventArgs e)
    {
        Txtbankedaaname.Text = string.Empty;
        Txtsheek_date.Text = string.Empty;
        Txteshkakdate.Text = string.Empty;
        Txtsheek_no.Text = string.Empty;
        Txtbankedaaname.Enabled = false;
        Txtsheek_date.Enabled = false;
        Txteshkakdate.Enabled = false;
        Txtsheek_no.Enabled = false;
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        ClearFrm();
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string edaatype = DDLedaatype.SelectedValue;
        string haraka_no = Lblharaka_no.Text;
        string kasema_no;
        if (Txtkasema_no.Text.Length != 0)
            kasema_no = string.Format("N'{0}'", Txtkasema_no.Text.Trim());
        else
            kasema_no = "NULL";
        string totalsheek;
        if (Txttotalsheek.Text.Length != 0)
            totalsheek = Txttotalsheek.Text.Trim();
        else
            totalsheek = "NULL";
        string name;
        if (Txtname.Text.Length != 0)
            name = string.Format("N'{0}'", Txtname.Text.Trim());
        else
            name = "NULL";
        string edaadate;
        if (Txtedaadate.Text.Length != 0)
            edaadate = String.Format("CONVERT(datetime, '{0}', 103)", Txtedaadate.Text);
        else
            edaadate = "NULL";
        string bankacountcode;
        if (RCBbankacountcode.SelectedIndex != -1)
            bankacountcode = RCBbankacountcode.SelectedValue;
        else
            bankacountcode = "NULL";
        string notes;
        if (Txtnotes.Text.Length != 0)
            notes = string.Format("N'{0}'", Txtnotes.Text.Trim());
        else
            notes = "NULL";
        string AccountId;
        if (RadTreeViewAcc.SelectedNode != null)
            AccountId = RadTreeViewAcc.SelectedNode.Value;
        else
            AccountId = "NULL";
        string bankedaaname;
        if (Txtbankedaaname.Text.Length != 0 && Txtbankedaaname.Enabled == true)
            bankedaaname = string.Format("N'{0}'", Txtbankedaaname.Text.Trim());
        else
            bankedaaname = "NULL";
        string sheek_date;
        if (Txtsheek_date.Text.Length != 0 && Txtsheek_date.Enabled == true)
            sheek_date = string.Format("CONVERT(datetime, '{0}', 103)", Txtsheek_date.Text.Trim());
        else
            sheek_date = "NULL";
        string eshkakdate;
        if (Txteshkakdate.Text.Length != 0 && Txteshkakdate.Enabled == true)
            eshkakdate = string.Format("CONVERT(datetime, '{0}', 103)", Txteshkakdate.Text.Trim());
        else
            eshkakdate = "NULL";
        string sheek_no;
        if (Txtsheek_no.Text.Length != 0 && Txtsheek_no.Enabled == true)
            sheek_no = string.Format("N'{0}'", Txtsheek_no.Text.Trim());
        else
            sheek_no = "NULL";
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"INSERT INTO TBLalbank_edaa
            (kasema_no, bankacountcode, edaatype, edaadate, haraka_no, sheek_no, eshkakdate, sheek_date, AccountId, totalsheek, notes, name, trhel, bankedaaname, TimeIn, UserIn)
            VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10}, {11}, '{12}', {13}, GETDATE(), {14})", kasema_no, bankacountcode, edaatype, edaadate, 
            haraka_no, sheek_no, eshkakdate, sheek_date, AccountId, totalsheek, notes, name, CBtrhel.Checked, bankedaaname, TheSessions.UserID);
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
            if (CBtrhel.Checked == true)
                TarhelCommand();
            RadGridEditor.DataBind();
            ClearFrm();
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
        if (e.Item.Cells[2].Text == "&nbsp;")
            Lblharaka_no.Text = string.Empty; 

        Lblharaka_no.Text = e.Item.Cells[2].Text;
        DDLedaatype.SelectedValue = e.Item.Cells[3].Text;
        Txtkasema_no.Text = e.Item.Cells[4].Text;
        Txttotalsheek.Text = e.Item.Cells[5].Text;
        if (e.Item.Cells[6].Text == "&nbsp;")
            Txtname.Text = string.Empty;
        else
            Txtname.Text = e.Item.Cells[6].Text;
        Txtedaadate.Text = e.Item.Cells[7].Text;
        RCBbankacountcode.SelectedValue = e.Item.Cells[8].Text;
        if (e.Item.Cells[9].Text == "&nbsp;")
            Txtnotes.Text = string.Empty;
        else
            Txtnotes.Text = e.Item.Cells[9].Text;
        
        if (e.Item.Cells[10].Text == "&nbsp;")
            RadTreeViewAcc.ClearSelectedNodes();
        else
        {
            RadTreeViewAcc.FindNodeByValue(e.Item.Cells[10].Text).Selected = true;
            RadTreeViewAcc.FindNodeByValue(e.Item.Cells[10].Text).Expanded = true;
        }
        if (e.Item.Cells[11].Text == "&nbsp;")
            Txtbankedaaname.Text = string.Empty;
        else
            Txtbankedaaname.Text = e.Item.Cells[11].Text;
        if (e.Item.Cells[12].Text == "&nbsp;")
            Txtsheek_date.Text = string.Empty;
        else
            Txtsheek_date.Text = e.Item.Cells[12].Text;
        if (e.Item.Cells[13].Text == "&nbsp;")
            Txteshkakdate.Text = string.Empty;
        else
            Txteshkakdate.Text = e.Item.Cells[13].Text;
        if (e.Item.Cells[14].Text == "&nbsp;")
            Txtsheek_no.Text = string.Empty;
        else
            Txtsheek_no.Text = e.Item.Cells[14].Text;
        
        CBtrhel.Checked = ((CheckBox)e.Item.Cells[15].Controls[0]).Checked;
        BtnSave.Enabled = false;
        BtnUpdate.Enabled = true;
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        string edaatype = DDLedaatype.SelectedValue;
        string haraka_no = Lblharaka_no.Text;
        string kasema_no;
        if (Txtkasema_no.Text.Length != 0)
            kasema_no = string.Format("N'{0}'", Txtkasema_no.Text.Trim());
        else
            kasema_no = "NULL";
        string totalsheek;
        if (Txttotalsheek.Text.Length != 0)
            totalsheek = Txttotalsheek.Text.Trim();
        else
            totalsheek = "NULL";
        string name;
        if (Txtname.Text.Length != 0)
            name = string.Format("N'{0}'", Txtname.Text.Trim());
        else
            name = "NULL";
        string edaadate;
        if (Txtedaadate.Text.Length != 0)
            edaadate = String.Format("CONVERT(datetime, '{0}', 103)", Txtedaadate.Text);
        else
            edaadate = "NULL";
        string bankacountcode;
        if (RCBbankacountcode.SelectedIndex != -1)
            bankacountcode = RCBbankacountcode.SelectedValue;
        else
            bankacountcode = "NULL";
        string notes;
        if (Txtnotes.Text.Length != 0)
            notes = string.Format("N'{0}'", Txtnotes.Text.Trim());
        else
            notes = "NULL";
        string AccountId;
        if (RadTreeViewAcc.SelectedNode != null)
            AccountId = RadTreeViewAcc.SelectedNode.Value;
        else
            AccountId = "NULL";
        string bankedaaname;
        if (Txtbankedaaname.Text.Length != 0 && Txtbankedaaname.Enabled == true)
            bankedaaname = string.Format("N'{0}'", Txtbankedaaname.Text.Trim());
        else
            bankedaaname = "NULL";
        string sheek_date;
        if (Txtsheek_date.Text.Length != 0 && Txtsheek_date.Enabled == true)
            sheek_date = string.Format("CONVERT(datetime, '{0}', 103)", Txtsheek_date.Text.Trim());
        else
            sheek_date = "NULL";
        string eshkakdate;
        if (Txteshkakdate.Text.Length != 0 && Txteshkakdate.Enabled == true)
            eshkakdate = string.Format("CONVERT(datetime, '{0}', 103)", Txteshkakdate.Text.Trim());
        else
            eshkakdate = "NULL";
        string sheek_no;
        if (Txtsheek_no.Text.Length != 0 && Txtsheek_no.Enabled == true)
            sheek_no = string.Format("N'{0}'", Txtsheek_no.Text.Trim());
        else
            sheek_no = "NULL";
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"Update TBLalbank_edaa Set
            kasema_no = {0}, bankacountcode = {1}, edaatype = {2}, edaadate = {3}, sheek_no = {4}, eshkakdate = {5}, sheek_date = {6}, AccountId = {7}, totalsheek = {8}, notes = {9}, 
            name = {10}, trhel = '{11}', bankedaaname = {12}, TimeIn = GETDATE(), UserIn = {13} Where haraka_no = {14}", kasema_no, bankacountcode, edaatype, edaadate,
            sheek_no, eshkakdate, sheek_date, AccountId, totalsheek, notes, name, CBtrhel.Checked, bankedaaname, TheSessions.UserID, haraka_no);
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
            if (CBtrhel.Checked == true)
                TarhelCommand();
            RadGridEditor.DataBind();
            ClearFrm();
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
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
            //SqlConnection con = MC.EStoreConnection;
            //SqlCommand cmd = new SqlCommand("", con);
            //try
            //{
            //    string sheek_no = e.Item.KeyValues.Substring(e.Item.KeyValues.LastIndexOf(":") + 2);
            //    sheek_no = sheek_no.Substring(0, sheek_no.Length - 2);
            //    con.Open();
            //    cmd.CommandText = "Update TBLsheekno Set used = 'False' Where sheek_no = " + sheek_no;
            //    cmd.ExecuteNonQuery();
            //}
            //catch (SqlException ex)
            //{
            //    DisplayMessage(MC.CheckExp(ex));
            //}
            //con.Close();
            DisplayMessage("تم الحذف");
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    #endregion
    
}