using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Net;
using System.Net.Mail;

public partial class jobregistrationDetailsEditor : System.Web.UI.UserControl
{
    #region -   Variables   -
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"App_Data/tawzif.mdb");
    #endregion
    #region -   Functions   -
    private DataTable LoadTable(string commandtext)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandtext, constr);
        da.Fill(dt);
        return dt;
    }
    private void ClearForm()
    {
        tbnationalid.Text = string.Empty;
        cbadvid.SelectedItem = null;
        tbempname.Text = string.Empty;
        cbnationalityid.SelectedItem = null;
        cbempstat.SelectedItem = null;
        debirth.Text = string.Empty;
        tbbirthplace.Text = string.Empty;
        tbaddres.Text = string.Empty;
        tbemail.Text = string.Empty;
        tbtel.Text = string.Empty;
        tbmobil.Text = string.Empty;
        tbgeha.Text = string.Empty;
        tbspecial.Text = string.Empty;
        tbyeart.Text = string.Empty;
        tbmoahel.Text = string.Empty;
        tbdtraining.Text = string.Empty;
        tbBjop1.Text = string.Empty;
        tbBgeha1.Text = string.Empty;
        deBdate1.Text = string.Empty;
        tbBsalary1.Text = string.Empty;
        tbBreson1.Text = string.Empty;
        tbBjop2.Text = string.Empty;
        tbBgeha2.Text = string.Empty;
        deBdate2.Text = string.Empty;
        tbBsalary2.Text = string.Empty;
        tbBreson2.Text = string.Empty;
        tbBjop3.Text = string.Empty;
        tbBgeha3.Text = string.Empty;
        deBdate3.Text = string.Empty;
        tbBsalary3.Text = string.Empty;
        tbBreson3.Text = string.Empty;
        tbreplymail.Text = string.Empty;
    }
    private void LoadData()
    {
        DataTable dt = LoadTable(@"SELECT regid, nationalid, advid, empname, nationalityid, empstat, birth, birthplace, addres, email, tel, mobil, geha, special, yeart, moahel, dtraining, Bjop1, Bgeha1, Bdate1, 
        Bsalary1, Breson1, Bjop2, Bgeha2, Bdate2, Bsalary2, Breson2, Bjop3, Bgeha3, Bdate3, Bsalary3, Breson3, replymail
        FROM registration Where regid = " + Request.QueryString["regid"]);

        DataTable dtadvjob = LoadTable(@"SELECT advid, advsubject FROM advjob WHERE (showonsite = true)");
        cbadvid.DataSource = dtadvjob;
        cbadvid.DataBind();
        DataTable dtnationalitycd = LoadTable(@"SELECT nationalityid, nationality FROM nationalitycd");
        cbnationalityid.DataSource = dtnationalitycd;
        cbnationalityid.DataBind();
        DataTable dtcdempstat = LoadTable(@"SELECT [empstat], [state] FROM [cdempstat]");
        cbempstat.DataSource = dtcdempstat;
        cbempstat.DataBind();

        if (dt.Rows.Count == 0)
            Response.Redirect("jobregistrationEditor.aspx");

        tbnationalid.Text = dt.Rows[0]["nationalid"].ToString();
        if (dt.Rows[0]["advid"].ToString() != string.Empty)
        {
            for (int i = 0; i < dtadvjob.Rows.Count; i++)
            {
                if (dtadvjob.Rows[i]["advid"].ToString() == dt.Rows[0]["advid"].ToString())
                {
                    cbadvid.Value = dt.Rows[0]["advid"];
                    cbadvid.SelectedIndex = i;
                    lblTitle.Text = "استمارة التقدم لوظيفة " + cbadvid.Text;
                    break;
                }
            }
        }
        tbempname.Text = dt.Rows[0]["empname"].ToString();
        if (dt.Rows[0]["nationalityid"].ToString() != string.Empty)
        {
            for (int i = 0; i < dtnationalitycd.Rows.Count; i++)
            {
                if (dtnationalitycd.Rows[i]["nationalityid"].ToString() == dt.Rows[0]["nationalityid"].ToString())
                {
                    cbnationalityid.Value = dt.Rows[0]["nationalityid"];
                    cbnationalityid.SelectedIndex = i;
                    break;
                }
            }
        }
        if (dt.Rows[0]["empstat"].ToString() != string.Empty)
        {
            for (int i = 0; i < dtcdempstat.Rows.Count; i++)
            {
                if (dtcdempstat.Rows[i]["empstat"].ToString() == dt.Rows[0]["empstat"].ToString())
                {
                    cbempstat.Value = dt.Rows[0]["empstat"];
                    cbempstat.SelectedIndex = i;
                    break;
                }
            }
        }

        if (dt.Rows[0]["birth"].ToString() != string.Empty)
            debirth.Date = Convert.ToDateTime(dt.Rows[0]["birth"]);

        tbbirthplace.Text = dt.Rows[0]["birthplace"].ToString();
        tbaddres.Text = dt.Rows[0]["addres"].ToString();
        tbemail.Text = dt.Rows[0]["email"].ToString();
        tbtel.Text = dt.Rows[0]["tel"].ToString();
        tbmobil.Text = dt.Rows[0]["mobil"].ToString();
        tbgeha.Text = dt.Rows[0]["geha"].ToString();
        tbspecial.Text = dt.Rows[0]["special"].ToString();
        tbyeart.Text = dt.Rows[0]["yeart"].ToString();
        tbmoahel.Text = dt.Rows[0]["moahel"].ToString();
        tbdtraining.Text = dt.Rows[0]["dtraining"].ToString();

        tbBjop1.Text = dt.Rows[0]["Bjop1"].ToString();
        tbBgeha1.Text = dt.Rows[0]["Bgeha1"].ToString();
        if (dt.Rows[0]["Bdate1"].ToString() != string.Empty)
            deBdate1.Date = Convert.ToDateTime(dt.Rows[0]["Bdate1"]);
        tbBsalary1.Text = dt.Rows[0]["Bsalary1"].ToString();
        tbBreson1.Text = dt.Rows[0]["Breson1"].ToString();

        tbBjop2.Text = dt.Rows[0]["Bjop2"].ToString();
        tbBgeha2.Text = dt.Rows[0]["Bgeha2"].ToString();
        if (dt.Rows[0]["Bdate2"].ToString() != string.Empty)
            deBdate2.Date = Convert.ToDateTime(dt.Rows[0]["Bdate2"]);
        tbBsalary2.Text = dt.Rows[0]["Bsalary2"].ToString();
        tbBreson2.Text = dt.Rows[0]["Breson2"].ToString();

        tbBjop3.Text = dt.Rows[0]["Bjop3"].ToString();
        tbBgeha3.Text = dt.Rows[0]["Bgeha3"].ToString();
        if (dt.Rows[0]["Bdate3"].ToString() != string.Empty)
            deBdate3.Date = Convert.ToDateTime(dt.Rows[0]["Bdate3"]);
        tbBsalary3.Text = dt.Rows[0]["Bsalary3"].ToString();
        tbBreson3.Text = dt.Rows[0]["Breson3"].ToString();

        tbreplymail.Text = dt.Rows[0]["replymail"].ToString();

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
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["regid"] == null)
            Response.Redirect("jobregistrationEditor.aspx");
        if (!IsPostBack)
        {
            LoadData();// Load data into page
        }
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["regid"] == null)
            return;
        ASPxPopupControlEditor.ShowOnPageLoad = true;
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"UPDATE registration SET nationalid = @nationalid, advid = @advid, empname = @empname, nationalityid = @nationalityid, empstat = @empstat, birth = @birth, birthplace = @birthplace, addres = @addres, 
            email = @email, tel = @tel, mobil = @mobil, geha = @geha, special = @special, yeart = @yeart, moahel = @moahel, dtraining = @dtraining, Bjop1 = @Bjop1, Bgeha1 = @Bgeha1, Bdate1 = @Bdate1, Bsalary1 = @Bsalary1, Breson1 = @Breson1, 
            Bjop2 = @Bjop2, Bgeha2 = @Bgeha2, Bdate2 = @Bdate2, Bsalary2 = @Bsalary2, Breson2 = @Breson2, Bjop3 = @Bjop3, Bgeha3 = @Bgeha3, Bdate3 = @Bdate3, Bsalary3 = @Bsalary3, Breson3 = @Breson3, replymail = @replymail WHERE regid = @regid");

            if (tbnationalid.Text == string.Empty)
                cmd.Parameters.Add(new OleDbParameter("@nationalid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@nationalid", OleDbType.Integer) { Value = tbnationalid.Text });
            if (cbadvid.Value == null)
                cmd.Parameters.Add(new OleDbParameter("@advid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@advid", OleDbType.Integer) { Value = cbadvid.Value });
            cmd.Parameters.Add(new OleDbParameter("@empname", OleDbType.VarChar) { Value = tbempname.Text });
            if (cbnationalityid.Value == null)
                cmd.Parameters.Add(new OleDbParameter("@nationalityid", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@nationalityid", OleDbType.Integer) { Value = cbnationalityid.Value });
            if (cbempstat.Value == null)
                cmd.Parameters.Add(new OleDbParameter("@empstat", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@empstat", OleDbType.Integer) { Value = cbempstat.Value });

            if (debirth.Value == null)
                cmd.Parameters.Add(new OleDbParameter("@birth", OleDbType.Date) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@birth", OleDbType.Date) { Value = debirth.Text });
            cmd.Parameters.Add(new OleDbParameter("@birthplace", OleDbType.VarChar) { Value = tbbirthplace.Text });
            cmd.Parameters.Add(new OleDbParameter("@addres", OleDbType.VarChar) { Value = tbaddres.Text });
            cmd.Parameters.Add(new OleDbParameter("@email", OleDbType.VarChar) { Value = tbemail.Text });
            cmd.Parameters.Add(new OleDbParameter("@tel", OleDbType.VarChar) { Value = tbtel.Text });
            cmd.Parameters.Add(new OleDbParameter("@mobil", OleDbType.VarChar) { Value = tbmobil.Text });
            cmd.Parameters.Add(new OleDbParameter("@geha", OleDbType.VarChar) { Value = tbgeha.Text });
            cmd.Parameters.Add(new OleDbParameter("@special", OleDbType.VarChar) { Value = tbspecial.Text });
            cmd.Parameters.Add(new OleDbParameter("@yeart", OleDbType.VarChar) { Value = tbyeart.Text });
            cmd.Parameters.Add(new OleDbParameter("@moahel", OleDbType.VarChar) { Value = tbmoahel.Text });
            cmd.Parameters.Add(new OleDbParameter("@dtraining", OleDbType.VarChar) { Value = tbdtraining.Text });
            cmd.Parameters.Add(new OleDbParameter("@Bjop1", OleDbType.VarChar) { Value = tbBjop1.Text });
            cmd.Parameters.Add(new OleDbParameter("@Bgeha1", OleDbType.VarChar) { Value = tbBgeha1.Text });
            if (deBdate1.Value == null)
                cmd.Parameters.Add(new OleDbParameter("@Bdate1", OleDbType.Date) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@Bdate1", OleDbType.Date) { Value = deBdate1.Text });
            if (tbBsalary1.Text == string.Empty)
                cmd.Parameters.Add(new OleDbParameter("@Bsalary1", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@Bsalary1", OleDbType.Integer) { Value = tbBsalary1.Text });
            cmd.Parameters.Add(new OleDbParameter("@Breson1", OleDbType.VarChar) { Value = tbBreson1.Text });
            cmd.Parameters.Add(new OleDbParameter("@Bjop2", OleDbType.VarChar) { Value = tbBjop2.Text });
            cmd.Parameters.Add(new OleDbParameter("@Bgeha2", OleDbType.VarChar) { Value = tbBgeha2.Text });
            if (deBdate2.Value == null)
                cmd.Parameters.Add(new OleDbParameter("@Bdate2", OleDbType.Date) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@Bdate2", OleDbType.Date) { Value = deBdate2.Text });

            if (tbBsalary1.Text == string.Empty)
                cmd.Parameters.Add(new OleDbParameter("@Bsalary2", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@Bsalary2", OleDbType.Integer) { Value = tbBsalary2.Text });
            cmd.Parameters.Add(new OleDbParameter("@Breson2", OleDbType.VarChar) { Value = tbBreson2.Text });
            cmd.Parameters.Add(new OleDbParameter("@Bjop3", OleDbType.VarChar) { Value = tbBjop3.Text });
            cmd.Parameters.Add(new OleDbParameter("@Bgeha3", OleDbType.VarChar) { Value = tbBgeha3.Text });
            if (deBdate3.Value == null)
                cmd.Parameters.Add(new OleDbParameter("@Bdate3", OleDbType.Date) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@Bdate3", OleDbType.Date) { Value = deBdate3.Text });

            if (tbBsalary3.Text == string.Empty)
                cmd.Parameters.Add(new OleDbParameter("@Bsalary3", OleDbType.Integer) { Value = DBNull.Value });
            else
                cmd.Parameters.Add(new OleDbParameter("@Bsalary3", OleDbType.Integer) { Value = Convert.ToInt32(tbBsalary3.Text) });
            cmd.Parameters.Add(new OleDbParameter("@Breson3", OleDbType.VarChar) { Value = tbBreson3.Text });

            cmd.Parameters.Add(new OleDbParameter("@replymail", OleDbType.VarChar) { Value = tbreplymail.Text });
            cmd.Parameters.Add(new OleDbParameter("@regid", OleDbType.Integer) { Value = Request.QueryString["regid"].Trim() });
            con.Open();
            cmd.ExecuteNonQuery();
            if (cbSendMail.Checked && tbemail.Text != string.Empty && tbreplymail.Text != string.Empty)
            {
                try
                {
                    SendMail(tbemail.Text, tbreplymail.Text);
                    ASPxPopupControlEditor.Text = String.Format("تم التعديـــــــل{0}تم الارسال", Environment.NewLine);
                }
                catch (Exception ex)
                { ASPxPopupControlEditor.Text = String.Format("تم التعديـــــــل{0}{1}", Environment.NewLine, ex.Message); }
            }
            else
                ASPxPopupControlEditor.Text = "تم التعديـــــــل";
            ClearForm();
        }
        catch (OleDbException ex)
        {
            ASPxPopupControlEditor.Text = ex.Message;
        }
        con.Close();
    }
    private bool SendMail(string mail, string msg)
    {
        bool returnMe = false;
        try
        {
            SmtpClient client = MailConfig();
            MailMessage message = new MailMessage();

            message.From = new MailAddress(((NetworkCredential)client.Credentials).UserName);
            message.To.Add(new MailAddress(mail));
            message.Subject = "noreply";
            message.Body = msg;
            message.IsBodyHtml = true;

            client.Send(message);
            returnMe = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return returnMe;
    }
    
    #endregion
}