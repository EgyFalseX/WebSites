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

public partial class EditorCommercialBill : UserControl
{
    #region -   Functions   -
    private void FixCharz()
    {
        //TxtInvIDIn.Text = MC.FixChar(TxtInvIDIn.Text);
        //TxtInvIDInSupplier.Text = MC.FixChar(TxtInvIDInSupplier.Text);
    }
    private void LoadDefaultData()
    {
        DataTable CustomersTbl = new DataTable("FX2010-12");
        CustomersTbl = MC.LoadDataTable(@"Select CustomerId, Customer From TblCommercialCustomers");
        RadComboBoxCustomerId.DataSource = CustomersTbl;
        RadComboBoxCustomerId.DataTextField = "Customer";
        RadComboBoxCustomerId.DataValueField = "CustomerId";
        RadComboBoxCustomerId.DataBind();
        
        DataTable BranchTbl = new DataTable("FX2010-12");
        BranchTbl = MC.LoadDataTable(@"Select Branchecode, Branchename From CdBranches", "");
        DDLBranchecode.DataSource = BranchTbl;
        DDLBranchecode.DataTextField = "Branchename";
        DDLBranchecode.DataValueField = "Branchecode";
        DDLBranchecode.DataBind();

        DataTable codepaidTbl = new DataTable("FX2010-12");
        codepaidTbl = MC.LoadDataTable(@"Select PaidId, Paidname From codepaid", "");
        DDLType.DataSource = codepaidTbl;
        DDLType.DataTextField = "Paidname";
        DDLType.DataValueField = "PaidId";
        DDLType.DataBind();
    }
    private void LoadBillz()
    {
        DataTable BillzTbl = new DataTable("FX2010-12");
        BillzTbl = MC.LoadDataTable(@"SELECT InvIDOut, DateOut, PaidId, CustomerId, Branchecode, Trhel, CONVERT(DATETIME, dateTrhel, 20) AS dateTrhel, 
        (Select AccountId From TblCommercialCustomers Where CustomerId = TblOut.CustomerId) AS AccountId, ContractId, SystemId FROM TblOut Where OutTypeId = 3");
        RadComboBoxBillz.DataSource = BillzTbl;
        RadComboBoxBillz.DataTextField = "InvIDOut";
        RadComboBoxBillz.DataValueField = "InvIDOut";
        RadComboBoxBillz.DataBind();
        ViewState["BillzTbl"] = BillzTbl;
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
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!Functions.MC.GetPagePriv(new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name, TheSessions.UserID))
        {
            Response.Redirect("~/AccessDenied.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadDefaultData();
            LoadBillz();
            TxtInvIDOut.Text = MC.GetNewID("TblWared", "InvIDIn");
            Txtnotypeout.Text = MC.LoadDataTable("Select ISNULL(MAX(notypeout) + 1, 1) From TblOut Where OutTypeId = 3", "").Rows[0][0].ToString();
        }
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
    }
    protected void BtnNewBill_Click(object sender, EventArgs e)
    {
        //
        BtnDelBill.Enabled = true;
        CheckBoxTrhel.Enabled = true;
        BtnUpdateBill.Enabled = true;
        //
        PnlBillGeneral.Visible = true;
        PnlBillDetials.Visible = false;
        BtnUpdateBill.Visible = false;
        BtnUpdateBillCancel.Visible = false;
        BtnAddBill.Visible = true;
        DDLType.SelectedValue = null;
        RadComboBoxSystemId.SelectedValue = null;
        RadComboBoxContractId.SelectedValue = null;
        TxtInvIDOut.Text = MC.GetNewID("TblOut", "InvIDOut");
        Txtnotypeout.Text = MC.LoadDataTable("Select ISNULL(MAX(notypeout) + 1, 1) From TblOut Where OutTypeId = 1", "").Rows[0][0].ToString();
        RadDatePickerDateOut.SelectedDate = DateTime.Now;
        CheckBoxTrhel.Checked = false;
        RadDatePickerdateTrhel.SelectedDate = DateTime.Now;
        LblState.Visible = false;
    }
    protected void BtnDelBill_Click(object sender, EventArgs e)
    {
        if (RadComboBoxBillz.SelectedIndex <= 0)
            return;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"DELETE FROM TblOut WHERE InvIDOut = {0}", RadComboBoxBillz.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            PnlBillDetials.Visible = false;
            PnlBillGeneral.Visible = false;
            LoadBillz();
            RadComboBoxBillz.Focus();
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
        }
        con.Close();
    }
    protected void RadComboBoxBillz_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        LblState.Visible = false;
        PnlTarhel.Visible = false;
        if (RadComboBoxBillz.SelectedIndex > 0)
        {
            DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];
            DataRow R = BillzTbl.Rows[RadComboBoxBillz.SelectedIndex];
            TxtInvIDOut.Text = R["InvIDOut"].ToString();
            if (R["DateOut"].ToString() != string.Empty)
                RadDatePickerDateOut.SelectedDate = Convert.ToDateTime(MC.ConvertToDateDMY(R["DateOut"].ToString()));
            else
                RadDatePickerDateOut.SelectedDate = null;
            if (R["CustomerId"].ToString() != string.Empty)
                RadComboBoxCustomerId.SelectedValue = R["CustomerId"].ToString();
            else
                RadComboBoxCustomerId.SelectedIndex = -1;
            RadComboBoxCustomerId_SelectedIndexChanged(RadComboBoxCustomerId, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
            CheckBoxTrhel.Checked = (bool)R["Trhel"];
            if (R["dateTrhel"].ToString() != string.Empty)
                RadDatePickerdateTrhel.SelectedDate = Convert.ToDateTime(MC.ConvertToDateDMY(R["dateTrhel"].ToString()));
            else
                RadDatePickerdateTrhel.SelectedDate = null;
            if (R["PaidId"].ToString() == string.Empty)
                DDLType.SelectedValue = null;
            else
                DDLType.SelectedValue = R["PaidId"].ToString();
            if (R["Branchecode"].ToString() == string.Empty)
                DDLBranchecode.SelectedValue = null;
            else
                DDLBranchecode.SelectedValue = R["Branchecode"].ToString();
            if (R["ContractId"].ToString() == string.Empty)
                RadComboBoxContractId.SelectedValue = null;
            else
                RadComboBoxContractId.SelectedValue = R["ContractId"].ToString();
            RadComboBoxContractId_SelectedIndexChanged(RadComboBoxContractId, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
            if (R["SystemId"].ToString() == string.Empty)
                RadComboBoxSystemId.SelectedValue = null;
            else
                RadComboBoxSystemId.SelectedValue = R["SystemId"].ToString();
            RadComboBoxContractId_SelectedIndexChanged(RadComboBoxContractId, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
            PnlBillGeneral.Visible = true;
            PnlBillDetials.Visible = true;
            BtnUpdateBill.Visible = true;
            BtnUpdateBillCancel.Visible = true;
            BtnAddBill.Visible = false;
            if (CheckBoxTrhel.Checked)
            {
                BtnDelBill.Enabled = false;
                CheckBoxTrhel.Enabled = false;
                BtnUpdateBill.Enabled = false;
                RadGridEditor.Enabled = false;
            }
            else
            {
                BtnDelBill.Enabled = true;
                CheckBoxTrhel.Enabled = true;
                BtnUpdateBill.Enabled = true;
                RadGridEditor.Enabled = true;
            }
        }
        else
        {
            TxtInvIDOut.Text = string.Empty;
            DDLType.SelectedValue = null;
            RadDatePickerDateOut.SelectedDate = null;
            RadComboBoxCustomerId.SelectedValue = null;
            RadComboBoxContractId.SelectedValue = null;
            RadComboBoxSystemId.SelectedValue = null;
            CheckBoxTrhel.Checked = true;
            RadDatePickerdateTrhel.SelectedDate = null;
            PnlBillGeneral.Visible = false;
            PnlBillDetials.Visible = false;
            BtnUpdateBill.Visible = false;
            BtnUpdateBillCancel.Visible = false;
            BtnAddBill.Visible = true;
        }
    }
    protected void BtnAddBill_Click(object sender, EventArgs e)
    {
        if (TxtInvIDOut.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل رقم الفاتوره";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (!MC.IsInteger(TxtInvIDOut.Text.Trim()))
        {
            LblState.Text = "من فضلك ادخل رقم الفاتوره";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        string DateOut = "NULL", CustomerId = "NULL", dateTrhel = "NULL", PaidId = "NULL", Branchecode = "NULL", ContractId = "NULL", SystemId = "NULL";
        if (RadDatePickerDateOut.SelectedDate != null)
            DateOut = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(RadDatePickerDateOut.SelectedDate.Value.ToString()));
        if (RadComboBoxCustomerId.SelectedIndex != -1)
            CustomerId = RadComboBoxCustomerId.SelectedValue;
        if (RadDatePickerdateTrhel.SelectedDate != null)
            dateTrhel = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(RadDatePickerdateTrhel.SelectedDate.Value.ToString()));
        if (DDLType.SelectedIndex != -1)
            PaidId = DDLType.SelectedValue;
        if (DDLBranchecode.SelectedIndex != -1)
            Branchecode = DDLBranchecode.SelectedValue;
        if (RadComboBoxContractId.SelectedIndex != -1)
            ContractId = RadComboBoxContractId.SelectedValue;
        if (RadComboBoxSystemId.SelectedIndex != -1)
            SystemId = RadComboBoxSystemId.SelectedValue;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO TblOut (InvIDOut, DateOut, CustomerId, Trhel, dateTrhel, Branchecode, TimeIn, UserIn, PaidId, OutTypeId, notypeout, ContractId, SystemId) VALUES 
            ({0}, {1}, {2}, '{3}', {4}, {5}, GetDate(), {6}, {7}, 3, {8}, {9}, {10})",
            TxtInvIDOut.Text.Trim(), DateOut, CustomerId, CheckBoxTrhel.Checked.ToString(), dateTrhel, Branchecode, TheSessions.UserID, PaidId, Txtnotypeout.Text, ContractId, SystemId);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadBillz();
            if (RadComboBoxBillz.Items.Count != 0)
            {
                RadComboBoxBillz.SelectedIndex = RadComboBoxBillz.Items.Count - 1;
            }
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
            // Show Bill Detial
            PnlBillGeneral.Visible = true;
            PnlBillDetials.Visible = true;
            BtnUpdateBill.Visible = true;
            BtnUpdateBillCancel.Visible = true;
            BtnAddBill.Visible = false;
            RadGridEditor.Enabled = true;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true; ;
        }
        con.Close();
    }
    protected void BtnUpdateBill_Click(object sender, EventArgs e)
    {
        if (RadComboBoxBillz.SelectedIndex <= 0)
        {
            LblState.Text = "من فضلك اختار اذن من قائمة الاذون";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (TxtInvIDOut.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل رقم الفاتوره";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (!MC.IsInteger(TxtInvIDOut.Text.Trim()))
        {
            LblState.Text = "من فضلك ادخل رقم الفاتوره";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (RadComboBoxContractId.SelectedIndex <= 0)
        {
            LblState.Text = "من فضلك اختار عقد من قائمة العقود";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (RadComboBoxSystemId.SelectedIndex <= 0)
        {
            LblState.Text = "من فضلك اختار نظام من قائمة الانظمه";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];

        string DateOut = "NULL", CustomerId = "NULL", PaidId = "NULL", Branchecode = "NULL";
        if (RadDatePickerDateOut.SelectedDate != null)
            DateOut = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(RadDatePickerDateOut.SelectedDate.Value.ToString()));
        if (RadComboBoxCustomerId.SelectedIndex != -1)
            CustomerId = RadComboBoxCustomerId.SelectedValue;
        if (DDLType.SelectedIndex != -1)
            PaidId = DDLType.SelectedValue;
        if (DDLBranchecode.SelectedIndex != -1)
            Branchecode = DDLBranchecode.SelectedValue;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        cmd.CommandText = string.Format(@"Update TblOut Set DateOut = {0}, CustomerId = {1}, Branchecode = {2}, TimeIn = GetDate(), UserIn = {3}, PaidId = {4}, ContractId = {5}, SystemId = {6} Where InvIDOut = {7}",
        DateOut, CustomerId, Branchecode, TheSessions.UserID, PaidId, RadComboBoxContractId.SelectedValue, RadComboBoxSystemId.SelectedValue, BillzTbl.Rows[RadComboBoxBillz.SelectedIndex]["InvIDOut"]);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            LoadBillz();
            if (RadComboBoxBillz.Items.Count != 0)
                RadComboBoxBillz.SelectedIndex = RadComboBoxBillz.Items.Count - 1;
            LblState.Text = "تم التعـــديل";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true; ;
        }
        con.Close();
    }
    protected void BtnUpdateBillCancel_Click(object sender, EventArgs e)
    {
        BtnNewBill_Click(BtnNewBill, new EventArgs());
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        LblState.Visible = false;
    }
    protected void CheckBoxTrhel_CheckedChanged(object sender, EventArgs e)
    {
        LblState.Visible = false;
        PnlTarhel.Visible = CheckBoxTrhel.Checked;
    }
    protected void BtnTarhelOK_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["BillzTbl"];
        DateTime DateOut = (DateTime)dt.Rows[RadComboBoxBillz.SelectedIndex]["DateOut"];

        string dateTrhel;
        if (RadDatePickerdateTrhel.SelectedDate == null)
        {
            LblState.Text = "من فضلك اختار تاريخ الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        else if (RadDatePickerdateTrhel.SelectedDate.Value < DateOut)
        {
            LblState.Text = "لا يمكن ان يكون تاريخ الترحيل قبل تاريخ الادخال";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        else
            dateTrhel = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(RadDatePickerdateTrhel.SelectedDate.Value.ToString()));
        string AccountIdD = dt.Rows[RadComboBoxBillz.SelectedIndex]["AccountId"].ToString();
        string TRANSID = MC.GetNewID("TBLTRANSACTION", "TRANSID");
        string Valuez = MC.LoadDataTable(string.Format(@"SELECT ISNULL(SUM((UnitPriceOut * OutQty) - ((UnitPriceOut * OutQty) * (kasm/100))), 0) AS OverTotal FROM tblOutDetails WHERE (InvIDOut = {0})", dt.Rows[RadComboBoxBillz.SelectedIndex]["InvIDOut"]), "").Rows[0][0].ToString();
        string AccountIdM = MC.LoadDataTable(String.Format("Select opvalue From CDOptions Where opname = N'{0}'", MC.AppOptions.sales), "").Rows[0][0].ToString();
        string kieddes = "فاتوره مبيعات رقم " + dt.Rows[RadComboBoxBillz.SelectedIndex]["InvIDOut"].ToString() + " بتاريخ " + DateOut + " الي " + MC.LoadDataTable("Select ISNULL(Customer, 'غير موجود') From TblCustomes Where AccountId = " + AccountIdD, "").Rows[0][0];
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        SqlTransaction tr = null;
        try
        {
            
//            cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//            VALUES ({0}, 5, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, 'True', GETDATE(), {3}, GETDATE())",
//            TRANSID, RadComboBoxBillz.SelectedValue, dateTrhel, TheSessions.UserID);
            con.Open();
            tr = con.BeginTransaction();
            cmd.Transaction = tr;
            //cmd.ExecuteNonQuery();
//            cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdD, AccountIdM, Madeen, Daien, kieddes)
//            VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')", TRANSID, AccountIdD, AccountIdM, Valuez, kieddes);
//            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"UPDATE TblOut SET Trhel = 'True', dateTrhel = {0} WHERE (InvIDOut = {1})",
                                              dateTrhel, dt.Rows[RadComboBoxBillz.SelectedIndex]["InvIDOut"]);
            cmd.ExecuteNonQuery();
            DataTable BillItemz = MC.LoadDataTable("Select MaterialId, OutQty, ISNULL((UnitPriceOut * OutQty) - ((UnitPriceOut * OutQty) * (kasm/100)), 0) AS Total From tblOutDetails Where InvIDOut = " + dt.Rows[RadComboBoxBillz.SelectedIndex]["InvIDOut"], "");
            foreach (DataRow Row in BillItemz.Rows)
            {
                cmd.CommandText = string.Format(@"Insert Into TblMatrial_IN_OUT (typeid, MaterialId, InvID, dateTrhel, QtyIn, QtyOut, AccountId, tmont) VALUES 
                (2, {0}, {1}, {2}, 0, {3}, {4}, {5})", Row["MaterialId"], dt.Rows[RadComboBoxBillz.SelectedIndex]["InvIDOut"], dateTrhel, Row["OutQty"], AccountIdD, Row["Total"]);
                cmd.ExecuteNonQuery();
            }
            tr.Commit();
            PnlTarhel.Visible = false;
            LblState.Text = "تم الترحيل";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
            LoadBillz();
            RadComboBoxBillz_SelectedIndexChanged(RadComboBoxBillz, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
        }
        catch (SqlException ex)
        {
            tr.Rollback();
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
        }
        con.Close();
    }
    protected void BtnTarhelCancel_Click(object sender, EventArgs e)
    {
        CheckBoxTrhel.Checked = false;
        PnlTarhel.Visible = false;
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    protected void RadGridEditor_ItemUpdated(object source, GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            SqlException ex = e.Exception as SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من تعديل الصف وذلك بسبب:  " + Environment.NewLine + MC.CheckExp(ex));
        }
        else
            DisplayMessage("تم التعديل");
    }
    protected void RadGridEditor_ItemInserted(object source, GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            SqlException ex = e.Exception as SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + MC.CheckExp(ex));
        }
        else
        {
            DisplayMessage("تم الاضافه");
        }
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
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + MC.CheckExp(ex));
        }
        else
        {
            SqlConnection con = MC.EStoreConnection;
            SqlTransaction tr = null;
            SqlCommand cmd = new SqlCommand("", con);
            try
            {
                string MaterialId = e.Item.KeyValues.Substring(e.Item.KeyValues.LastIndexOf(":") + 2);
                MaterialId = MaterialId.Substring(0, MaterialId.Length - 2);
                con.Open();
                tr = con.BeginTransaction();
                cmd.Transaction = tr;
                cmd.CommandText = string.Format(@"UPDATE TblWaredSerial SET OUT = 0 FROM TblWaredSerial INNER JOIN
                                    tblOutDetails ON TblWaredSerial.MaterialId = tblOutDetails.MaterialId INNER JOIN
                                    TblSerOut ON TblWaredSerial.InnerSerial = TblSerOut.InnerSerial AND 
                                    tblOutDetails.InvIDOut = TblSerOut.InvIDOut
                                    WHERE (tblOutDetails.InvIDOut = {0}) AND (tblOutDetails.MaterialId = {1})", RadComboBoxBillz.SelectedValue, MaterialId);
                cmd.ExecuteNonQuery();
                cmd.CommandText = string.Format(@"DELETE FROM TblSerOut FROM TblSerOut INNER JOIN
                              tblOutDetails ON TblSerOut.InvIDOut = tblOutDetails.InvIDOut INNER JOIN
                              TblWaredSerial ON TblSerOut.InnerSerial = TblWaredSerial.InnerSerial AND 
                              tblOutDetails.MaterialId = TblWaredSerial.MaterialId
                              WHERE (tblOutDetails.InvIDOut = {0}) AND (tblOutDetails.MaterialId = {1})", RadComboBoxBillz.SelectedValue, MaterialId);
                cmd.ExecuteNonQuery();
                tr.Commit();
                LblState.Text = "تم الحذف";
                LblState.ForeColor = Color.Green;
                LblState.Visible = true;
            }
            catch (SqlException ex)
            {
                LblState.Text = MC.CheckExp(ex);
                LblState.ForeColor = Color.Red;
                LblState.Visible = true;
                tr.Rollback();
            }
            con.Close();
            DisplayMessage("تم الحذف");
        }
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
    protected void SqlDataSourceCodez_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (RadComboBoxBillz.SelectedIndex > 0)
        {
            LblOverTotal.Text = "قيمة الفاتوره  " + MC.LoadDataTable(string.Format(@"SELECT ISNULL(SUM((UnitPriceOut * OutQty) - ((UnitPriceOut * OutQty) * (kasm/100))), 0) AS OverTotal FROM tblOutDetails WHERE (InvIDOut = {0})", RadComboBoxBillz.SelectedValue), "").Rows[0][0].ToString();
            LblOverTotal.Visible = true;

        }
    }
    protected void BtnShowHide_Click(object sender, ImageClickEventArgs e)
    {
        PnlBillGeneral.Visible = !PnlBillGeneral.Visible;
    }
    protected void RadDatePickerDateOut_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
    {
        DataTable PricelistTbl = new DataTable("FalseX2011-05");
        if (RadComboBoxContractId.SelectedIndex > 0 && RadDatePickerDateOut.SelectedDate != null)
        {
            PricelistTbl = MC.LoadDataTable(string.Format(@"SELECT PricelistId, (Select Category From CdCategory Where CategoryId = (Select CategoryId From TblPricelists Where PricelistId = TblContractItems.PricelistId)) + ' / ' + 
                    (Select Convert(nvarchar, PricelistDatestart, 103) From TblPricelists Where PricelistId = TblContractItems.PricelistId) + ' / ' + 
                    (Select Convert(nvarchar, PricelistDateEnd, 103) From TblPricelists Where PricelistId = TblContractItems.PricelistId) AS Details FROM TblContractItems Where ContractId = {0} And 
                    (Select Convert(datetime, PricelistDateEnd, 103) From TblPricelists Where PricelistId = TblContractItems.PricelistId) <= Convert(datetime, '{1}', 103)", RadComboBoxContractId.SelectedValue, RadDatePickerDateOut.SelectedDate));
        }
        RadComboBoxPricelistId.DataSource = PricelistTbl;
        RadComboBoxPricelistId.DataTextField = "Details";
        RadComboBoxPricelistId.DataValueField = "PricelistId";
        RadComboBoxPricelistId.DataBind();
    }
    protected void RadComboBoxCustomerId_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        DataTable ContractTbl = new DataTable("FX2011-05");
        if (RadComboBoxCustomerId.SelectedIndex > 0)
        {
            ContractTbl = MC.LoadDataTable(@"SELECT ContractId, (Select Customer From TblCommercialCustomers Where CustomerId = TblContractes.CustomerId ) + ' / ' + 
            Convert(nvarchar, ContractDate, 103) + ' / ' + Cast(ValueOrder as nvarchar) + ' / ' + Cast(CreditLimit  as nvarchar) AS Details FROM TblContractes");
        }
        RadComboBoxContractId.DataSource = ContractTbl;
        RadComboBoxContractId.DataTextField = "Details";
        RadComboBoxContractId.DataValueField = "ContractId";
        RadComboBoxContractId.DataBind();
    }
    protected void RadComboBoxContractId_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        DataTable ContractTbl = new DataTable("FX2011-05");
        DataTable PricelistTbl = new DataTable("FalseX2011-05");
        if (RadComboBoxContractId.SelectedIndex > 0)
        {
            ContractTbl = MC.LoadDataTable(@"SELECT SystemId, (Select Paidname From codepaid Where PaidId = TblContractSystemes.PaidId ) + ' / ' + 
            Convert(nvarchar, LastDate, 103) + ' / ' + Cast(SystemValue as nvarchar) AS Details FROM TblContractSystemes");
            if (RadDatePickerDateOut.SelectedDate != null)
            {
                PricelistTbl = MC.LoadDataTable(string.Format(@"SELECT PricelistId, (Select Category From CdCategory Where CategoryId = (Select CategoryId From TblPricelists Where PricelistId = TblContractItems.PricelistId)) + ' / ' + 
                    (Select Convert(nvarchar, PricelistDatestart, 103) From TblPricelists Where PricelistId = TblContractItems.PricelistId) + ' / ' + 
                    (Select Convert(nvarchar, PricelistDateEnd, 103) From TblPricelists Where PricelistId = TblContractItems.PricelistId) AS Details FROM TblContractItems Where ContractId = {0} And 
                    (Select Convert(datetime, PricelistDateEnd, 103) From TblPricelists Where PricelistId = TblContractItems.PricelistId) <= Convert(datetime, '{1}', 103)", RadComboBoxContractId.SelectedValue, RadDatePickerDateOut.SelectedDate));
            }
        }
        RadComboBoxSystemId.DataSource = ContractTbl;
        RadComboBoxSystemId.DataTextField = "Details";
        RadComboBoxSystemId.DataValueField = "SystemId";
        RadComboBoxSystemId.DataBind();

        RadComboBoxPricelistId.DataSource = PricelistTbl;
        RadComboBoxPricelistId.DataTextField = "Details";
        RadComboBoxPricelistId.DataValueField = "PricelistId";
        RadComboBoxPricelistId.DataBind();
    }
    protected void RadComboBoxPricelistId_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        DataTable MaterialTbl = new DataTable("FalseX2011-05");
        if (RadComboBoxPricelistId.SelectedIndex > 0)
            MaterialTbl = MC.LoadDataTable("Select MaterialId, (Select ISNULL(discount, 0) From TblPricelists Where PricelistId = TblPriceListDetails.PricelistId) AS discount, (Select Material From TblMaterialDetiels Where MaterialId = TblPriceListDetails.MaterialId) AS Material, ISNULL(listpriceout, 0) AS listpriceout From TblPriceListDetails Where PricelistId = " + RadComboBoxPricelistId.SelectedValue, "");
        RadComboBoxMaterialId.DataSource = MaterialTbl;
        RadComboBoxMaterialId.DataTextField = "Material";
        RadComboBoxMaterialId.DataValueField = "MaterialId";
        RadComboBoxMaterialId.DataBind();
        ViewState["MaterialTbl"] = MaterialTbl;
        
    }
    protected void RadComboBoxMaterialId_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        DataTable MaterialTbl = (DataTable)ViewState["MaterialTbl"];
        DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];
        if (RadComboBoxMaterialId.SelectedIndex > 0)
        {
            float listpriceout = float.Parse(MaterialTbl.Rows[RadComboBoxMaterialId.SelectedIndex]["listpriceout"].ToString());
            float discount = (float.Parse(MaterialTbl.Rows[RadComboBoxMaterialId.SelectedIndex]["discount"].ToString()) / 100) * listpriceout;
            if (BillzTbl.Rows[RadComboBoxBillz.SelectedIndex]["PaidId"] == "1")// نقدا يستحق الخصم
                TxtUnitPriceOut.Text = (listpriceout - discount).ToString();
            else
                TxtUnitPriceOut.Text = listpriceout.ToString();
        }
        else
            TxtUnitPriceOut.Text = "0";
    }
    protected void ImgBtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        if (RadComboBoxPricelistId.SelectedIndex <= 0 || RadComboBoxMaterialId.SelectedIndex <= 0 || TxtOutQty.Text == string.Empty)
        {
            LblState.Text = "من فضلك ادخل القائمه و الصنف و الكميه";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
        }
        DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"INSERT INTO tblOutDetails (InvIDOut, MaterialId, UnitPriceOut, OutQty, PricelistId, UserIn, TimeIn, kasm, StoreId) VALUES 
            ({0}, {1}, {2}, {3}, {4}, {5}, GETDATE(), 0, 1)", BillzTbl.Rows[RadComboBoxBillz.SelectedIndex]["InvIDOut"], RadComboBoxMaterialId.SelectedValue, TxtUnitPriceOut.Text, TxtOutQty.Text, RadComboBoxPricelistId.SelectedValue, TheSessions.UserID);
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
            RadGridEditor.DataBind();
            TxtOutQty.Text = string.Empty;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
        }
        con.Close();
    }
    protected void RadGridEditor_EditCommand(object source, GridCommandEventArgs e)
    {
        e.Canceled = true;
        RadGridEditor.MasterTableView.ClearEditItems();
        RadComboBoxPricelistId.SelectedValue = e.Item.Cells[2].Text;
        RadComboBoxMaterialId.SelectedValue = e.Item.Cells[3].Text;
        TxtUnitPriceOut.Text = e.Item.Cells[4].Text;
        TxtOutQty.Text = e.Item.Cells[5].Text;
    }
#endregion
    
}