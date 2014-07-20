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

public partial class _EditorAlkazna : UserControl
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
    /*Information
     *  name from same table
        closek = tarhel = 0
        HarakaNo = last same haraka +1
        Actionid = 1 or 2 monsaref aw wared

        3nd el tar7el    Actionid = 1
        *b4 tarhel i should check if elkazna have money or not by check the sum Amoney of actionid = (2-1 > Amoney) // [sum(Amony) where (ActionId=2)] - [sum(Amony) where (ActionId=1)]
        لا يمكن اجراء حركة الصرف حيث ان رصيد الخزينة لا يسمح


        1- transaction
        TRANSID = +1
        TRTypeID=1
        YearID=max cdyear
        KIEDNO=HarakNo
        KIEDDATE=ActionDate
        KIEDDESC=namee بأسم HarakNo منصرف خزينه رقم 
        trhel=1
        TrhelDate=now

        2-traansdetials
        TRANSID=same as above
        TNO=1
        AccountId=khazna code
        Madeen=0
        Daien=ِAmoney
        MostandNo=HarakNo
        kieddes=namee بأسم HarakNo منصرف خزينه رقم 
        3-
        TRANSID=same as above
        TNO=2
        AccountId=TblAlkazna -> AccountId
        Madeen=Amoney
        Daien=0
        MostandNo=HarakNo
        kieddes=namee بأسم HarakNo منصرف خزينه رقم 
        _______________________
        3nd el tar7el    Actionid = 2

        TRANSID = +1
        TRTypeID=2
        YearID=max cdyear
        KIEDNO=HarakNo
        KIEDDATE=ActionDate
        KIEDDESC=namee بأسم HarakNo فاتورة وارد خزينة رقم 
        trhel=1
        TrhelDate=now

        2-traansdetials
        TRANSID=same as above
        TNO=1
        AccountId=khazna code
        Madeen=Amoney
        Daien=ِ0
        MostandNo=HarakNo
        kieddes=namee بأسم HarakNo فاتورة وارد خزينة رقم
        3-
        TRANSID=same as above
        TNO=2
        AccountId=TblAlkazna -> AccountId
        Madeen=0
        Daien=Amoney
        MostandNo=HarakNo
        kieddes=namee بأسم HarakNo منصرف خزينه رقم
     */
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
        HiddenFieldHarakaNo.Value = MC.GetNewID("TblAlkazna", "HarakaNo");
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
        SqlDataSourceActionId.ConnectionString = MC.ConnectionStr();
        SqlDataSourcenamee.ConnectionString = MC.ConnectionStr();
    }
    protected void RadTreeViewCat_NodeClick(object sender, RadTreeNodeEventArgs e)
    {
        LblState.Text = string.Empty;
        if (e.Node.Value != "-1")
            HiddenFieldAccountId.Value = e.Node.Value;
        else
            HiddenFieldAccountId.Value = string.Empty;

        RadTreeView rtv = (RadTreeView)sender;
        HiddenField hf = (HiddenField)rtv.Parent.Parent.FindControl("HiddenFieldAccountIdEdit");
        Label LblAccName = (Label)rtv.Parent.Parent.FindControl("LblAccName");
        LblAccName.Text = rtv.SelectedNode.Text;
        hf.Value = e.Node.Value;
    }
    protected void DropDownListnamee_SelectedIndexChanged(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        DropDownList ddl = (DropDownList)sender;
        if (ddl.SelectedIndex != -1)
            HiddenFieldnamee.Value = ddl.SelectedValue;
        else
            HiddenFieldnamee.Value = string.Empty;
    }
    protected void RadGridEditor_ItemInserted(object source, GridInsertedEventArgs e)
    {
        LblState.Text = string.Empty;
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
            DisplayMessage("تم الحذف");
        }
    }
    protected void SqlDataSourceCodez_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        LblState.Text = string.Empty;
        if (e.Command.Parameters["@ActionId"].Value.ToString() == "1")
        {
            if (e.Command.Parameters[4].Value == null)
            {
                e.Cancel = true;
                return;
            }
            double AmonyA = (double)e.Command.Parameters["@Amony"].Value;
            float In = MC.ConvertStringToInt(MC.LoadDataTable("if((Select  Sum(Amony) From TblAlkazna Where ActionId = 2) is NULL) Select '0' else (Select  Sum(Amony) From TblAlkazna Where ActionId = 2)", "").Rows[0][0].ToString());
            float Out = MC.ConvertStringToInt(MC.LoadDataTable("if((Select  Sum(Amony) From TblAlkazna Where ActionId = 1) is NULL) Select '0' else (Select  Sum(Amony) From TblAlkazna Where ActionId = 1)", "").Rows[0][0].ToString());
            if ((In - Out) < AmonyA)// check if money in kazna > Amoney
            {
                DisplayMessage("لا يمكن اجراء حركة الصرف حيث ان رصيد الخزينة لا يسمح");
                e.Cancel = true;
                return;
            }
        }
        //
        if ((bool)e.Command.Parameters["@closek"].Value == false)
            return;
