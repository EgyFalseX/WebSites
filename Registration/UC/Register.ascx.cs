using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


public partial class Register : System.Web.UI.UserControl
{
    #region -   Variables   -
    readonly string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/ABOUT.mdb");
    #endregion
    #region -   Functions   -
    private void ClearBrowserBackButton()
    {
        Response.AppendHeader("Pragma", "no-cache");

        Response.AppendHeader("Cache-Control", "no-cache");
        Response.CacheControl = "no-cache";

        Response.Expires = -1;
        Response.ExpiresAbsolute = new DateTime(1900, 1, 1);

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
    }
    private System.Net.Mail.SmtpClient MailConfig()
    {
        DataTable dt = LoadTable("Select mailserver, port, username, pass, enableSsl from mailinfo");
        System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();
        if (dt.Rows.Count != 0)
        {
            client.Host = dt.Rows[0]["mailserver"].ToString();
            client.Port = (int)dt.Rows[0]["port"]; ;
            client.Credentials = new System.Net.NetworkCredential(dt.Rows[0]["username"].ToString(), dt.Rows[0]["pass"].ToString());
            client.EnableSsl = (bool)dt.Rows[0]["enableSsl"];
        }
        return client;
    }
    private void SendMail(string addno, string mailAddress)
    {
        System.Net.Mail.SmtpClient client = MailConfig();
        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
        
        message.From = new System.Net.Mail.MailAddress(((System.Net.NetworkCredential)client.Credentials).UserName);
        message.To.Add(new System.Net.Mail.MailAddress(mailAddress));
        message.Subject = "نقابة المهن التعليمية - التسجيل الالكتروني";
        message.Body = @"نشكركم على تسجيلكم بموقع نقابة المهن التعليمية 
";
        message.Body += @" وسيتم التواصل معكم 
";
        message.Body += @"رقم التسجيل هو : " + addno + @"  
";
        message.Body += @"البريد الاليكتروني هو : " + mailAddress;

        message.IsBodyHtml = true;

        client.Send(message);
    }
    private DataTable LoadTable(string commandtext)
    {
        DataTable dt = new DataTable();
        using (OleDbDataAdapter da = new OleDbDataAdapter(commandtext, constr))
        {
            da.Fill(dt);
        }
        return dt;
    }

