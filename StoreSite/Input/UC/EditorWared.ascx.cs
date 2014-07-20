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
using System.Threading;

public partial class EditorWared : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void FixCharz()
    {
        //TxtInvIDIn.Text = MC.FixChar(TxtInvIDIn.Text);
        //TxtInvIDInSupplier.Text = MC.FixChar(TxtInvIDInSupplier.Text);
    }
    private void LoadDefaultData()
    {
        DataTable SuppliersTbl = new DataTable("FX2010-12");
        SuppliersTbl = MC.LoadDataTable(@"Select SupplierId, Supplier From TblSuppliers", "");
        RadComboBoxSupplierId.DataSource = SuppliersTbl;
        RadComboBoxSupplierId.DataTextField = "Supplier";
        RadComboBoxSupplierId.DataValueField = "SupplierId";
        RadComboBoxSupplierId.DataBind();

        //DataTable StoreTbl = new DataTable("FX2010-12");
        //StoreTbl = MC.LoadDataTable(@"Select StoreId, Storename From CdStore", "");
        //RadComboBoxStoreId.DataSource = StoreTbl;
        //RadComboBoxStoreId.DataTextField = "Storename";
        //RadComboBoxStoreId.DataValueField = "StoreId";
        //RadComboBoxStoreId.DataBind();
        //DDLType
        DataTable WaredTypeTbl = new DataTable("FX2010-12");
        WaredTypeTbl = MC.LoadDataTable(@"Select WaredTypeId, WaredTypeName From CdWaredType", "");
        DDLType.DataSource = WaredTypeTbl;
        DDLType.DataTextField = "WaredTypeName";
        DDLType.DataValueField = "WaredTypeId";
        DDLType.DataBind();
    }
    private void LoadBillz()
    {
        DataTable BillzTbl = new DataTable("FX2010-12");
        BillzTbl = MC.LoadDataTable(@"SELECT InvIDIn, notype, CONVERT(DATETIME, DateIn, 20) AS DateIn, SupplierId, (Select Supplier From TblSuppliers Where SupplierId = TblWared.SupplierId) AS Supplier, 
                                   Trhel, CONVERT(DATETIME, dateTrhel, 20) AS dateTrhel, InvIDInSupplier, TalabiaNo, WaredTypeId, 
                                   (Select WaredTypeName From CdWaredType Where WaredTypeId = TblWared.WaredTypeId) AS WaredTypeName,
                                   (Select AccountId From TblSuppliers Where SupplierId = TblWared.SupplierId) AS AccountId FROM TblWared Where WaredTypeId = 1");
        RadComboBoxBillz.DataSource = BillzTbl;
        RadComboBoxBillz.DataTextField = "notype";
        RadComboBoxBillz.DataValueField = "InvIDIn";
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
    private void LoadBillDetials()
    {
        //DataTable BillDetials = new DataTable("FX2010-12");
        //BillDetials = MC.LoadDataTable(@"SELECT (Select Material From TblMaterialDetiels Where MaterialId = TblWareddetails.MaterialId) AS Material, MaterialId, UnitPriceIn, InQty, StoreId, (Select Storename From CdStore Where StoreId = TblWareddetails.StoreId) AS Storename FROM TblWareddetails WHERE InvIDIn = " + RadComboBoxBillz.SelectedValue, "");
        //GridViewMaterial.DataSource = BillDetials;
        //GridViewMaterial.DataBind();
        //ViewState["BillDetials"] = BillDetials;
    }
    private string GetNewSerial()
    {
        string FixedContain = DateTime.Now.Year.ToString().Substring(2);
        if (DateTime.Now.Month.ToString().Length == 1)
            FixedContain += "0" + DateTime.Now.Month;
        else
            FixedContain += DateTime.Now.Month;
        if (DateTime.Now.Day.ToString().Length == 1)
            FixedContain += "0" + DateTime.Now.Day;
        else
            FixedContain += DateTime.Now.Day;
        try
        {
            DataTable FinalSerial = MC.LoadDataTable("SELECT MAX(InnerSerial) AS InnerSerial FROM TblWaredSerial WHERE InnerSerial like '" + FixedContain + @"%'", "");
            if (FinalSerial.Rows.Count == 0)
                FixedContain += "0001";
            else
            {
                if (FinalSerial.Rows[0]["InnerSerial"].ToString() == string.Empty)
                    FixedContain += "0001";
                else
                    FixedContain = NewFlexContain(Convert.ToInt16(FinalSerial.Rows[0]["InnerSerial"].ToString().Substring(6)));
            }

        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.Visible = true;
            LblState.ForeColor = Color.Red;
            return string.Empty;
        }
        return FixedContain;
    }
    private string NewFlexContain(int Flex)
    {
        string ReturnMe = DateTime.Now.Year.ToString().Substring(2);
        if (DateTime.Now.Month.ToString().Length == 1)
            ReturnMe += "0" + DateTime.Now.Month;
        else
            ReturnMe += DateTime.Now.Month;
        if (DateTime.Now.Day.ToString().Length == 1)
            ReturnMe += "0" + DateTime.Now.Day;
        else
            ReturnMe += DateTime.Now.Day;
        Flex += 1;
        switch (Flex.ToString().Length)
        {
            case 1:
                ReturnMe += "000" + Flex.ToString();
                break;
            case 2:
                ReturnMe += "00" + Flex.ToString();
                break;
            case 3:
                ReturnMe += "0" + Flex.ToString();
                break;
            case 4:
                ReturnMe += Flex.ToString();
                break;
        }
        return ReturnMe;
    }
    private void TarhelCommand()
    {
        /* What Should This Do :-
         * 1- Check and Get every needed values is existed.
         * 2- Insert Items Inner Serial.
         * 3- Insert into TBLTRANSACTION table 1 row for this bill.
         * 4- Insert into TBLTRAANSDETAILS table 1 row for TBLTRANSACTION row.
         * 5- Update (Trhel, dateTrhel) for Current bill.
         */
        CheckBoxTrhel.Checked = false;
        LblState.Text = "";
        DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];
        DataRow R = BillzTbl.Rows[RadComboBoxBillz.SelectedIndex];
        DataTable BillContain = new DataTable("FX2010-12");
        BillContain = MC.LoadDataTable(@"Select MaterialId, InQty From TblWareddetails Where InvIDIn = " + RadComboBoxBillz.SelectedValue, "");
        // 1-
        if (BillContain.Rows.Count == 0)// check for bill item count
        {
            LblState.Text = "يجب ان تحتوي الفاتوره علي صنف واحد علي الاقل قبل الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        string KIEDDATE = "NULL", KIEDDESC = "NULL", dateTrhel = "NULL", TRANSID = MC.GetNewID("TBLTRANSACTION", "TRANSID"), AccountIdD = "NULL", Daien = "NULL";
        if (R["DateIn"].ToString() == string.Empty)// check for bill date
        {
            LblState.Text = "يجب ادخال تاريخ الفاتوره قبل الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        else
            KIEDDATE = String.Format("CONVERT(DATETIME, '{0}', 20)", R["DateIn"]);
        try
        {
            if (Convert.ToDateTime(R["DateIn"].ToString()) > RadDatePickerdateTrhel.SelectedDate.Value)
            {
                LblState.Text = "تاريخ الادخال يجب ان يكون اقدم او يساوي تاريخ الترحيل";
                LblState.ForeColor = Color.Red;
                LblState.Visible = true;
                return;
            }
        }
        catch
        {
            LblState.Text = "التاريخ غير صحيح";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (R["WaredTypeName"].ToString() == string.Empty)// check for bill type
        {
            LblState.Text = "يجب ادخال نوع الفاتوره قبل الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        else
            KIEDDESC = "فاتورة مشتريات رقم " + R["InvIDIn"] + "بتاريخ " + R["DateIn"] + "من " + R["WaredTypeName"];
        if (RadDatePickerdateTrhel.SelectedDate == null)// check for bill trans date
        {
            LblState.Text = "يجب ادخال تاريخ الترحيل قبل الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            
            return;
        }
        else
            dateTrhel = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(RadDatePickerdateTrhel.SelectedDate.Value.ToShortDateString()));
        if (R["AccountId"].ToString() == string.Empty)// check for Supplier ID
        {
            LblState.Text = " يجب ادخال المورد قبل الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            CheckBoxTrhel.Checked = false;
            return;
        }
        else
            AccountIdD = R["AccountId"].ToString();
        Daien = MC.LoadDataTable(@"IF (Select SUM(UnitPriceIn * InQty) From TblWareddetails Where InvIDIn = " + R["InvIDIn"] + @") Is Not NULL
        Select SUM(UnitPriceIn * InQty) AS Total From TblWareddetails ELSE Select '0' AS Total", "").Rows[0]["Total"].ToString();
        string AccountIdM = MC.LoadDataTable(String.Format("Select opvalue From CDOptions Where opname = N'{0}'", MC.AppOptions.purchasing), "").Rows[0][0].ToString();
        SaveSerial();
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        SqlTransaction tr = null;
        try
        {
            con.Open();
            tr = con.BeginTransaction();
            cmd.Transaction = tr;
//            cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//            VALUES ({0}, 3, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, 'True', {2}, {3}, GETDATE())",
//            TRANSID, R["InvIDIn"], dateTrhel, TheSessions.UserID);
//            cmd.ExecuteNonQuery();
//            cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//            VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')", TRANSID, AccountIdD, AccountIdM, Daien, KIEDDESC);
//            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"UPDATE TblWared SET Trhel = 'True', dateTrhel = {0} WHERE (InvIDIn = {1})", dateTrhel, R["InvIDIn"].ToString());
            cmd.ExecuteNonQuery();
            DataTable BillItemz = MC.LoadDataTable("Select MaterialId, InQty, (UnitPriceIn * InQty) AS Total From TblWareddetails Where InvIDIn = " + R["InvIDIn"], "");
            foreach (DataRow Row in BillItemz.Rows)
            {
                cmd.CommandText = string.Format(@"Insert Into TblMatrial_IN_OUT (typeid, MaterialId, InvID, dateTrhel, QtyIn, QtyOut, AccountId, tmont) VALUES 
                (1, {0}, {1}, {2}, {3}, 0, {4}, {5})", Row["MaterialId"], R["InvIDIn"], dateTrhel, Row["InQty"], R["AccountId"], Row["Total"]);
                cmd.ExecuteNonQuery();
            }
            tr.Commit();
            CheckBoxTrhel.Checked = true;
            LblState.Text = "تم الترحيل للمخزن";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
            PnlBillGeneral.Visible = false;
            RadGridEditor.Visible = false;
            PnlDetails.Visible = false;
            LoadBillz();
            TxtInvIDIn.Text = MC.GetNewID("TblWared", "InvIDIn");
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
    private void SaveSerial()
    {
        DataTable BillContain = new DataTable("FX2010-12");
        BillContain = MC.LoadDataTable(@"Select MaterialId, InQty From TblWareddetails Where InvIDIn = " + RadComboBoxBillz.SelectedValue, "");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            foreach (DataRow row in BillContain.Rows)
            {
                string InnerSerial = GetNewSerial();
                for (int i = 0; i < Convert.ToInt16(row["InQty"]); i++)
                {
                    cmd.CommandText = string.Format("Insert INTO TblWaredSerial (InvIDIn, MaterialId, InnerSerial) Values ({0}, {1}, {2})", RadComboBoxBillz.SelectedValue, row["MaterialId"], InnerSerial);
                    cmd.ExecuteNonQuery();
                    InnerSerial = NewFlexContain(Convert.ToInt16(InnerSerial.Substring(6)));
                }
            }
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
        }
        con.Close();
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
            //LoadMainCats();
            LoadDefaultData();
            LoadBillz();
            TxtInvIDIn.Text = MC.GetNewID("TblWared", "InvIDIn");
            Txtnotype.Text = MC.LoadDataTable("SELECT ISNULL(MAX(notype) + 1, 1) AS NewID FROM TblWared Where WaredTypeId = 1", "").Rows[0][0].ToString();
        }
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
        SqlDataSourceStore.ConnectionString = MC.ConnectionStr();
        DDLType.SelectedValue = "1";
    }
    protected void CheckBoxTrhel_CheckedChanged(object sender, EventArgs e)
    {
        //RadDatePickerdateTrhel.Enabled = CheckBoxTrhel.Enabled;
        LblState.Visible = false;
        PnlTarhel.Visible = CheckBoxTrhel.Checked;
        
    }
    protected void BtnNewBill_Click(object sender, EventArgs e)
    {
        // enable editing mode that may desabled by tarhel check
        CheckBoxTrhel.Enabled = true;
        BtnUpdateBill.Enabled = true;
        //BtnAddItem.Enabled = true;
        //GridViewMaterial.Enabled = true;
        // enable the add mode
        PnlBillGeneral.Visible = true;
        RadGridEditor.Visible = false;
        BtnUpdateBill.Visible = false;
        BtnUpdateBillCancel.Visible = false;
        BtnAddBill.Visible = true;
        DDLType.SelectedValue = null;
        TxtInvIDIn.Text = MC.GetNewID("TblWared", "InvIDIn");
        Txtnotype.Text = MC.LoadDataTable("SELECT ISNULL(MAX(notype) + 1, 1) AS NewID FROM TblWared Where WaredTypeId = 1", "").Rows[0][0].ToString();
        RadDatePickerDateIn.SelectedDate = DateTime.Now;
        CheckBoxTrhel.Checked = false;
        RadDatePickerdateTrhel.SelectedDate = DateTime.Now;
        TxtInvIDInSupplier.Text = string.Empty;
        TxtTalabiaNo.Text = string.Empty;
        LblState.Visible = false;
        PnlDetails.Visible = false;
        RadGridEditor.Enabled = true;
        
    }
    protected void BtnAddBill_Click(object sender, EventArgs e)
    {
        if (TxtInvIDIn.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل رقم الفاتوره";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (!MC.IsInteger(TxtInvIDIn.Text.Trim()) || !MC.IsInteger(TxtTalabiaNo.Text.Trim()))
        {
            LblState.Text = "من فضلك ادخل رقم الفاتوره و رقم الطلبيه صحيح";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        string DateIn = "NULL", SupplierId = "NULL", dateTrhel = "NULL", InvIDInSupplier = "NULL", TalabiaNo = "NULL", WaredTypeId = "NULL";
        if (RadDatePickerDateIn.SelectedDate != null)
            DateIn = "CONVERT(DATETIME, '" + MC.ConvertToDateDMY(RadDatePickerDateIn.SelectedDate.Value.ToString()) + "', 20)";
        if (RadComboBoxSupplierId.SelectedIndex != -1)
            SupplierId = RadComboBoxSupplierId.SelectedValue;
        if (RadDatePickerdateTrhel.SelectedDate != null)
            dateTrhel = "CONVERT(DATETIME, '" + MC.ConvertToDateDMY(RadDatePickerdateTrhel.SelectedDate.Value.ToString()) + "', 20)";
        if (TxtInvIDInSupplier.Text.Trim().Length != 0)
            InvIDInSupplier = "N'" + TxtInvIDInSupplier.Text.Trim() + "'";
        if (TxtTalabiaNo.Text.Trim().Length != 0)
            TalabiaNo = TxtTalabiaNo.Text.Trim();
        if (DDLType.SelectedIndex != -1)
            WaredTypeId = DDLType.SelectedValue;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        cmd.CommandText = string.Format(@"INSERT INTO TblWared (InvIDIn, DateIn, SupplierId, Trhel, dateTrhel, InvIDInSupplier, TalabiaNo, TimeIn, UserIn, WaredTypeId, notype) VALUES 
        ({0}, {1}, {2}, '{3}', {4}, {5}, {6}, GetDate(), {7}, {8}, {9})",
        TxtInvIDIn.Text.Trim(), DateIn, SupplierId, CheckBoxTrhel.Checked.ToString(), dateTrhel, InvIDInSupplier, TalabiaNo, TheSessions.UserID, WaredTypeId, Txtnotype.Text.Trim());
        try
        {
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
            LoadBillDetials();
            PnlBillGeneral.Visible = true;
            RadGridEditor.Visible = true;
            RadGridEditor.Enabled = true;
            BtnUpdateBill.Visible = true;
            BtnUpdateBillCancel.Visible = true;
            BtnAddBill.Visible = false;
            PnlDetails.Visible = true;
            PnlShowHide.Visible = !PnlShowHide.Visible;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true; ;
        }
        con.Close();
    }
    protected void RadComboBoxBillz_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        LblState.Visible = false;
        if (RadComboBoxBillz.SelectedIndex > 0)
        {
            DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];
            DataRow R = BillzTbl.Rows[RadComboBoxBillz.SelectedIndex];
            TxtInvIDIn.Text = R["InvIDIn"].ToString();
            Txtnotype.Text = R["notype"].ToString();
            if (R["DateIn"].ToString() != string.Empty)
                RadDatePickerDateIn.SelectedDate = Convert.ToDateTime(MC.ConvertToDateDMY(R["DateIn"].ToString()));
            else
                RadDatePickerDateIn.SelectedDate = null;
            if (R["SupplierId"].ToString() != string.Empty)
                RadComboBoxSupplierId.SelectedValue = R["SupplierId"].ToString();
            else
                RadComboBoxSupplierId.SelectedIndex = -1;
            CheckBoxTrhel.Checked = (bool)R["Trhel"];
            if (R["dateTrhel"].ToString() != string.Empty)
                RadDatePickerdateTrhel.SelectedDate = Convert.ToDateTime(MC.ConvertToDateDMY(R["dateTrhel"].ToString()));
            else
                RadDatePickerdateTrhel.SelectedDate = null;
            TxtInvIDInSupplier.Text = R["InvIDInSupplier"].ToString();
            TxtTalabiaNo.Text = R["TalabiaNo"].ToString();
            if (R["WaredTypeId"].ToString() == string.Empty)
                DDLType.SelectedValue = null;
            else
                DDLType.SelectedValue = R["WaredTypeId"].ToString();
            LoadBillDetials();
            PnlBillGeneral.Visible = true;
            RadGridEditor.Visible = true;
            BtnUpdateBill.Visible = true;
            BtnUpdateBillCancel.Visible = true;
            BtnAddBill.Visible = false;
            if (CheckBoxTrhel.Checked)
            {
                CheckBoxTrhel.Enabled = false;
                BtnUpdateBill.Enabled = false;
                RadGridEditor.MasterTableView.Enabled = false;
            }
            else
            {
                CheckBoxTrhel.Enabled = true;
                BtnUpdateBill.Enabled = true;
                RadGridEditor.MasterTableView.Enabled = true;
            }
            PnlDetails.Visible = true;
        }
        else
        {
            TxtInvIDIn.Text = string.Empty;
            DDLType.SelectedValue = null;
            RadDatePickerDateIn.SelectedDate = null;
            RadComboBoxSupplierId.SelectedValue = null;
            CheckBoxTrhel.Checked = true;
            RadDatePickerdateTrhel.SelectedDate = null;
            TxtInvIDInSupplier.Text = string.Empty;
            TxtTalabiaNo.Text = string.Empty;
            PnlBillGeneral.Visible = false;
            RadGridEditor.Visible = false;
            BtnUpdateBill.Visible = false;
            BtnUpdateBillCancel.Visible = false;
            BtnAddBill.Visible = true;
            PnlDetails.Visible = false;
        }

    }
    protected void BtnAddItem_Click(object sender, ImageClickEventArgs e)
    {
//        if (TxtUnitPriceIn.Text.Trim().Length == 0 || TxtInQty.Text.Trim().Length == 0 || LblItemName.Text.Trim().Length == 0)
//        {
//            LblState.Text = "من فضلك ادخل سعر الوحدة و الكمية و صنف";
//            LblState.ForeColor = Color.Red;
//            LblState.Visible = true;
//            return;
//        }
//        if (RadTreeViewCat.SelectedNode.Category == "0")
//        {
//            LblState.Text = "من فضلك ادخل سعر الوحدة و الكمية و صنف";
//            LblState.ForeColor = Color.Red;
//            LblState.Visible = true;
//            return;
//        }
//        if (!MC.IsInteger(TxtInQty.Text.Trim()) || !MC.IsDecimal(TxtUnitPriceIn.Text.Trim()))
//        {
//            LblState.Text = "من فضلك ادخل سعر الوحدة و الكمية صحيح";
//            LblState.ForeColor = Color.Red;
//            LblState.Visible = true;
//            return;
//        }
//        string StoreId = "NULL";
//        if (RadComboBoxStoreId.SelectedIndex != -1)
//            StoreId = RadComboBoxStoreId.SelectedValue;

//        SqlConnection con = MC.EStoreConnection;
//        SqlCommand cmd = new SqlCommand("", con);
//        cmd.CommandText = string.Format(@"INSERT INTO TblWareddetails (InvIDIn, MaterialId, UnitPriceIn, InQty, StoreId, UserIn, TimeIn)
//                            VALUES ({0}, {1}, {2}, {3}, {4}, {5}, GETDATE())", RadComboBoxBillz.SelectedValue, RadTreeViewCat.SelectedNode.Value, TxtUnitPriceIn.Text.Trim(), TxtInQty.Text.Trim(), StoreId, TheSessions.UserID);
//        try
//        {
//            con.Open();
//            cmd.ExecuteNonQuery();
//            LblState.Text = "تم الاضافه";
//            LblState.ForeColor = Color.Green;
//            LblState.Visible = true;
//            LoadBillDetials();
//            TxtUnitPriceIn.Focus();
//        }
//        catch (SqlException ex)
//        {
//            LblState.Text = MC.CheckExp(ex);
//            LblState.ForeColor = Color.Red;
//            LblState.Visible = true; ;
//        }
//        con.Close();
    }
    protected void ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton imgbtn = (ImageButton)sender;
        GridViewRow gr = (GridViewRow)imgbtn.Parent.Parent;
        HiddenField hd = (HiddenField)gr.FindControl("HiddenFieldDeleteMaterialId");
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"DELETE FROM TblWareddetails WHERE InvIDIn = {0} And MaterialId = {1}", RadComboBoxBillz.SelectedValue, hd.Value);
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحذف";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
            LoadBillDetials();
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
        }
        con.Close();
    }
    protected void BtnDelBill_Click(object sender, EventArgs e)
    {
        if (RadComboBoxBillz.SelectedIndex <= 0)
            return;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"DELETE FROM TblWared WHERE InvIDIn = {0}", RadComboBoxBillz.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            RadGridEditor.Visible = false;
            PnlBillGeneral.Visible = false;
            LoadBillz();
            RadComboBoxBillz.Focus();
            LblState.Text = "تم الحذف";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
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
        if (TxtInvIDIn.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل رقم الفاتوره";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (!MC.IsInteger(TxtInvIDIn.Text.Trim()) || !MC.IsInteger(TxtTalabiaNo.Text.Trim()))
        {
            LblState.Text = "من فضلك ادخل رقم الفاتوره و رقم الطلبيه صحيح";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];

        string DateIn = "NULL", SupplierId = "NULL", dateTrhel = "NULL", InvIDInSupplier = "NULL", TalabiaNo = "NULL", WaredTypeId = "NULL";
        if (RadDatePickerDateIn.SelectedDate != null)
            DateIn = "CONVERT(DATETIME, '" + MC.ConvertToDateDMY(RadDatePickerDateIn.SelectedDate.Value.ToString()) + "', 20)";
        if (RadComboBoxSupplierId.SelectedIndex != -1)
            SupplierId = RadComboBoxSupplierId.SelectedValue;
        if (RadDatePickerdateTrhel.SelectedDate != null)
            dateTrhel = "CONVERT(DATETIME, '" + MC.ConvertToDateDMY(RadDatePickerdateTrhel.SelectedDate.Value.ToString()) + "', 20)";
        if (TxtInvIDInSupplier.Text.Trim().Length != 0)
            InvIDInSupplier = "N'" + TxtInvIDInSupplier.Text.Trim() + "'";
        if (TxtTalabiaNo.Text.Trim().Length != 0)
            TalabiaNo = TxtTalabiaNo.Text.Trim();
        if (DDLType.SelectedIndex != -1)
            WaredTypeId = DDLType.SelectedValue;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        cmd.CommandText = string.Format(@"Update TblWared Set DateIn = {0}, SupplierId = {1}, Trhel = '{2}', dateTrhel = {3}, InvIDInSupplier = {4}, TalabiaNo = {5}, TimeIn = GetDate(), UserIn = {6}, WaredTypeId = {7} Where InvIDIn = {8}",
        DateIn, SupplierId, CheckBoxTrhel.Checked.ToString(), dateTrhel, InvIDInSupplier, TalabiaNo, TheSessions.UserID, WaredTypeId, BillzTbl.Rows[RadComboBoxBillz.SelectedIndex]["InvIDIn"]);
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
    protected void BtnShowHide_Click(object sender, ImageClickEventArgs e)
    {
        PnlShowHide.Visible = !PnlShowHide.Visible;
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
                LblItemName.Text = dt.Rows[0]["Material"].ToString();
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
        LblItemName.Text = rtv.SelectedItem.Text;
        TxtItemCatID.Text = MC.LoadDataTable("Select CategoryId From TblMaterialDetiels Where MaterialId = " + rtv.SelectedItem.Value, "").Rows[0][0].ToString();
        HiddenFieldMaterialId.Value = rtv.SelectedItem.Value;
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
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
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
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من اضافة الصف وذلك بسبب:  " + Environment.NewLine + MC.CheckExp(ex));
        }
        else
            DisplayMessage("تم الاضافه");
    }
    protected void RadGridEditor_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            System.Data.SqlClient.SqlException ex = e.Exception as System.Data.SqlClient.SqlException;
            if (ex == null)
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + e.Exception.Message);
            else
                DisplayMessage("لم نتمكن من حذف الصف وذلك بسبب:  " + Environment.NewLine + MC.CheckExp(ex));
        }
        else
            DisplayMessage("تم الحذف");
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
    protected void RadPanelBarItems_ItemClick(object sender, RadPanelBarEventArgs e)
    {
        LblState.Text = string.Empty;
        RadPanelBar rtv = (RadPanelBar)sender;
        HiddenField hf = (HiddenField)rtv.Parent.Parent.FindControl("HiddenFieldMaterialId");
        TextBox TxtMID = (TextBox)rtv.Parent.Parent.FindControl("TxtItemCatID");
        Label LblItemName = (Label)rtv.Parent.Parent.FindControl("LblItemName");
        hf.Value = e.Item.Value;
        if (e.Item.Value != "-1")
        {
            if (e.Item.ToolTip != "1")
            {
                hf.Value = string.Empty;
                TxtMID.Text = string.Empty;
                LblItemName.Text = string.Empty;
            }
            else
            {
                hf.Value = e.Item.Value;
                TxtMID.Text = MC.LoadDataTable("Select CategoryId From TblMaterialDetiels Where MaterialId = " + e.Item.Value, "").Rows[0][0].ToString();
                LblItemName.Text = e.Item.Text;
            }
        }
        else
        {
            hf.Value = string.Empty;
            TxtMID.Text = string.Empty;
            LblItemName.Text = string.Empty;
        }


    }
    protected void RadPanelBarItems_Load(object sender, EventArgs e)
    {
        RadPanelBar TV = (RadPanelBar)sender;
        if (((RadPanelBar)sender).Items.Count == 0)
            LoadMainCats((RadPanelBar)sender);
    }
    protected void SqlDataSourceCodez_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (RadComboBoxBillz.SelectedIndex > 0)
        {
            LblOverTotal.Text = "قيمة الفاتوره  " + MC.LoadDataTable(string.Format(@"SELECT ISNULL(SUM(UnitPriceIn * InQty), 0) AS OverTotal FROM TblWareddetails WHERE (InvIDIn = {0})", RadComboBoxBillz.SelectedValue), "").Rows[0][0].ToString();
            LblOverTotal.Visible = true;
        }

    }
    protected void BtnTarhelOK_Click(object sender, EventArgs e)
    {
        if (CheckBoxTrhel.Checked)
            TarhelCommand();
    }
    protected void BtnTarhelCancel_Click(object sender, EventArgs e)
    {
        CheckBoxTrhel.Checked = false;
        PnlTarhel.Visible = false;
    }
    protected void BtnPrintSerial_Click(object sender, EventArgs e)
    {
        TheSessions.ReportName = MC.ReportNames.emptyserial.ToString();
        Response.Redirect("~/Report/ReportThis.aspx");
    }
    protected void BtnPrintBarcodeSerial_Click(object sender, EventArgs e)
    {
        TheSessions.ReportName = MC.ReportNames.barcodeserial.ToString();
        Response.Redirect("~/Report/ReportThis.aspx");
    }
    protected void BtnPrintBill_Click(object sender, EventArgs e)
    {
        TheSessions.ReportName = MC.ReportNames.eznedaffa.ToString();
        Response.Redirect("~/Report/ReportThis.aspx");
    }
    #endregion
    
}