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

public partial class EditorCheck : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadDefaultData()
    {
        DataTable dt = MC.LoadDataTable(@"Select bankacountcode, bankacountname From CDbank", "");
        DDLAccount.DataSource = dt;
        DDLAccount.DataTextField = "bankacountname";
        DDLAccount.DataValueField = "bankacountcode";
        DDLAccount.DataBind();
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
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
        SqlDataSourceCodez.ConnectionString = Functions.MC.ConnectionStr();
        if (!IsPostBack)
        {
            LoadDefaultData();
        }
    }
    protected void BtnCreateCheck_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (TxtCount.Text.Trim().Length == 0 || TxtStart.Text.Trim().Length == 0 || DDLAccount.SelectedIndex == -1)// if text empty
        {
            LblState.Text = "من فضلك ادخل عدد و رقم البدايه و الحساب";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        int Count = Convert.ToInt16(MC.ConvertStringToInt(TxtCount.Text.Trim()));
        int Start = Convert.ToInt16(MC.ConvertStringToInt(TxtStart.Text.Trim()));
        if (Count == 0 || Start == 0)// if number = 0
        {
            LblState.Text = "من فضلك ادخل عدد و رقم البدايه و الحساب";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        SqlTransaction tr = null;
        try
        {
            con.Open();
            tr = con.BeginTransaction();
            cmd.Transaction = tr;
            for (int i = Start; i < (Start + Count); i++)
            {
                cmd.CommandText = string.Format(@"INSERT INTO TBLsheekno (sheek_no, bankacountcode, del, used, mortd, soref, UserIn, TimeIn)
                VALUES ({0}, {1}, 0, 0, 0, 0, {2}, GETDATE())", i, DDLAccount.SelectedValue, TheSessions.UserID);
                cmd.ExecuteNonQuery();
                
            }
            tr.Commit();
            TxtCount.Text = "0";
            TxtStart.Text = "0";
            RadGridEditor.DataBind();
            LblState.Text = "تم الترقيم";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
            tr.Rollback();
        }
        con.Close();
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
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
#endregion
    
}