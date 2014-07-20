using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class EditorCommercialCustomers : UserControl
{
    #region -   Functions   -
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
        LatestTreeIDTbl.Dispose();
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
    private string TreeID()
    {
        string ParentTreeID = MC.LoadDataTable("Select AccountTreeId From TblAccounts Where AccountId = " + MC.GetOptionValue(MC.AppOptions.CommercialCustomer), "").Rows[0][0].ToString();
        return GetNewTreeId(MC.GetOptionValue(MC.AppOptions.CommercialCustomer), ParentTreeID);
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
        if (Request.QueryString["action"] != null)// action come out when use request this page from discard page
        {
            BtnBackToDiscard.Visible = true;
        }
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
        SqlDataSourceCdGov.ConnectionString = MC.ConnectionStr();
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
    protected void RadGridEditor_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
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
    protected void RadGridEditor_ItemInserted(object source, Telerik.Web.UI.GridInsertedEventArgs e)
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
            SqlConnection con = MC.EStoreConnection;
            SqlCommand cmd = new SqlCommand("", con);
            string AccountId = ViewState["AccountId"].ToString();
            try
            {
                con.Open();
                cmd.CommandText = string.Format(@"INSERT INTO TblAccounts (AccountId, AccountName, BasicAccountId, AccountTreeId, UserIn, TimeIn)
                VALUES ({0}, N'{1}', {2}, N'{3}', {4}, GETDATE())", AccountId, ViewState["Customer"], MC.GetOptionValue(MC.AppOptions.CommercialCustomer), TreeID(), TheSessions.UserID);
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                DisplayMessage("لم نتمكن من اضافة الصف التابع وذلك بسبب:  " + Environment.NewLine + MC.CheckExp(ex));
            }
            con.Close();
        }
    }
    protected void RadGridEditor_ItemDeleted(object source, Telerik.Web.UI.GridDeletedEventArgs e)
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
            DisplayMessage("تم الحذف");
            SqlConnection con = MC.EStoreConnection;
            SqlCommand cmd = new SqlCommand("", con);
            try
            {
                con.Open();
                cmd.CommandText = "Delete From TblAccounts Where AccountId = " + e.Item["AccountId"].Text;
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                DisplayMessage("لم نتمكن من حذف الصف التابع وذلك بسبب:  " + Environment.NewLine + MC.CheckExp(ex));
            }
            con.Close();
        }
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }
    protected void SqlDataSourceCodez_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@AccountId"].Value = MC.GetNewID("TblAccounts", "AccountId");
        ViewState["AccountId"] = e.Command.Parameters["@AccountId"].Value;
        ViewState["Customer"] = e.Command.Parameters["@Customer"].Value;
    }
    protected void BtnBackToDiscard_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Input/EditorDiscard.aspx");
    }
    #endregion
}