//        string ActionId = e.Command.Parameters["@ActionId"].Value.ToString();
//        string HarakNo = MC.LoadDataTable("SELECT ISNULL(MAX(HarakaNo) + 1, 1) AS NewID FROM TblAlkazna", "").Rows[0][0].ToString();
//        string ActionDate = Convert.ToString(e.Command.Parameters["@ActionDate"].Value);
//        string Amony = Convert.ToString(e.Command.Parameters["@Amony"].Value);
//        if (string.IsNullOrEmpty(Amony))
//            Amony = "0";
//        string AccountId = Convert.ToString(e.Command.Parameters["@AccountId"].Value);
//        if (string.IsNullOrEmpty(AccountId))
//            AccountId = "NULL";
//        string namee = Convert.ToString(e.Command.Parameters["@namee"].Value);
//        SqlConnection con = MC.EStoreConnection;
//        SqlCommand cmd = new SqlCommand("", con);
//        SqlTransaction tr = null;
//        string TRANSID = MC.GetNewID("TBLTRANSACTION", "TRANSID");
//        string KIEDDESC = string.Empty;

//        switch (ActionId)
//        {
//            case "1":
//                KIEDDESC = "منصرف خزينه رقم " + HarakNo + " بتاريخ " + ActionDate + " من " + MC.LoadDataTable("Select AccountName From TblAccounts Where AccountId = " + AccountId, "").Rows[0][0].ToString();
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION
//                        (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//                        VALUES ({0}, 1, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, '{2}', 'True', GETDATE(), {3}, GETDATE())",
//                TRANSID, HarakNo, ActionDate, TheSessions.UserID);
//                try
//                {
//                    con.Open();
//                    tr = con.BeginTransaction();
//                    cmd.Transaction = tr;
//                    cmd.ExecuteNonQuery();
//                    cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//                                                                                    VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')",
//                                                                                    TRANSID, AccountId, MC.GetOptionValue(MC.AppOptions.inventory), Amony, KIEDDESC);
//                    cmd.ExecuteNonQuery();
//                    tr.Commit();
//                }
//                catch (SqlException ex)
//                {
//                    tr.Rollback();
//                    e.Cancel = true;
//                    DisplayMessage(ex.Message);
//                }
//                con.Close();
//                break;
//            case "2":
//                KIEDDESC = "وارد خزينه رقم " + HarakNo + " بتاريخ " + ActionDate + " من " + MC.LoadDataTable("Select AccountName From TblAccounts Where AccountId = " + AccountId, "").Rows[0][0].ToString();
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION
//                        (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//                        VALUES ({0}, 1, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, '{2}', 'True', GETDATE(), {3}, GETDATE())",
//                TRANSID, HarakNo, ActionDate, TheSessions.UserID);
//                try
//                {
//                    con.Open();
//                    tr = con.BeginTransaction();
//                    cmd.Transaction = tr;
//                    cmd.ExecuteNonQuery();
//                    cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//                                                                                    VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')",
//                                                                                    TRANSID, MC.GetOptionValue(MC.AppOptions.inventory), AccountId, Amony, KIEDDESC);
//                    cmd.ExecuteNonQuery();
//                    tr.Commit();
//                }
//                catch (SqlException ex)
//                {
//                    tr.Rollback();
//                    e.Cancel = true;
//                    DisplayMessage(ex.Message);
//                }
//                con.Close();
//                break;
//            default:
//                break;
//        }
    }
    protected void SqlDataSourceCodez_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        if ((bool)e.Command.Parameters["@closek"].Value == false)
            return;
