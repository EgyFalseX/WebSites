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

public partial class UC_EditorDailyConstraints : UserControl
{
    #region -   Functions -

    private void LoadBillz()
    {
        DataTable BillzTbl = new DataTable("FX2010-12");

        BillzTbl = MC.LoadDataTable(@"SELECT TRANSID, convert(nvarchar, KIEDDATE, 103) AS KIEDDATE, CAST(TRANSID AS nvarchar)
                                     + '  /  ' + convert(nvarchar, KIEDDATE, 103)
                                     + '  /  ' + (Select YearName From CdYear Where YearID= TBLTRANSACTION.YearID)
                                     AS Info FROM TBLTRANSACTION");
        RCBBillz.DataSource = BillzTbl;
        RCBBillz.DataTextField = "Info";
        RCBBillz.DataValueField = "TRANSID";
        RCBBillz.DataBind();
        ViewState["BillzTbl"] = BillzTbl;
    }
    private void LoadMainCats(RadPanelBar TV)
    {
        DataTable GeneralItems = new DataTable("FX2010-11");
        GeneralItems = MC.LoadDataTable("Select AccountId, AccountName, AccountTreeId From TblAccounts Where BasicAccountId = 0", "");
        foreach (DataRow R in GeneralItems.Rows)
        {
            RadPanelItem Itm = new RadPanelItem() { Text = R["AccountName"].ToString(), Value = R["AccountId"].ToString(), ToolTip = R["AccountTreeId"].ToString() };
            Itm.ImageUrl = "~/Images/Folders.png";
            TV.Items.Add(Itm);
            LoadChildCats(Itm);
        }
    }
    private void LoadChildCats(RadPanelItem Node)
    {
        DataTable ItemChilds = new DataTable("FX2010-11");
        ItemChilds = MC.LoadDataTable("Select AccountId, AccountName, AccountTreeId, BasicAccountId From TblAccounts Where BasicAccountId = " + Node.Value, "");
        foreach (DataRow R in ItemChilds.Rows)
        {
            RadPanelItem Itm = new RadPanelItem() { Text = R["AccountName"].ToString(), Value = R["AccountId"].ToString(), ToolTip = R["AccountTreeId"].ToString() };
            Itm.ImageUrl = "~/Images/Folders.png";
            Node.Items.Add(Itm);
            LoadChildCats(Itm);
        }
    }
    private void LoadDefaultData()
    {
        DataTable YearTbl = new DataTable("FX2010-12");
        YearTbl = MC.LoadDataTable(@"Select YearID, YearName From CdYear", "");
        RCBYearID.DataSource = YearTbl;
        RCBYearID.DataTextField = "YearName";
        RCBYearID.DataValueField = "YearID";
        RCBYearID.DataBind();
    }
    private void PalaceState()
    {
        //DataTable dt = MC.LoadDataTable(@"SELECT SUM(Madeen) AS Madeen, SUM(Daien) AS Daien FROM TBLTRAANSDETAILS", "");
        //if (dt.Rows.Count == 0)
        //{
        //    LblMadeen.Text = "0";
        //    LblDain.Text = "0";
        //    LblConState.Text = "القيد متوازن";
        //    LblConState.ForeColor = Color.Green;
        //    return;
        //}

        //if (dt.Rows[0]["Madeen"].ToString() == string.Empty)
        //    LblMadeen.Text = "0";
        //else
        //    LblMadeen.Text = dt.Rows[0]["Madeen"].ToString();
        //if (dt.Rows[0]["Daien"].ToString() == string.Empty)
        //    LblDain.Text = "0";
        //else
        //    LblDain.Text = dt.Rows[0]["Daien"].ToString();

        //if (Convert.ToDouble(LblDain.Text) == Convert.ToDouble(LblMadeen.Text))
        //{
        //    LblConState.Text = "القيد متوازن";
        //    LblConState.ForeColor = Color.Green;
        //}
        //else
        //{
        //    LblConState.Text = "القيد غير متوازن";
        //    LblConState.ForeColor = Color.Red;
        //}

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
            TxtKIEDNO.Text = MC.GetNewID("TBLTRANSACTION", "KIEDNO");
        }
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
    }
    protected void RCBBillz_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        LblState.Text = string.Empty;

