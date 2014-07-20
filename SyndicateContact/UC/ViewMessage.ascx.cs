using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class ViewMessage : System.Web.UI.UserControl
{
    #region -   Variables   -
    private string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/contact.mdb");
    #endregion
    #region -   Functions   -
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
    private void ClearForm()
    {
        Lblconame.Text = string.Empty;
        Lbltel.Text = string.Empty;
        Lblmail.Text = string.Empty;
        Lblmassage.Text = string.Empty;
        Lblcondate.Text = string.Empty;
        Lblreply.Text = string.Empty;
        LblLagnaName.Text = string.Empty;
        LblEdaraName.Text = string.Empty;
        Lblreplydate.Text = string.Empty;
        RoundPnl.Visible = false;
    }
    #endregion
    #region - Event Handlers -
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        LblStatus.Text = string.Empty;
        RoundPnl.Visible = false;

        DataTable dt = new DataTable();
        switch (ASPxCB.SelectedItem.Value.ToString())
        {
            case"1":
                dt = LoadTable(@"SELECT addno, LagnaId, EdaraId, coname, tel, mail, massage, 
                FORMAT(condate, 'dd/MM/yyyy') AS condate, reply, FORMAT(replydate, 'dd/MM/yyyy') AS replydate, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_ask.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_ask.LagnaId) AS LagnaName 
                FROM contact_ask WHERE addno = " + TxtResultNumber.Text + " AND mail = '" + TxtResultMail.Text + "'");
                break;
            case "2":
                dt = LoadTable(@"SELECT addno, LagnaId, EdaraId, coname, tel, mail, massage, 
                FORMAT(condate, 'dd/MM/yyyy') AS condate, reply, FORMAT(replydate, 'dd/MM/yyyy') AS replydate, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_suggest.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_suggest.LagnaId) AS LagnaName 
                FROM contact_suggest WHERE addno = " + TxtResultNumber.Text + " AND mail = '" + TxtResultMail.Text + "'");
                break;
            case "3":
                dt = LoadTable(@"SELECT addno, LagnaId, EdaraId, coname, tel, mail, massage, 
                FORMAT(condate, 'dd/MM/yyyy') AS condate, reply, FORMAT(replydate, 'dd/MM/yyyy') AS replydate, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_shkwa.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_shkwa.LagnaId) AS LagnaName 
                FROM contact_shkwa WHERE addno = " + TxtResultNumber.Text + " AND mail = '" + TxtResultMail.Text + "'");
                break;
            case "4":
                dt = LoadTable(@"SELECT addno, LagnaId, EdaraId, coname, tel, mail, massage, 
                FORMAT(condate, 'dd/MM/yyyy') AS condate, reply, FORMAT(replydate, 'dd/MM/yyyy') AS replydate, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_thanks.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_thanks.LagnaId) AS LagnaName 
                FROM contact_thanks WHERE addno = " + TxtResultNumber.Text + " AND mail = '" + TxtResultMail.Text + "'");
                break;
            default:
                break;
        }
        if (dt.Rows.Count == 0)
        {
            ClearForm();
            LblStatus.Text = "لا يوجد بيانات";
            LblStatus.ForeColor = System.Drawing.Color.Red;
            return;
        }
        DataRow row = dt.Rows[0];
        Lblconame.Text = row["coname"].ToString();
        Lbltel.Text = row["tel"].ToString();
        Lblmail.Text = row["mail"].ToString();
        Lblmassage.Text = row["massage"].ToString();
        Lblcondate.Text = row["condate"].ToString();
        Lblreply.Text = row["reply"].ToString();
        LblLagnaName.Text = row["LagnaName"].ToString();
        LblEdaraName.Text = row["EdaraName"].ToString();
        Lblreplydate.Text = row["replydate"].ToString();
        RoundPnl.Visible = true;
    }
    #endregion

    
}