    private void ClearForm()
    {
        mohtypeid.SelectedItem = null;
        coname.Text = string.Empty;
        nid.Text = string.Empty;
        genderid.SelectedItem = null;
        bdate.Text = string.Empty;
        tel.Text = string.Empty;
        mobil.Text = string.Empty;
        mail.Text = string.Empty;
        govid.SelectedItem = null;
        address.Text = string.Empty;

        basicqualid.SelectedItem = null;
        basicqualother.Text = string.Empty;
        basicqualspcid.SelectedItem = null;
        basicqualspcidother.Text = string.Empty;
        basicqualyearid.SelectedItem = null;
        basicqualgehaid.SelectedItem = null;
        basicqualgehaother.Text = string.Empty;

        jobid.SelectedItem = null;
        jobidother.Text = string.Empty;
        jobgov.SelectedItem = null;
        jobgeha.SelectedItem = null;
        jobgehades.Text = string.Empty;
        jobstatid.SelectedItem = null;
        jobyearno.Text = string.Empty;

        mohqual.SelectedItem = null;
        mohqualother.Text = string.Empty;
        mohqualspc.SelectedItem = null;
        mohqualspcs.Text = string.Empty;
        mohqualyear.SelectedItem = null;
        mohqualtakid.SelectedItem = null;
        mohqualgeha.SelectedItem = null;
        mohqualgehaother.Text = string.Empty;
    }
    public string GetNewID(string columnName = "addno", string tableName = "contact")
    {
        string ReturnMe = string.Empty;
        
        using (OleDbConnection con = new OleDbConnection(constr))
        {
            OleDbCommand cmd = new OleDbCommand("", con);
            try
            {
                con.Open();
                cmd.CommandText = string.Format(@"SELECT IIF(IsNull(MAX({0})), 1, MAX({0}) + 1) AS NewID FROM {1}", columnName, tableName);
                ReturnMe = cmd.ExecuteScalar().ToString();
            }
            catch (OleDbException ex)
            {
                throw ex;
            }
            con.Close();
        }
        return ReturnMe;
    }
    private void ShowResult(string addno)
    {
        string CommandText = string.Format(@"SELECT addno, mail FROM contact WHERE addno = {0}", addno);
        DataTable dt = LoadTable(CommandText);
        if (dt.Rows.Count != 0)
        {
            pnlResult.Visible = true;
            lbladdno.Text = dt.Rows[0]["addno"].ToString();
            lblmail.Text = dt.Rows[0]["mail"].ToString();

            lbladdno0.Text = dt.Rows[0]["addno"].ToString();
            lblmail0.Text = dt.Rows[0]["mail"].ToString();

            SendMail(dt.Rows[0]["addno"].ToString(), dt.Rows[0]["mail"].ToString());

            //ASPxPageControlEditor.Visible = false;
            //btnsend.Visible = false;
        }
    }
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        ClearBrowserBackButton();
    }

    protected void basicqualid_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (basicqualid.SelectedItem == null)
        {
            HFbasicqualspcid.Value = string.Empty;
            basicqualother.Enabled = false;
            basicqualother.ValidationSettings.RequiredField.IsRequired = false;
        }
        else
        {
            HFbasicqualspcid.Value = (string)basicqualid.Value;
            if ((string)basicqualid.Value == "1000")
            {
                basicqualother.Enabled = true;
                basicqualother.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                basicqualother.Enabled = false;
                basicqualother.ValidationSettings.RequiredField.IsRequired = false;
            }
        }
    }
    protected void basicqualspcid_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (basicqualspcid.SelectedItem == null)
        {
            basicqualspcidother.Enabled = false;
            basicqualspcidother.ValidationSettings.RequiredField.IsRequired = false;
        }
        else
        {
            if ((string)basicqualspcid.Value == "1000")
            {
                basicqualspcidother.Enabled = true;
                basicqualspcidother.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                basicqualspcidother.Enabled = false;
                basicqualspcidother.ValidationSettings.RequiredField.IsRequired = false;
            }
        }
    }
    protected void basicqualgehaid_SelectedIndexChanged(object sender, EventArgs e)
    {
        //basicqualgehaother
        if (basicqualgehaid.SelectedItem == null)
        {
            basicqualgehaother.Enabled = false;
            basicqualgehaother.ValidationSettings.RequiredField.IsRequired = false;
        }
        else
        {
            if ((string)basicqualgehaid.Value == "1000")
            {
                basicqualgehaother.Enabled = true;
                basicqualgehaother.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                basicqualgehaother.Enabled = false;
                basicqualgehaother.ValidationSettings.RequiredField.IsRequired = false;
            }
        }
    }

    protected void jobid_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (jobid.SelectedItem == null)
        {
            jobidother.Enabled = false;
            jobidother.ValidationSettings.RequiredField.IsRequired = false;
        }
        else
        {
            if ((string)jobid.Value == "1000")
            {
                jobidother.Enabled = true;
                jobidother.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                jobidother.Enabled = false;
                jobidother.ValidationSettings.RequiredField.IsRequired = false;
            }
        }
    }
    protected void jobgeha_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (jobgeha.SelectedItem == null)
        {
            jobgehades.Enabled = false;
            jobgehades.ValidationSettings.RequiredField.IsRequired = false;
        }
        else
        {
            if ((string)jobgeha.Value == "1000")
            {
                jobgehades.Enabled = true;
                jobgehades.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                jobgehades.Enabled = false;
                jobgehades.ValidationSettings.RequiredField.IsRequired = false;
            }
        }
    }

    protected void mohqual_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (mohqual.SelectedItem == null)
        {
            HFmohqual.Value = string.Empty;
            mohqualother.Enabled = false;
            mohqualother.ValidationSettings.RequiredField.IsRequired = false;
        }
        else
        {
            HFmohqual.Value = (string)mohqual.Value;
            if ((string)mohqual.Value == "1000")
            {
                mohqualother.Enabled = true;
                mohqualother.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                mohqualother.Enabled = false;
                mohqualother.ValidationSettings.RequiredField.IsRequired = false;
            }
        }
    }
    protected void mohqualspc_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (mohqualspc.SelectedItem == null)
        {
            mohqualspcs.Enabled = false;
            mohqualspcs.ValidationSettings.RequiredField.IsRequired = false;
        }
        else
        {
            if ((string)mohqualspc.Value == "1000")
            {
                mohqualspcs.Enabled = true;
                mohqualspcs.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                mohqualspcs.Enabled = false;
                mohqualspcs.ValidationSettings.RequiredField.IsRequired = false;
            }
        }
    }
    protected void mohqualgeha_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (mohqualgeha.SelectedItem == null)
        {
            mohqualgehaother.Enabled = false;
            mohqualgehaother.ValidationSettings.RequiredField.IsRequired = false;
        }
        else
        {
            if ((string)mohqualgeha.Value == "1000")
            {
                mohqualgehaother.Enabled = true;
                mohqualgehaother.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                mohqualgehaother.Enabled = false;
                mohqualgehaother.ValidationSettings.RequiredField.IsRequired = false;
            }
        }
    }
    
    protected void btnsend_Click(object sender, EventArgs e)
    {
        ASPxPopupControlEditor.ShowOnPageLoad = true;
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            string addno = GetNewID();

            cmd.CommandText = string.Format(@"INSERT INTO contact (addno, mohtypeid, coname, nid, genderid, bdate, tel, mobil, mail, govid, address, 
            basicqualid, basicqualother, basicqualspcid, basicqualspcidother, basicqualyearid, basicqualgehaid, basicqualgehaother, 
            jobid, jobidother, jobgov, jobgeha, jobgehades, jobstatid, jobyearno, 
            mohqual, mohqualother, mohqualspc, mohqualspcs, mohqualyear, mohqualtakid, mohqualgeha, mohqualgehaother)
            VALUES (
            {0}, @mohtypeid, @coname, @nid, @genderid, @bdate, @tel, @mobil, @mail, @govid, @address, 
            @basicqualid, @basicqualother, @basicqualspcid, @basicqualspcidother, @basicqualyearid, @basicqualgehaid, @basicqualgehaother, 
            @jobid, @jobidother, @jobgov, @jobgeha, @jobgehades, @jobstatid, @jobyearno, 
            @mohqual, @mohqualother, @mohqualspc, @mohqualspcs, @mohqualyear, @mohqualtakid, @mohqualgeha, @mohqualgehaother)", addno);

            
            if (mohtypeid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@mohtypeid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@mohtypeid", OleDbType.Integer) { Value = mohtypeid.Value });
            cmd.Parameters.Add(new OleDbParameter("@coname", OleDbType.WChar) { Value = coname.Text });
            cmd.Parameters.Add(new OleDbParameter("@nid", OleDbType.WChar) { Value = nid.Text });
            if (genderid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@genderid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@genderid", OleDbType.Integer) { Value = genderid.Value });
            if (bdate.Value == null)
                cmd.Parameters.Add(new OleDbParameter("@bdate", OleDbType.Date) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@bdate", OleDbType.Date) { Value = bdate.Text });
            cmd.Parameters.Add(new OleDbParameter("@tel", OleDbType.WChar) { Value = tel.Text });
            cmd.Parameters.Add(new OleDbParameter("@mobil", OleDbType.WChar) { Value = mobil.Text });
            cmd.Parameters.Add(new OleDbParameter("@mail", OleDbType.WChar) { Value = mail.Text });
            if (govid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@govid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@govid", OleDbType.Integer) { Value = govid.Value });
            cmd.Parameters.Add(new OleDbParameter("@address", OleDbType.WChar) { Value = address.Text });
            //
            if (basicqualid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@basicqualid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@basicqualid", OleDbType.Integer) { Value = basicqualid.Value });
            cmd.Parameters.Add(new OleDbParameter("@basicqualother", OleDbType.WChar) { Value = basicqualother.Text });
            if (basicqualspcid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@basicqualspcid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@basicqualspcid", OleDbType.Integer) { Value = basicqualspcid.Value });
            cmd.Parameters.Add(new OleDbParameter("@basicqualspcidother", OleDbType.WChar) { Value = basicqualspcidother.Text });
            if (basicqualyearid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@basicqualyearid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@basicqualyearid", OleDbType.Integer) { Value = basicqualyearid.Value });
            if (basicqualgehaid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@basicqualgehaid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@basicqualgehaid", OleDbType.Integer) { Value = basicqualgehaid.Value });
            cmd.Parameters.Add(new OleDbParameter("@basicqualgehaother", OleDbType.WChar) { Value = basicqualgehaother.Text });
            //
            if (jobid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@jobid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@jobid", OleDbType.Integer) { Value = jobid.Value });
            cmd.Parameters.Add(new OleDbParameter("@jobidother", OleDbType.WChar) { Value = jobidother.Text });
            if (jobgov.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@jobgov", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@jobgov", OleDbType.Integer) { Value = jobgov.Value });
            if (jobgeha.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@jobgeha", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@jobgeha", OleDbType.Integer) { Value = jobgeha.Value });
            cmd.Parameters.Add(new OleDbParameter("@jobgehades", OleDbType.WChar) { Value = jobgehades.Text });
            if (jobstatid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@jobstatid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@jobstatid", OleDbType.Integer) { Value = jobstatid.Value });
            if (jobyearno.Text == string.Empty)
                cmd.Parameters.Add(new OleDbParameter("@jobyearno", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@jobyearno", OleDbType.Integer) { Value = jobyearno.Text });
            //
            if (mohqual.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@mohqual", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@mohqual", OleDbType.Integer) { Value = mohqual.Value });
            cmd.Parameters.Add(new OleDbParameter("@mohqualother", OleDbType.WChar) { Value = mohqualother.Text });
            if (mohqualspc.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@mohqualspc", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@mohqualspc", OleDbType.Integer) { Value = mohqualspc.Value });
            cmd.Parameters.Add(new OleDbParameter("@mohqualspcs", OleDbType.WChar) { Value = mohqualspcs.Text });
            if (mohqualyear.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@mohqualyear", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@mohqualyear", OleDbType.Integer) { Value = mohqualyear.Value });
            if (mohqualtakid.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@mohqualtakid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@mohqualtakid", OleDbType.Integer) { Value = mohqualtakid.Value });
            if (mohqualgeha.SelectedItem == null)
                cmd.Parameters.Add(new OleDbParameter("@mohqualgeha", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@mohqualgeha", OleDbType.Integer) { Value = mohqualgeha.Value });
            cmd.Parameters.Add(new OleDbParameter("@mohqualgehaother", OleDbType.WChar) { Value = mohqualgehaother.Text });

            //cmd.Parameters.Add(new OleDbParameter("@addno", OleDbType.Integer) { Value = addno });

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            
            ShowResult(addno);
            ClearForm();
            ASPxPopupControlEditor.Text = "شكــــــرا لــك لقد تــم تسجيــل البيانات ";
            

        }
        catch (OleDbException ex)
        {
            LblState.Text = ex.Message;
            ASPxPopupControlEditor.Text = ex.Message;
        }
        
    }

    #endregion
}