        if (RCBBillz.SelectedIndex <= 0)
        {
            RCBYearID.SelectedValue = null;
            TxtKIEDNO.Text = MC.GetNewID("TBLTRANSACTION", "KIEDNO");
            RDPKIEDDATE.SelectedDate = null;
            CBtrhel.Checked = false;
            RDPTrhelDate.SelectedDate = null;
            PnlGeneral.Visible = false;
            PnlDetials.Visible = false;
            return;
        }
        DataRow row = MC.LoadDataTable(@"SELECT TRANSID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate FROM TBLTRANSACTION", "").Rows[RCBBillz.SelectedIndex - 1];
        RCBYearID.SelectedValue = row["YearID"].ToString();
        TxtKIEDNO.Text = row["KIEDNO"].ToString();
        if (row["KIEDDATE"].ToString() == string.Empty)
            RDPKIEDDATE.SelectedDate = null;
        else
            RDPKIEDDATE.SelectedDate = Convert.ToDateTime(MC.ConvertToDateDMY(row["KIEDDATE"].ToString()));
        CBtrhel.Checked = (bool)row["trhel"];
        if (row["TrhelDate"].ToString() == string.Empty)
            RDPTrhelDate.SelectedDate = null;
        else
            RDPTrhelDate.SelectedDate = Convert.ToDateTime(MC.ConvertToDateDMY(row["TrhelDate"].ToString()));
        PalaceState();
        TxtID.Text = row["TRANSID"].ToString();
        BtnUpdateBill.Visible = true;
        BtnUpdateBillCancel.Visible = true;
        BtnAddBill.Visible = false;
        PnlGeneral.Visible = true;
        PnlDetials.Visible = true;
        //RadGridEditor.Enabled = !CBtrhel.Checked;

