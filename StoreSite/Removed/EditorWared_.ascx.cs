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

        DataTable StoreTbl = new DataTable("FX2010-12");
        StoreTbl = MC.LoadDataTable(@"Select StoreId, Storename From CdStore", "");
        RadComboBoxStoreId.DataSource = StoreTbl;
        RadComboBoxStoreId.DataTextField = "Storename";
        RadComboBoxStoreId.DataValueField = "StoreId";
        RadComboBoxStoreId.DataBind();
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
        BillzTbl = MC.LoadDataTable(@"SELECT InvIDIn, CONVERT(DATETIME, DateIn, 20) AS DateIn, SupplierId, (Select Supplier From TblSuppliers Where SupplierId = TblWared.SupplierId) AS Supplier, 
                                   Trhel, CONVERT(DATETIME, dateTrhel, 20) AS dateTrhel, InvIDInSupplier, TalabiaNo, WaredTypeId, 
                                   (Select WaredTypeName From CdWaredType Where WaredTypeId = TblWared.WaredTypeId) AS WaredTypeName,
                                   (Select AccountId From TblSuppliers Where SupplierId = TblWared.SupplierId) AS AccountId FROM TblWared");
        RadComboBoxBillz.DataSource = BillzTbl;
        RadComboBoxBillz.DataTextField = "InvIDIn";
        RadComboBoxBillz.DataValueField = "InvIDIn";
        RadComboBoxBillz.DataBind();
        ViewState["BillzTbl"] = BillzTbl;
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
            LoadCatItems(NodI);
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
            LoadCatItems(NodI);
        }
    }
    private void LoadCatItems(Telerik.Web.UI.RadTreeNode Node)
    {
        DataTable CatItems = new DataTable("FX2010-11");
        CatItems = MC.LoadDataTable("Select MaterialId, Material From TblMaterialDetiels Where CategoryId = " + Node.Value, "");
        foreach (DataRow R in CatItems.Rows)
        {
            Telerik.Web.UI.RadTreeNode NodI = new Telerik.Web.UI.RadTreeNode(R["Material"].ToString(), R["MaterialId"].ToString());
            NodI.ImageUrl = "~/Images/Material.png";
            NodI.Category = "1";
            Node.Nodes.Add(NodI);
        }

    }
    private void LoadBillDetials()
    {
        DataTable BillDetials = new DataTable("FX2010-12");
        BillDetials = MC.LoadDataTable(@"SELECT (Select Material From TblMaterialDetiels Where MaterialId = TblWareddetails.MaterialId) AS Material, MaterialId, UnitPriceIn, InQty, StoreId, (Select Storename From CdStore Where StoreId = TblWareddetails.StoreId) AS Storename FROM TblWareddetails WHERE InvIDIn = " + RadComboBoxBillz.SelectedValue, "");
        GridViewMaterial.DataSource = BillDetials;
        GridViewMaterial.DataBind();
        ViewState["BillDetials"] = BillDetials;
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
            CheckBoxTrhel.Checked = false;
            return;
        }
        string KIEDDATE = "NULL", KIEDDESC = "NULL", dateTrhel = "NULL", TRANSID = MC.GetNewID("TBLTRANSACTION", "TRANSID"), AccountId = "NULL", Daien = "NULL";
        if (R["DateIn"].ToString() == string.Empty)// check for bill date
        {
            LblState.Text = "يجب ادخال تاريخ الفاتوره قبل الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            CheckBoxTrhel.Checked = false;
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
                CheckBoxTrhel.Checked = false;
                return;
            }
        }
        catch
        {
            LblState.Text = "التاريخ غير صحيح";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            CheckBoxTrhel.Checked = false;
            return;
        }
        if (R["WaredTypeName"].ToString() == string.Empty)// check for bill type
        {
            LblState.Text = "يجب ادخال نوع الفاتوره قبل الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            CheckBoxTrhel.Checked = false;
            return;
        }
        else
            KIEDDESC = R["WaredTypeName"].ToString();
        if (RadDatePickerdateTrhel.SelectedDate == null)// check for bill trans date
        {
            LblState.Text = "يجب ادخال تاريخ الترحيل قبل الترحيل";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            CheckBoxTrhel.Checked = false;
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
            AccountId = R["AccountId"].ToString();
        Daien = MC.LoadDataTable(@"IF (Select SUM(UnitPriceIn * InQty) From TblWareddetails Where InvIDIn = " + R["InvIDIn"].ToString() + @") Is Not NULL
        Select SUM(UnitPriceIn * InQty) AS Total From TblWareddetails ELSE Select '0' AS Total", "").Rows[0]["Total"].ToString();
        SaveSerial();
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        //SqlTransaction tr = null;
        try
        {
            con.Open();
            //tr = con.BeginTransaction();
            //cmd.Transaction = tr;
            cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, KIEDDESC, trhel, TrhelDate, UserIn, TimeIn)
            VALUES ({0}, 3, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, {2}, N'{3}', 'False', NULL, {4}, GETDATE())",
            TRANSID, MC.GetNewID("TBLTRANSACTION", "KIEDNO"), KIEDDATE, KIEDDESC, TheSessions.UserID);
            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountId, Madeen, Daien, MostandNo, TimeIn, UserIn)
            VALUES ({0}, 1, {1}, 0, {2}, N'{3}', GETDATE(), {4})", TRANSID, AccountId, Daien, R["InvIDIn"].ToString(), TheSessions.UserID);
            cmd.ExecuteNonQuery();
            cmd.CommandText = string.Format(@"UPDATE TblWared SET Trhel = 'True', dateTrhel = {0} WHERE (InvIDIn = {1})",
                                              dateTrhel, R["InvIDIn"].ToString());
            cmd.ExecuteNonQuery();
            //tr.Commit();
            LblState.Text = "تم الترحيل للمخزن";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
            PnlBillGeneral.Visible = false;
            PnlBillDetials.Visible = false;
            LoadBillz();
            TxtInvIDIn.Text = MC.GetNewID("TblWared", "InvIDIn");
        }
        catch (SqlException ex)
        {
            //tr.Rollback();
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
    protected void BtnGetID_Click(object sender, EventArgs e)
    {
        TxtInvIDIn.Text = MC.GetNewID("TblWared", "InvIDIn");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        TheSessions.UserID = "1";
        if (TheSessions.UserID == null)
        {
            Response.Redirect("~/Login.aspx");
            return;
        }
        if (!IsPostBack)
        {
            LoadMainCats();
            LoadDefaultData();
            LoadBillz();
            TxtInvIDIn.Text = MC.GetNewID("TblWared", "InvIDIn");
        }
    }
    protected void CheckBoxTrhel_CheckedChanged(object sender, EventArgs e)
    {
        //RadDatePickerdateTrhel.Enabled = CheckBoxTrhel.Enabled;
        if (CheckBoxTrhel.Checked)
            TarhelCommand();
    }
    protected void BtnNewBill_Click(object sender, EventArgs e)
    {
        // enable editing mode that may desabled by tarhel check
        CheckBoxTrhel.Enabled = true;
        BtnUpdateBill.Enabled = true;
        BtnAddItem.Enabled = true;
        GridViewMaterial.Enabled = true;
        // enable the add mode
        PnlBillGeneral.Visible = true;
        PnlBillDetials.Visible = false;
        BtnUpdateBill.Visible = false;
        BtnUpdateBillCancel.Visible = false;
        BtnAddBill.Visible = true;
        DDLType.SelectedValue = null;
        BtnGetID_Click(BtnGetID, new EventArgs());
        RadDatePickerDateIn.SelectedDate = null;
        CheckBoxTrhel.Checked = false;
        RadDatePickerdateTrhel.SelectedDate = null;
        TxtInvIDInSupplier.Text = string.Empty;
        TxtTalabiaNo.Text = string.Empty;
        LblState.Visible = false;
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
        cmd.CommandText = string.Format(@"INSERT INTO TblWared (InvIDIn, DateIn, SupplierId, Trhel, dateTrhel, InvIDInSupplier, TalabiaNo, TimeIn, UserIn, WaredTypeId) VALUES 
        ({0}, {1}, {2}, '{3}', {4}, {5}, {6}, GetDate(), {7}, {8})",
        TxtInvIDIn.Text.Trim(), DateIn, SupplierId, CheckBoxTrhel.Checked.ToString(), dateTrhel, InvIDInSupplier, TalabiaNo, TheSessions.UserID, WaredTypeId);
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
            PnlBillDetials.Visible = true;
            TxtUnitPriceIn.Focus();
            BtnUpdateBill.Visible = true;
            BtnUpdateBillCancel.Visible = true;
            BtnAddBill.Visible = false;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true; ;
        }
        con.Close();
    }
    protected void RadComboBoxBillz_SelectedIndexChanged(object o, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        LblState.Visible = false;
        if (RadComboBoxBillz.SelectedIndex > 0)
        {
            DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];
            DataRow R = BillzTbl.Rows[RadComboBoxBillz.SelectedIndex];
            TxtInvIDIn.Text = R["InvIDIn"].ToString();
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
            TxtUnitPriceIn.Text = string.Empty;
            TxtInQty.Text = string.Empty;
            if (R["WaredTypeId"].ToString() == string.Empty)
                DDLType.SelectedValue = null;
            else
                DDLType.SelectedValue = R["WaredTypeId"].ToString();        
            LoadBillDetials();
            PnlBillGeneral.Visible = true;
            PnlBillDetials.Visible = true;
            TxtUnitPriceIn.Focus();
            BtnUpdateBill.Visible = true;
            BtnUpdateBillCancel.Visible = true;
            BtnAddBill.Visible = false;
            if (CheckBoxTrhel.Checked)
            {
                CheckBoxTrhel.Enabled = false;
                BtnUpdateBill.Enabled = false;
                BtnAddItem.Enabled = false;
                GridViewMaterial.Enabled = false;
            }
            else
            {
                CheckBoxTrhel.Enabled = true;
                BtnUpdateBill.Enabled = true;
                BtnAddItem.Enabled = true;
                GridViewMaterial.Enabled = true;
            }
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
            PnlBillDetials.Visible = false;
            BtnUpdateBill.Visible = false;
            BtnUpdateBillCancel.Visible = false;
            BtnAddBill.Visible = true;
        }

    }
    protected void BtnAddItem_Click(object sender, ImageClickEventArgs e)
    {
        if (TxtUnitPriceIn.Text.Trim().Length == 0 || TxtInQty.Text.Trim().Length == 0 || LblItemName.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك ادخل سعر الوحدة و الكمية و صنف";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (RadTreeViewCat.SelectedNode.Category == "0")
        {
            LblState.Text = "من فضلك ادخل سعر الوحدة و الكمية و صنف";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        if (!MC.IsInteger(TxtInQty.Text.Trim()) || !MC.IsDecimal(TxtUnitPriceIn.Text.Trim()))
        {
            LblState.Text = "من فضلك ادخل سعر الوحدة و الكمية صحيح";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            return;
        }
        string StoreId = "NULL";
        if (RadComboBoxStoreId.SelectedIndex != -1)
            StoreId = RadComboBoxStoreId.SelectedValue;

        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        cmd.CommandText = string.Format(@"INSERT INTO TblWareddetails (InvIDIn, MaterialId, UnitPriceIn, InQty, StoreId, UserIn, TimeIn)
                            VALUES ({0}, {1}, {2}, {3}, {4}, {5}, GETDATE())", RadComboBoxBillz.SelectedValue, RadTreeViewCat.SelectedNode.Value, TxtUnitPriceIn.Text.Trim(), TxtInQty.Text.Trim(), StoreId, TheSessions.UserID);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
            LblState.Visible = true;
            LoadBillDetials();
            TxtUnitPriceIn.Focus();
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            LblState.Visible = true; ;
        }
        con.Close();
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
            TxtUnitPriceIn.Focus();
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
            PnlBillDetials.Visible = false;
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
        if (TxtItemCatID.Text.Trim().Length > 0)
        {
            DataTable dt = MC.LoadDataTable("Select MaterialId, Material From TblMaterialDetiels Where CategoryId = " + TxtItemCatID.Text.Trim(), "");
            if (dt.Rows.Count > 0)
            {
                LblItemName.Text = dt.Rows[0]["Material"].ToString();
                HiddenFieldMaterialId.Value = dt.Rows[0]["MaterialId"].ToString();
                RadTreeViewCat.FindNodeByValue(dt.Rows[0]["MaterialId"].ToString()).Selected = true;
                return;
            }
        }
        if (RadTreeViewCat.SelectedNodes.Count == 0)
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            LblItemName.Text = string.Empty;
            HiddenFieldMaterialId.Value = string.Empty;
            return;
        }
        if (RadTreeViewCat.SelectedNode.Category == "0")
        {
            LblState.Text = "من فضلك اختار صنف";
            LblState.ForeColor = Color.Red;
            LblState.Visible = true;
            LblItemName.Text = string.Empty;
            HiddenFieldMaterialId.Value = string.Empty;
            return;
        }
        LblItemName.Text = RadTreeViewCat.SelectedNode.Text;
        HiddenFieldMaterialId.Value = RadTreeViewCat.SelectedNode.Value;
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        LblState.Visible = false;
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?openparent=B&openchild=5");
    }
    #endregion
    
}