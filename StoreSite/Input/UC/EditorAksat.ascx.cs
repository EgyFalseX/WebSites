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

public partial class EditorAksat : System.Web.UI.UserControl
{
    private void LoadData()
    {

        DataTable Tblaksat = new DataTable("FX2011-05");
        Tblaksat = MC.LoadDataTable(@"Select KST_id, (Select OutypeName From CdOutType Where OutTypeId = Tblaksat.OutTypeId) + ' / ' + Cast(notypeout As nvarchar) AS Details, OutTypeId, notypeout, isnull(totalout, 0) AS totalout, isnull(noaksat, 0) AS noaksat, Convert(datetime, datefirest, 103) AS datefirest, datefirest AS datefirest_Normal From Tblaksat");
        RadComboBoxKST_id.DataSource = Tblaksat;
        RadComboBoxKST_id.DataTextField = "Details";
        RadComboBoxKST_id.DataValueField = "KST_id";
        RadComboBoxKST_id.DataBind();
        ViewState["Tblaksat"] = Tblaksat;
    }
    private void LoadDefaultData()
    {
        DataTable CdOutType = new DataTable("FX2011-05");
        CdOutType = MC.LoadDataTable(@"Select OutTypeId, OutypeName From CdOutType");
        RadComboBoxOutTypeId.DataSource = CdOutType;
        RadComboBoxOutTypeId.DataTextField = "OutypeName";
        RadComboBoxOutTypeId.DataValueField = "OutTypeId";
        RadComboBoxOutTypeId.DataBind();
    }
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
            LoadData();
        }
        SqlDataSourceCodez.ConnectionString = MC.ConnectionStr();
    }
    protected void RadComboBoxKST_id_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        if (RadComboBoxKST_id.SelectedIndex > 0)
        {
            DataRow Tblaksat = ((DataTable)ViewState["Tblaksat"]).Rows[RadComboBoxKST_id.SelectedIndex];
            BtnEdit.Visible = true;
            BtnCreateDetails.Visible = true;
            RadComboBoxOutTypeId.SelectedValue = Tblaksat["OutTypeId"].ToString();
            RadComboBoxOutTypeId_SelectedIndexChanged(RadComboBoxOutTypeId, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
            RadComboBoxnotypeout.SelectedValue = Tblaksat["notypeout"].ToString();
            RadComboBoxnotypeout_SelectedIndexChanged(RadComboBoxnotypeout, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
            Txttotalout.Text = Tblaksat["totalout"].ToString();
            if (Tblaksat["datefirest"] == string.Empty)
                RadDatePickerdatefirest.Clear();
            else
                RadDatePickerdatefirest.SelectedDate = (DateTime)Tblaksat["datefirest"];
            Txtnoaksat.Text = Tblaksat["noaksat"].ToString();
        }
        else
        {
            BtnEdit.Visible = false;
            BtnCreateDetails.Visible = false;
            BtnNew_Click(BtnNew, new EventArgs());
        }
        RadGridEditor.DataBind();
    }
    protected void BtnDel_Click(object sender, EventArgs e)
    {
        if (RadComboBoxKST_id.SelectedIndex <= 0)
            return;
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = "DELETE From Tblaksat Where KST_id = " + RadComboBoxKST_id.SelectedValue;
            
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الحذف";
            LblState.ForeColor = Color.Green;
            LoadData();
            RadComboBoxKST_id.SelectedIndex = 0;
            RadComboBoxKST_id_SelectedIndexChanged(RadComboBoxKST_id, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            return;
        }
        con.Close();
    }
    protected void RadComboBoxOutTypeId_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        DataTable CdOutType = new DataTable("FX2011-05");
        if (RadComboBoxOutTypeId.SelectedIndex > 0 )
        {
            CdOutType = MC.LoadDataTable(@"Select InvIDOut, notypeout, (Select ISNULL(Sum((UnitPriceOut * OutQty) - ((UnitPriceOut * OutQty * isnull(kasm, 0)) / 100)), 0) From tblOutDetails Where InvIDOut = TblOut.InvIDOut) AS BillValue From TblOut Where OutTypeId = " + RadComboBoxOutTypeId.SelectedValue);
        }
        RadComboBoxnotypeout.DataSource = CdOutType;
        RadComboBoxnotypeout.DataTextField = "notypeout";
        RadComboBoxnotypeout.DataValueField = "notypeout";
        RadComboBoxnotypeout.DataBind();
        ViewState["CdOutType"] = CdOutType;
    }
    protected void RadComboBoxnotypeout_SelectedIndexChanged(object o, RadComboBoxSelectedIndexChangedEventArgs e)
    {
        DataTable CdOutType = (DataTable)ViewState["CdOutType"];
        if (RadComboBoxnotypeout.SelectedIndex > 0)
            Txttotalout.Text = CdOutType.Rows[RadComboBoxnotypeout.SelectedIndex]["BillValue"].ToString();
        else
            Txttotalout.Text = "0";
    }
    protected void BtnNew_Click(object sender, EventArgs e)
    {
        RadComboBoxKST_id.ClearSelection();
        RadComboBoxKST_id.Text = string.Empty;
        RadComboBoxOutTypeId.ClearSelection();
        RadComboBoxOutTypeId.Text = string.Empty;
        RadComboBoxnotypeout.ClearSelection();
        RadComboBoxnotypeout.Text = string.Empty;
        Txttotalout.Text = "0";
        RadDatePickerdatefirest.SelectedDate = DateTime.Today;
        Txtnoaksat.Text = "0";
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (RadComboBoxOutTypeId.SelectedIndex <= 0 || RadComboBoxnotypeout.SelectedIndex <= 0)
        {
            LblState.Text = "من فضلك ادخل نوع الاذن و رقم الفاتوره";
            LblState.ForeColor = Color.Red;
            return;
        }
        string noaksat, datefirest;
        if (Txtnoaksat.Text.Length > 0)
            noaksat = Txtnoaksat.Text;
        else
            noaksat = "NULL";
        if (RadDatePickerdatefirest.SelectedDate != null)
            datefirest = string.Format("Convert(datetime, '{0}', 103)", RadDatePickerdatefirest.SelectedDate);
        else
            datefirest = "NULL";
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"Insert into Tblaksat (KST_id, OutTypeId, notypeout, totalout, noaksat, datefirest, UserIn, TimeIn) VALUES 
            ((Select Isnull(Max(KST_id) + 1, 1) From Tblaksat), {0}, {1}, {2}, {3}, {4}, {5}, GETDATE())", RadComboBoxOutTypeId.SelectedValue, RadComboBoxnotypeout.SelectedValue,
            Txttotalout.Text, noaksat, datefirest, TheSessions.UserID);
            cmd.ExecuteNonQuery();
            LblState.Text = "تم الاضافه";
            LblState.ForeColor = Color.Green;
            LoadData();
            RadComboBoxKST_id.SelectedIndex = RadComboBoxKST_id.Items.Count - 1;
            RadComboBoxKST_id_SelectedIndexChanged(RadComboBoxKST_id, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            return;
        }
        con.Close();
    }
    protected void BtnEdit_Click(object sender, EventArgs e)
    {
        if (RadComboBoxOutTypeId.SelectedIndex <= 0 || RadComboBoxnotypeout.SelectedIndex <= 0)
        {
            LblState.Text = "من فضلك ادخل نوع الاذن و رقم الفاتوره";
            LblState.ForeColor = Color.Red;
            return;
        }
        DataTable Tblaksat = (DataTable)ViewState["Tblaksat"];
        string noaksat, datefirest;
        if (Txtnoaksat.Text.Length > 0)
            noaksat = Txtnoaksat.Text;
        else
            noaksat = "NULL";
        if (RadDatePickerdatefirest.SelectedDate != null)
            datefirest = string.Format("Convert(datetime, '{0}', 103)", RadDatePickerdatefirest.SelectedDate);
        else
            datefirest = "NULL";
        
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = string.Format(@"Update Tblaksat Set OutTypeId = {0}, notypeout = {1}, totalout = {2}, noaksat = {3}, datefirest = {4}, UserIn = {5}, TimeIn = GETDATE() Where KST_id = {6}",
            RadComboBoxOutTypeId.SelectedValue, RadComboBoxnotypeout.SelectedValue, Txttotalout.Text, noaksat, datefirest, TheSessions.UserID, Tblaksat.Rows[RadComboBoxKST_id.SelectedIndex]["KST_id"]);
            cmd.ExecuteNonQuery();
            LblState.Text = "تم التعديل";
            LblState.ForeColor = Color.Green;
            LoadData();
            RadComboBoxKST_id_SelectedIndexChanged(RadComboBoxKST_id, new RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            return;
        }
        con.Close();
    }
    protected void BtnCreateDetails_Click(object sender, EventArgs e)
    {
        DataRow Tblaksat = ((DataTable)ViewState["Tblaksat"]).Rows[RadComboBoxKST_id.SelectedIndex];
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        SqlTransaction trn = null;
        try
        {
            con.Open();
            trn = con.BeginTransaction();
            cmd.Transaction = trn;
            DateTime kast_date = (DateTime)Tblaksat["datefirest_Normal"];
            float kast = float.Parse(Tblaksat["totalout"].ToString()) / float.Parse(Tblaksat["noaksat"].ToString());
            for (int i = 0; i < int.Parse(Tblaksat["noaksat"].ToString()); i++)
            {
                cmd.CommandText = string.Format(@"Insert into tblaksatDetails (KST_id, kast_no, kast_date, kast) VALUES ({0}, {1}, Convert(datetime, '{2}', 103), {3})", Tblaksat["KST_id"],
                i + 1, kast_date.ToShortDateString(), kast);
                kast_date = kast_date.AddMonths(i + 1);
                cmd.ExecuteNonQuery();
            }
            trn.Commit();
            RadGridEditor.DataBind();
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = Color.Red;
            return;
        }
        con.Close();
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
            DisplayMessage("تم الحذف");
        }
    }
    private void DisplayMessage(string text)
    {
        RadGridEditor.Controls.Add(new LiteralControl(text));
    }

    
}