        if (CBtrhel.Checked)//Check if Tarhel is True then this Constaint can't edit anymore
        {
            CBtrhel.Enabled = false;
            BtnUpdateBill.Enabled = false;
            BtnDelBill.Enabled = false;
            RadGridEditor.Enabled = false;
        }
        else
        {
            CBtrhel.Enabled = true;
            BtnUpdateBill.Enabled = true;
            BtnDelBill.Enabled = true;
            RadGridEditor.Enabled = true;
        }
    }
    protected void BtnNewBill_Click(object sender, EventArgs e)
    {
        TxtID.Text = MC.GetNewID("TBLTRANSACTION", "TRANSID");
        LblState.Text = string.Empty;
        RCBYearID.SelectedValue = null;
        TxtKIEDNO.Text = string.Empty;
        RDPKIEDDATE.SelectedDate = DateTime.Today;
        CBtrhel.Checked = false;
        RDPTrhelDate.SelectedDate = null;
        PnlGeneral.Visible = true;
        PnlDetials.Visible = false;
        BtnUpdateBill.Visible = false;
        BtnUpdateBillCancel.Visible = false;
        BtnAddBill.Visible = true;
        RadGridEditor.Enabled = true;
        LblState.Focus();
    }
    protected void BtnDelBill_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (RCBBillz.SelectedIndex <= 0)
            return;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"DELETE FROM TBLTRANSACTION WHERE TRANSID = {0}", RCBBillz.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            PnlDetials.Visible = false;
            PnlGeneral.Visible = false;
            LoadBillz();
            RCBBillz.Focus();
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
        if (RCBBillz.SelectedIndex <= 0)
        {
            LblState.Text = "من فضلك اختار قيد من قائمة القيود";
            LblState.ForeColor = Color.Red;
            return;
        }
        if (RCBYearID.SelectedIndex == -1)
        {
            LblState.Text = "من فضلك اختار السنه الماليه";
            LblState.ForeColor = Color.Red;
            return;
        }
        string KIEDNO = "NULL", KIEDDATE = "NULL";
        if (TxtKIEDNO.Text.Trim().Length != 0)
            KIEDNO = TxtKIEDNO.Text.Trim();
        if (RDPKIEDDATE.SelectedDate != null)
            KIEDDATE = "CONVERT(DATETIME, '" + MC.ConvertToDateDMY(RDPKIEDDATE.SelectedDate.Value.ToString()) + "', 20)";
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Update TBLTRANSACTION Set YearID = {0}, KIEDNO = '{1}', KIEDDATE = {2},  
            UserIn = {3}, TimeIn = GETDATE() Where TRANSID = {4}", RCBYearID.SelectedValue, KIEDNO, KIEDDATE, TheSessions.UserID, RCBBillz.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadBillz();
            LblState.Text = "تم التعـــديل";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void BtnUpdateBillCancel_Click(object sender, EventArgs e)
    {
        BtnNewBill_Click(BtnNewBill, new EventArgs());
    }
    protected void BtnAddBill_Click(object sender, EventArgs e)
    {
        if (RCBYearID.SelectedIndex == -1)
        {
            LblState.Text = "من فضلك اختار السنه الماليه";
            LblState.ForeColor = Color.Red;
            return;
        }
        string KIEDNO = "NULL", KIEDDATE = "NULL";
        if (TxtKIEDNO.Text.Trim().Length != 0)
            KIEDNO = TxtKIEDNO.Text.Trim();
        if (RDPKIEDDATE.SelectedDate != null)
            KIEDDATE = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(RDPKIEDDATE.SelectedDate.Value.ToString()));
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Insert Into TBLTRANSACTION (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
            VALUES ({0}, 19, {1}, {2}, {3}, 'False', NULL, {4}, GETDATE())", MC.GetNewID("TBLTRANSACTION", "TRANSID"), RCBYearID.SelectedValue,
            KIEDNO, KIEDDATE, TheSessions.UserID);
            con.Open();
            cmd.ExecuteNonQuery();
            LoadBillz();
            if (RCBBillz.Items.Count != 0)
            {
                RCBBillz.SelectedIndex = RCBBillz.Items.Count - 1;
                RCBBillz_SelectedIndexChanged(RCBBillz, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
            }
            LblState.Text = "تم الاضافــــه";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
        }
        con.Close();
    }
    protected void BtnShowHide_Click(object sender, ImageClickEventArgs e)
    {
        PnlGeneral.Visible = !PnlGeneral.Visible;
    }
    protected void CBtrhel_CheckedChanged(object sender, EventArgs e)
    {
        LblState.Visible = false;
        PnlTarhel.Visible = CBtrhel.Checked;
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
            DisplayMessage("تم الاضافه");
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
            DisplayMessage("تم الحذف");
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
    protected void RadPanelBarM_Load(object sender, EventArgs e)
    {
        RadPanelBar TV = (RadPanelBar)sender;
        if (((RadPanelBar)sender).Items.Count == 0)
            LoadMainCats((RadPanelBar)sender);
    }
    protected void BtnD_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        Button btn = (Button)sender;
        HiddenField HiddenFieldAccountIdD = (HiddenField)btn.Parent.Parent.FindControl("HiddenFieldAccountIdD");
        Label LblItemD = (Label)btn.Parent.Parent.FindControl("LblItemD");
        RadPanelBar rtv = (RadPanelBar)btn.Parent.Parent.FindControl("RadPanelBarD");
        if (rtv.SelectedItem == null)
        {
            HiddenFieldAccountIdD.Value = "NULL";
            LblItemD.Text = "NULL";
            return;
        }
        HiddenFieldAccountIdD.Value = rtv.SelectedItem.Value;
        LblItemD.Text = rtv.SelectedItem.Text;
    }
    protected void BtnM_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        Button btn = (Button)sender;
        HiddenField HiddenFieldAccountIdM = (HiddenField)btn.Parent.Parent.FindControl("HiddenFieldAccountIdM");
        Label LblItemM = (Label)btn.Parent.Parent.FindControl("LblItemM");
        RadPanelBar rtv = (RadPanelBar)btn.Parent.Parent.FindControl("RadPanelBarM");
        if (rtv.SelectedItem == null)
        {
            HiddenFieldAccountIdM.Value = "NULL";
            LblItemM.Text = "NULL";
            return;
        }
        HiddenFieldAccountIdM.Value = rtv.SelectedItem.Value;
        LblItemM.Text = rtv.SelectedItem.Text;
    }
    protected void SqlDataSourceCodez_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        LblDayen.Text = string.Empty;
        LblMadeen.Text = string.Empty;
        if (RCBBillz.SelectedIndex > 0)
        {
            DataRow dt = MC.LoadDataTable(string.Format(@"SELECT ISNULL(SUM(Daien), 0) AS Daien, ISNULL(SUM(Madeen), 0) AS Madeen, ISNULL(SUM(Daien), 0) - ISNULL(SUM(Madeen), 0) AS Deff
            FROM TBLTRAANSDETAILS
            WHERE TRANSID = {0}", RCBBillz.SelectedValue), "").Rows[0];
            LblDayen.Text = "قيمة الدائن  " + dt["Daien"].ToString();
            LblMadeen.Text = "قيمة المدين  " + dt["Madeen"].ToString();
        }
    }
    protected void BtnTarhelOK_Click(object sender, EventArgs e)
    {
        /* 1- check for:
         *      a- have detail.
         *      b- constraint equal.
         *      c- Tarhel date selected.
         * 2- save Trahel = True and Update Tarhel date with selected date.
         * 3- This Constraint isn't editable anymore.
         */
        if (CBtrhel.Checked == false)
            return;
        CBtrhel.Checked = false;
        DataRow dt = MC.LoadDataTable(string.Format(@"SELECT ISNULL(SUM(Daien), 0) AS Daien, ISNULL(SUM(Madeen), 0) AS Madeen, ISNULL(SUM(Daien), 0) - ISNULL(SUM(Madeen), 0) AS Deff
            FROM TBLTRAANSDETAILS
            WHERE TRANSID = {0}", RCBBillz.SelectedValue), "").Rows[0];
        if (Convert.ToDouble(dt["Madeen"]) == 0 && Convert.ToDouble(dt["Daien"]) == 0)
        {
            LblState.Text = "يجب ادخال تفاصيل فبل الترحيل";
            LblState.ForeColor = Color.Red;
            return;
        }
        if (Convert.ToDouble(dt["Madeen"]) != Convert.ToDouble(dt["Daien"]))
        {
            LblState.Text = "القيد غير متوازن";
            LblState.ForeColor = Color.Red;
            return;
        }
        if (RDPTrhelDate.SelectedDate == null)
        {
            LblState.Text = "ادخل تاريخ الترحيل اولا";
            LblState.ForeColor = Color.Red;
            return;
        }
        else if (RDPTrhelDate.SelectedDate.Value < RDPKIEDDATE.SelectedDate.Value)
        {
            LblState.Text = "لا يمكن لتاريخ الترجيل ان يكون قبل تاريخ الادخال";
            LblState.ForeColor = Color.Red;
            RDPTrhelDate.SelectedDate = RDPKIEDDATE.SelectedDate;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            string TrhelDate = String.Format("CONVERT(DATETIME, '{0}', 20)", MC.ConvertToDateDMY(RDPTrhelDate.SelectedDate.Value.ToString()));
            cmd.CommandText = string.Format("Update TBLTRANSACTION Set trhel = 'True', TrhelDate = {0} Where TRANSID = {1}", TrhelDate, RCBBillz.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            CBtrhel.Checked = true;
            RCBBillz_SelectedIndexChanged(RCBBillz, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
            LblState.Text = "تم الترحيل";
            LblState.ForeColor = Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;

        }
        con.Close();
    }
    protected void BtnTarhelCancel_Click(object sender, EventArgs e)
    {
        CBtrhel.Checked = false;
        PnlTarhel.Visible = false;
    }
    protected void RDPSearch_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
    {
        if (RDPSearch.SelectedDate == null)
            return;
        DataTable BillzTbl = (DataTable)ViewState["BillzTbl"];
        for (int i = 0; i < BillzTbl.Rows.Count; i++)
        {
            if (BillzTbl.Rows[i]["KIEDDATE"] == DBNull.Value)
                continue;
            try
            {
                if (Convert.ToDateTime(BillzTbl.Rows[i]["KIEDDATE"]).ToShortDateString() == RDPSearch.SelectedDate.Value.ToShortDateString())
                {
                    RCBBillz.SelectedIndex = i;
                    RCBBillz_SelectedIndexChanged(RCBBillz, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
                    return;
                }
            }
            catch { continue; }
        }
        RCBBillz.Text = string.Empty;
        RCBBillz.SelectedIndex = 0;
        RCBBillz_SelectedIndexChanged(RCBBillz, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
    }
#endregion
}