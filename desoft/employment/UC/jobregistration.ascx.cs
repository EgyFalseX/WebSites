using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class jobregistration : System.Web.UI.UserControl
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
    }
    #endregion
    #region -   Event Handlers   -
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["advid"] == null)
            Response.Redirect("jobannouncementviewer.aspx");
        if (!IsPostBack)
        {
            cbadvid.DataBind();
            cbadvid.Value = Request.QueryString["advid"];
            lblTitle.Text = "استمارة التقدم لوظيفة " + cbadvid.Items.FindByValue(Request.QueryString["advid"]).Text;
        }
    }
    protected void btnsend_Click(object sender, EventArgs e)
    {

        ASPxPopupControlEditor.ShowOnPageLoad = true;
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"INSERT INTO registration (nationalid, advid, empname, nationalityid, empstat, birth, birthplace, addres, email, tel, mobil, geha, special, yeart, moahel, dtraining, Bjop1, Bgeha1, Bdate1, 
            Bsalary1, Breson1, Bjop2, Bgeha2, Bdate2, Bsalary2, Breson2, Bjop3, Bgeha3, Bdate3, Bsalary3, Breson3)
            VALUES (@nationalid, @advid, @empname, @nationalityid, @empstat, @birth, @birthplace, @addres, @email, @tel, @mobil, @geha, @special, @yeart, @moahel, @dtraining, @Bjop1, @Bgeha1, @Bdate1, @Bsalary1, @Breson1, @Bjop2, @Bgeha2, 
            @Bdate2, @Bsalary2, @Breson2, @Bjop3, @Bgeha3, @Bdate3, @Bsalary3, @Breson3)");

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

            con.Open();
            cmd.ExecuteNonQuery();
            ClearForm();
            ASPxPopupControlEditor.Text = "شكرا للتسجــــــــــــــــيل";
        }
        catch (OleDbException ex)
        {
            ASPxPopupControlEditor.Text = ex.Message;
        }
        con.Close();
    }
    #endregion
}