//        string ActionId = e.Command.Parameters["@ActionId"].Value.ToString();
//        string HarakNo = e.Command.Parameters["@original_HarakaNo"].Value.ToString();
//        string ActionDate = Convert.ToString(e.Command.Parameters["@ActionDate"].Value);
//        string Amony = Convert.ToString(e.Command.Parameters["@Amony"].Value);
//        if (string.IsNullOrEmpty(Amony))
//            Amony = "0";
//        string AccountId = Convert.ToString(e.Command.Parameters["@AccountId"].Value);
//        if (string.IsNullOrEmpty(AccountId))
//            AccountId = "NULL";
//        string namee = Convert.ToString(e.Command.Parameters["@namee"].Value);
//        SqlConnection con = MC.EStoreConnection;
//        SqlCommand cmd = new SqlCommand("", con);
//        SqlTransaction tr = null;
//        string TRANSID = MC.GetNewID("TBLTRANSACTION", "TRANSID");
//        string KIEDDESC = string.Empty;

//        switch (ActionId)
//        {
//            case "1":
//                KIEDDESC = "منصرف خزينه رقم " + HarakNo + " بتاريخ " + ActionDate + " من " + MC.LoadDataTable("Select AccountName From TblAccounts Where AccountId = " + AccountId, "").Rows[0][0].ToString();
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION
//                        (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//                        VALUES ({0}, 1, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, '{2}', 'True', GETDATE(), {3}, GETDATE())",
//                TRANSID, HarakNo, ActionDate, TheSessions.UserID);
//                try
//                {
//                    con.Open();
//                    tr = con.BeginTransaction();
//                    cmd.Transaction = tr;
//                    cmd.ExecuteNonQuery();
//                    cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//                                                                                    VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')",
//                                                                                    TRANSID, AccountId, MC.GetOptionValue(MC.AppOptions.inventory), Amony, KIEDDESC);
//                    cmd.ExecuteNonQuery();
//                    tr.Commit();
//                }
//                catch (SqlException ex)
//                {
//                    tr.Rollback();
//                    e.Cancel = true;
//                    DisplayMessage(ex.Message);
//                }
//                con.Close();
//                break;
//            case "2":
//                KIEDDESC = "وارد خزينه رقم " + HarakNo + " بتاريخ " + ActionDate + " من " + MC.LoadDataTable("Select AccountName From TblAccounts Where AccountId = " + AccountId, "").Rows[0][0].ToString();
//                cmd.CommandText = string.Format(@"INSERT INTO TBLTRANSACTION
//                        (TRANSID, TRTypeID, YearID, KIEDNO, KIEDDATE, trhel, TrhelDate, UserIn, TimeIn)
//                        VALUES ({0}, 1, (Select Top 1 YearID From CdYear Order by YEndDate DESC), {1}, '{2}', 'True', GETDATE(), {3}, GETDATE())",
//                TRANSID, HarakNo, ActionDate, TheSessions.UserID);
//                try
//                {
//                    con.Open();
//                    tr = con.BeginTransaction();
//                    cmd.Transaction = tr;
//                    cmd.ExecuteNonQuery();
//                    cmd.CommandText = string.Format(@"INSERT INTO TBLTRAANSDETAILS (TRANSID, TNO, AccountIdM, AccountIdD, Madeen, Daien, kieddes)
//                                                                                    VALUES ({0}, 1, {1}, {2}, {3}, {3}, N'{4}')",
//                                                                                    TRANSID, MC.GetOptionValue(MC.AppOptions.inventory), AccountId, Amony, KIEDDESC);
//                    cmd.ExecuteNonQuery();
//                    tr.Commit();
//                }
//                catch (SqlException ex)
//                {
//                    tr.Rollback();
//                    e.Cancel = true;
//                    DisplayMessage(ex.Message);
//                }
//                con.Close();
//                break;
//            default:
//                break;
//        }
    }
    protected void RadGridEditor_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridEditFormItem && e.Item.IsInEditMode)
        {
            try
            {
                HiddenField hfAccountId = (HiddenField)e.Item.FindControl("HiddenFieldAccountIdEdit");
                HiddenFieldAccountId.Value = hfAccountId.Value;
                RadTreeView RadTreeViewCat = (RadTreeView)e.Item.FindControl("RadTreeViewCat");
                RadTreeViewCat.FindNodeByValue(hfAccountId.Value).Selected = true;
            }
            catch (Exception)
            {
            }
        }
        if (e.Item is GridDataItem)   //Condition to disable tarhel row
        {
            if (((e.Item as GridDataItem)["closek"].Controls[0] as CheckBox).Checked == true)
                e.Item.Enabled = false;
            else
                e.Item.Enabled = true;
        }   
    }
    protected void RadTreeViewCat_Load(object sender, EventArgs e)
    {
        RadTreeView TV = (RadTreeView)sender;
        if (((RadTreeView)sender).Nodes.Count == 0)
            LoadMainCats((RadTreeView)sender);
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
#endregion
}