using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class Apply : System.Web.UI.Page
{
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath("data/FlexibleData.mdb");
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    private void ClearFrom()
    {
        txtregestername.Value = string.Empty;
        deregesterbdate.Value = string.Empty;
        txtregestermobile.Value = string.Empty;
        txtregestermobile.Value = string.Empty;
        cbregestergov.Value = string.Empty;
        txtregesteraddress.Value = string.Empty;
        cbcourseid.Value = string.Empty;
        txtregestermsg.Value = string.Empty;
    }
    protected void btnApply_Click(object sender, EventArgs e)
    {
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("INSERT INTO tblregester(regestername, regesterbdate, regestermobile, regestermail, regestergov, regesteraddress, courseid, regestermsg, datein) VALUES (?,?,?,?,?,?,?,?,Date())", con);
        OleDbParameter pramregestername = new OleDbParameter("regestername", OleDbType.VarWChar);
        OleDbParameter pramregesterbdate = new OleDbParameter("regesterbdate", OleDbType.Date);
        OleDbParameter pramregestermobile = new OleDbParameter("regestermobile", OleDbType.VarWChar);
        OleDbParameter pramregestermail = new OleDbParameter("regestermail", OleDbType.VarWChar);
        OleDbParameter pramregestergov = new OleDbParameter("regestergov", OleDbType.Integer);
        OleDbParameter pramregesteraddress = new OleDbParameter("regesteraddress", OleDbType.VarWChar);
        OleDbParameter pramrcourseid = new OleDbParameter("courseid", OleDbType.Integer);
        OleDbParameter pramregestermsg = new OleDbParameter("regestermsg", OleDbType.VarWChar);
        cmd.Parameters.AddRange(new OleDbParameter[] { pramregestername, pramregesterbdate, pramregestermobile, pramregestermail, pramregestergov, pramregesteraddress, pramrcourseid, pramregestermsg });
        try
        {
            pramregestername.Value = txtregestername.Value;
            pramregesterbdate.Value = deregesterbdate.Value;
            pramregestermobile.Value = txtregestermobile.Value;
            pramregestermail.Value = txtregestermobile.Value;
            pramregestergov.Value = cbregestergov.Value;
            pramregesteraddress.Value = txtregesteraddress.Value;
            pramrcourseid.Value = cbcourseid.Value;
            pramregestermsg.Value = txtregestermsg.Value;
            
            con.Open(); cmd.ExecuteNonQuery(); con.Close();

            ASPxPopupControlEditor.Text = "تم الحفــــظ";
            ClearFrom();
        }
        catch (OleDbException ex)
        {
            ASPxPopupControlEditor.Text = ex.Message;
        }
        ASPxPopupControlEditor.ShowOnPageLoad = true;
    }
}