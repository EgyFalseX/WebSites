using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Functions;

public partial class UC_EditorSerial : System.Web.UI.UserControl
{
    #region -   Functions   -
    private void LoadDefaultData()
    {
        DataTable BillsTbl = new DataTable("FX2010-12");
        BillsTbl = MC.LoadDataTable(@"Select InvIDIn From TblWared");
        RadComboBoxBillz.DataSource = BillsTbl;
        RadComboBoxBillz.DataTextField = "InvIDIn";
        RadComboBoxBillz.DataValueField = "InvIDIn";
        RadComboBoxBillz.DataBind();
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
        }
    }
    protected void RadComboBoxBillz_SelectedIndexChanged(object o, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        if (RadComboBoxBillz.SelectedIndex <= 0)
            return;
        DataTable ItemsTbl = new DataTable("FX2010-12");
        ItemsTbl = MC.LoadDataTable(@"Select InvIDIn, MaterialId, (Select Material From TblMaterialDetiels Where MaterialId = TblWareddetails.MaterialId) AS Material From TblWareddetails Where InvIDIn = " + RadComboBoxBillz.SelectedValue);
        RadComboBoxItems.DataSource = ItemsTbl;
        RadComboBoxItems.DataTextField = "Material";
        RadComboBoxItems.DataValueField = "MaterialId";
        RadComboBoxItems.DataBind();
        RadComboBoxItems.Focus();
    }
    protected void RadComboBoxItems_SelectedIndexChanged(object o, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
    {
        DataTable ItemContains = new DataTable("FX2010-12");
        if (RadComboBoxItems.SelectedIndex > 0)
        {
            ItemContains = MC.LoadDataTable(string.Format(@"Select SerId, InvIDIn, MaterialId, InnerSerial, FactorySerial From TblWaredSerial Where 
            InvIDIn = {0} AND MaterialId = {1}", RadComboBoxBillz.SelectedValue, RadComboBoxItems.SelectedValue), "");
        }
        GridViewSerial.DataSource = ItemContains;
        GridViewSerial.DataBind();
        ViewState["ItemContains"] = ItemContains;
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con = MC.EStoreConnection;
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            con.Open();
            
            foreach (GridViewRow row in GridViewSerial.Rows)
            {
                HiddenField hf = (HiddenField)row.FindControl("HiddenFieldSerId");
                TextBox tb = (TextBox)row.FindControl("TxtFactorySerial");
                string FactorySerial = "NULL";
                if (tb.Text != string.Empty)
                    FactorySerial = String.Format("N'{0}'", tb.Text);
                cmd.CommandText = string.Format(@"IF (NOT EXISTS (SELECT FactorySerial From TblWaredSerial  WHERE (FactorySerial = {0}) AND (MaterialId = {1})))
                UPDATE TblWaredSerial SET FactorySerial = {0} WHERE (SerId = {2})", FactorySerial, RadComboBoxItems.SelectedValue, hf.Value);
                cmd.ExecuteNonQuery();
            }
            RadComboBoxItems_SelectedIndexChanged(RadComboBoxItems, new Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs("", "", "", ""));
            LblState.Text = "تم الحفـــــــــظ";
            LblState.ForeColor = System.Drawing.Color.Green;
        }
        catch (SqlException ex)
        {
            LblState.Text = MC.CheckExp(ex);
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    #endregion

    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx?expendThis=" + new System.IO.FileInfo(HttpContext.Current.Request.Url.AbsolutePath).Name);
    }
}