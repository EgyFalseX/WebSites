using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Net;
using System.Net.Mail;

public partial class SendMessage : System.Web.UI.UserControl
{
    private string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/contact.mdb");
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
    private void ClearForm()
    {
        ASPxCBLagnaId.SelectedItem = null;
        ASPxCBEdaraId.SelectedItem = null;
        ASPxCBsefaid.SelectedItem = null;
        Txtconame.Text = string.Empty;
        Txttel.Text = string.Empty;
        Txtmail.Text = string.Empty;
        Txtmassage.Text = string.Empty;
        CBShowOnLine.Checked = false;
        pnl.Visible = false;
        ASPxCBLagnaId.Focus();
    }
    private string GetNewMsgID()
    {
        string ReturnMe = string.Empty;
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            switch (Request.QueryString["contype"])
            {
                case "1"://استفسار
                    cmd.CommandText = "SELECT MAX(addno) FROM contact_ask";
                    break;
                case "2"://اقتراح
                    cmd.CommandText = "SELECT MAX(addno) FROM contact_suggest";
                    break;
                case "3"://شكوى
                    cmd.CommandText = "SELECT MAX(addno) FROM contact_shkwa";
                    break;
                case "4"://شكر
                    cmd.CommandText = "SELECT MAX(addno) FROM contact_thanks";
                    break;
                default:
                    break;
            }
            con.Open();
            object val = cmd.ExecuteScalar();
            if (CodesSyndicateContact.IsNullOrEmpty(val))
                ReturnMe = "1";
            else
                ReturnMe = ((int)val + 1).ToString();
        }
        catch (OleDbException ex)
        {
            throw ex;
        }
        con.Close();
        return ReturnMe;
    }
    private SmtpClient MailConfig()
    {
        DataTable dt = LoadTable("Select mailserver, port, username, pass, enableSsl from mailinfo");
        SmtpClient client = new SmtpClient();
        if (dt.Rows.Count != 0)
        {
            client.Host = dt.Rows[0]["mailserver"].ToString();
            client.Port = (int)dt.Rows[0]["port"]; ;
            client.Credentials = new NetworkCredential(dt.Rows[0]["username"].ToString(), dt.Rows[0]["pass"].ToString());
            client.EnableSsl = (bool)dt.Rows[0]["enableSsl"];
        }
        return client;
    }
    #endregion
    #region - Event Handler -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["contype"] == null)
                Response.Redirect("ChooseContype.aspx");
            else
            {
                switch (Request.QueryString["contype"])
                {
                    case "1":
                        LblTitle.Text = "استفسار";
                        break;
                    case "2":
                        LblTitle.Text = "اقتراح";
                        break;
                    case "3":
                        LblTitle.Text = "شكوى";
                        break;
                    case "4":
                        LblTitle.Text = "شكر";
                        break;
                    default:
                        break;
                }
            }
        }
    }
    protected void BtnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
    }
    protected void ASPxCBLagnaId_SelectedIndexChanged(object sender, EventArgs e)
    {
        ASPxCBEdaraId.SelectedItem = null;
    }
    protected void BtnSend_Click(object sender, EventArgs e)
    {
        LblState.Text = string.Empty;
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        string ResultNumber = GetNewMsgID();
        try
        {
            cmd.Parameters.Add(new OleDbParameter("@addno", OleDbType.Integer) { Value = ResultNumber });
            cmd.Parameters.Add(new OleDbParameter("@LagnaId", OleDbType.Integer) { Value = ASPxCBLagnaId.Value });
            cmd.Parameters.Add(new OleDbParameter("@EdaraId", OleDbType.Integer) { Value = ASPxCBEdaraId.Value });
            cmd.Parameters.Add(new OleDbParameter("@coname", OleDbType.WChar) { Value = Txtconame.Text });
            cmd.Parameters.Add(new OleDbParameter("@sefaid", OleDbType.Integer) { Value = ASPxCBsefaid.Value });
            cmd.Parameters.Add(new OleDbParameter("@tel", OleDbType.WChar) { Value = Txttel.Text });
            cmd.Parameters.Add(new OleDbParameter("@mail", OleDbType.WChar) { Value = Txtmail.Text });
            cmd.Parameters.Add(new OleDbParameter("@massage", OleDbType.WChar) { Value = Txtmassage.Text });
            cmd.Parameters.Add(new OleDbParameter("@agreeshow", OleDbType.Boolean) { Value = CBShowOnLine.Checked });
            switch (Request.QueryString["contype"])
            {
                case "1":
                    cmd.CommandText = @"INSERT INTO contact_ask (addno, LagnaId, EdaraId, coname, sefaid, tel, mail, massage, condate, agreeshow, serialno)
                    VALUES (@addno, @LagnaId, @EdaraId, @coname, @sefaid, @tel, @mail, @massage, NOW(), @agreeshow, @addno)";
                    break;
                case "2":
                    cmd.CommandText = @"INSERT INTO contact_suggest (addno, LagnaId, EdaraId, coname, sefaid, tel, mail, massage, condate, agreeshow, serialno)
                    VALUES (@addno, @LagnaId, @EdaraId, @coname, @sefaid, @tel, @mail, @massage, NOW(), @agreeshow, @addno)";
                    break;
                case "3":
                    cmd.CommandText = @"INSERT INTO contact_shkwa (addno, LagnaId, EdaraId, coname, sefaid, tel, mail, massage, condate, agreeshow, serialno)
                    VALUES (@addno, @LagnaId, @EdaraId, @coname, @sefaid, @tel, @mail, @massage, NOW(), @agreeshow, @addno)";
                    break;
                case "4":
                    cmd.CommandText = @"INSERT INTO contact_thanks (addno, LagnaId, EdaraId, coname, sefaid, tel, mail, massage, condate, agreeshow, serialno)
                    VALUES (@addno, @LagnaId, @EdaraId, @coname, @sefaid, @tel, @mail, @massage, NOW(), @agreeshow, @addno)";
                    break;
                default:
                    break;
            }
            con.Open();
            cmd.ExecuteNonQuery();
            
            if (CBShowOnLine.Checked)
                LblState.Text = "شكرا لك وسيتم عرض رسالتك بعد الرد عليها";
            else
                LblState.Text = "شكرا لك لقد تم ارسال رسالتك وسيتم الرد عليها";
            LblState.ForeColor = System.Drawing.Color.Green;
            TxtResultMail.Text = Txtmail.Text;
            TxtResultNumber.Text = ResultNumber;
            ClearForm();
            pnl.Visible = true;

            SmtpClient client = MailConfig();
            MailMessage message = new MailMessage();

            message.From = new MailAddress(((NetworkCredential)client.Credentials).UserName);
            message.To.Add(new MailAddress(TxtResultMail.Text));
            message.Subject = "noreply";
            message.Body = LblState.Text + Environment.NewLine;
            message.Body += "رقم الرساله : " + ResultNumber;
            message.IsBodyHtml = true;

            client.Send(message);
        }
        catch (OleDbException ex)
        {
            LblState.Text = ex.Message;
            LblState.ForeColor = System.Drawing.Color.Red;
            TxtResultMail.Text = string.Empty;
            TxtResultNumber.Text = string.Empty;
            pnl.Visible = false;
        }
        con.Close();
    }
    #endregion
    
}