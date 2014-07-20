using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class SendOpinion : System.Web.UI.UserControl
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
    private string Insertcontact(string coname, string sefaid, string mail, string massage)
    {
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO contact (coname, sefaid, mail, massage, condate)
            VALUES ('{0}', '{1}', '{2}', '{3}', NOW())", coname, sefaid, mail, massage);
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
    private void ClearForm()
    {
        Txtconame.Text = string.Empty;
        Txtsefaid.Text = string.Empty;
        Txtmail.Text = string.Empty;
        Txtmassage.Text = string.Empty;
        Txtconame.Focus();
    }
    #endregion
    #region - Event Handler -
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
    protected void BtnSend_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        if (Txtconame.Text.Trim().Length == 0 || Txtsefaid.Text.Trim().Length == 0 || Txtmassage.Text.Trim().Length == 0 || Txtmail.Text.Trim().Length == 0)
        {
            LblState.Text = "من فضلك اكمل البيانات المطلوبه";
            LblState.ForeColor = System.Drawing.Color.Red;
            return;
        }
        string Result = Insertcontact(Txtconame.Text.Trim(), Txtsefaid.Text.Trim(), Txtmail.Text.Trim(), Txtmassage.Text.Trim());
        if (Result == string.Empty)
        {
            LblState.Text = "شكرا لك وسيتم عرض رسالتك بعد الرد عليها و ارسال لك بريد";
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