using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class ContactUs : System.Web.UI.UserControl
{
    private string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/ABOUT.mdb");
    #region - Functions - 
    private DataTable LoadTable(string commandstring)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandstring, constr);
        try
        { da.Fill(dt); }
        catch (OleDbException ex)
        {
            throw ex;
        }
        return dt;
    }
    private string Insertcontact(string coname, string sefaid, string contypeid, string tel, string mail, string massage, bool agreeshow)
    {
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        if (sefaid == string.Empty)
            sefaid = "NULL";
        if (contypeid == string.Empty)
            contypeid = "NULL";
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO contact (coname, sefaid, contypeid, tel, mail, massage, condate, agreeshow)
            VALUES ('{0}', {1}, {2}, '{3}', '{4}', '{5}', NOW(), {6})", coname, sefaid, contypeid, tel, mail, massage, agreeshow);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (OleDbException ex)
        {
            return ex.Message;
        }
        con.Close();
        return string.Empty;
    }
    private void LoadDefaultData()
    {
        DDLsefaid.DataSource = LoadTable(@"Select sefaid, sefa From sefa");
        DDLsefaid.DataValueField = "sefaid";
        DDLsefaid.DataTextField = "sefa";
        DDLsefaid.DataBind();

        DDLcontypeid.DataSource = LoadTable(@"Select contypeid, contype From contype");
        DDLcontypeid.DataValueField = "contypeid";
        DDLcontypeid.DataTextField = "contype";
        DDLcontypeid.DataBind();
    }
    private void ClearForm()
    {
        Txtconame.Text = string.Empty;
        DDLsefaid.ClearSelection();
        DDLcontypeid.ClearSelection();
        Txttel.Text = string.Empty;
        Txtmail.Text = string.Empty;
        Txtmassage.Text = string.Empty;
        CBShowOnLine.Checked = false;
        Txtconame.Focus();
    }
    #endregion
    #region - Event Handler -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadDefaultData();
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
    protected void BtnSend_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (Txtconame.Text.Trim().Length == 0 || Txttel.Text.Trim().Length == 0 || Txtmassage.Text.Trim().Length == 0 || DDLsefaid.SelectedValue == string.Empty || DDLcontypeid.SelectedValue == string.Empty)
        {
            LblState.Text = "من فضلك اكمل البيانات المطلوبه";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        string Result = Insertcontact(Txtconame.Text.Trim(), DDLsefaid.SelectedValue, DDLcontypeid.SelectedValue, Txttel.Text.Trim(), Txtmail.Text.Trim(), Txtmassage.Text.Trim(), CBShowOnLine.Checked);
        if (Result == string.Empty)
        {
            if (CBShowOnLine.Checked)
                LblState.Text = "شكرا لك وسيتم عرض رسالتك بعد الرد عليها";
            else
                LblState.Text = "شكرا لك لقد تم ارسال رسالتك وسيتم الرد عليها";
            LblState.ForeColor = System.Drawing.Color.Green;
            ClearForm();
            return;
        }
        else
        {
            LblState.Text = Result;
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
    }
    #endregion
    
}