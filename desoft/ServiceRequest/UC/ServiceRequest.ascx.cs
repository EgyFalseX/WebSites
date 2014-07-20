using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class ServiceRequest : System.Web.UI.UserControl
{
    
    #region - Functions - 
    static string ConnectionStr(string DataBaseName)
    {
        return "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data\" + DataBaseName);
    }
    private void ClearForm()
    {
        DDLServices.ClearSelection();
        tbpname.Text = string.Empty;
        tbmobil.Text = string.Empty;
        tbemail.Text = string.Empty;
        tbrequest.Text = string.Empty;
        DDLServices.Focus();
    }
    #endregion
    #region - Event Handler -
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        ClearForm();
    }
    protected void BtnSend_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (DDLServices.SelectedValue == string.Empty || tbemail.Text.Trim() == string.Empty)
        {
            LblState.Text = "من فضلك اكمل البيانات المطلوبه";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        OleDbConnection con = new OleDbConnection(ConnectionStr("faservice.mdb"));
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO requestservice (servisetypeid, pname, mobil, email, requestdate, request) VALUES ({0}, '{1}', '{2}', '{3}', NOW(), '{4}')",
            DDLServices.SelectedValue, tbpname.Text.Trim(), tbmobil.Text.Trim(), tbemail.Text.Trim(), tbrequest.Text.Trim());
            con.Open();
            cmd.ExecuteNonQuery();

            LblState.Text = "شكرا لك لقد تم ارسال طلبك وسيتم الرد عليه";
            LblState.ForeColor = System.Drawing.Color.Green;
            ClearForm();
        }
        catch (OleDbException ex)
        {
            LblState.Text = ex.Message;
            LblState.ForeColor = System.Drawing.Color.Red;
        }
        con.Close();
    }
    #endregion
    
}