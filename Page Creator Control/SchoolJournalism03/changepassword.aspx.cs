using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class ContactUs_Default2 : System.Web.UI.Page
{
    string constr = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source= " + HttpContext.Current.Server.MapPath(@"Data/FlexibleData.mdb");

    private DataTable LoadTable(string commandtext)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(commandtext, constr);
        da.Fill(dt);

        return dt;
    }
    private bool updatelogin(string id, string uname, string pass)
    {
        bool ReturnMe = false;
        OleDbConnection con = new OleDbConnection(constr);
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Update [enasadmin] set [user] = '{0}', [pass] = '{1}' Where [id] = {2}", uname, pass, id);
            con.Open();
            cmd.ExecuteNonQuery();
            ReturnMe = true;
        }
        catch (OleDbException ex)
        {
            con.Close();
            throw ex;
        }
        con.Close();
        return ReturnMe;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["UserIDhonor"] == null)
            Response.Redirect("AdminLogin.aspx?RedirectURL=" + Server.UrlEncode(Request.Url.ToString()).ToString());
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (TxtUName.Text.Trim().Length == 0)
        {
            lblstate.Text = "من فضلك ادخل اسم المستخدم الجديد";
            lblstate.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (TxtPass1.Text.Trim().Length == 0 || TxtPass2.Text.Trim().Length == 0)
        {
            lblstate.Text = "من فضلك ادخل كلمة المرور الجديد و اعد كتابتها";
            lblstate.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (TxtPass1.Text.Trim() != TxtPass2.Text.Trim())
        {
            lblstate.Text = "كلمة المرور الجديده غير مطابقه لنظيرتها";
            lblstate.ForeColor = System.Drawing.Color.Red;
            return;
        }
        if (TxtCPass.Text.Trim().Length == 0)
        {
            lblstate.Text = "من فضلك ادخل كلمة المرور الحاليه";
            lblstate.ForeColor = System.Drawing.Color.Red;
            return;
        }

        if (LoadTable(string.Format("Select * From enasadmin Where id = {0} And pass = '{1}'", HttpContext.Current.Session["UserIDhonor"].ToString(), TxtCPass.Text)).Rows.Count == 0)
        {
            lblstate.Text = "خطـــاء في كلمة المرور الحاليه";
            lblstate.ForeColor = System.Drawing.Color.Red;
            return;
        }
        try
        {
            if (updatelogin(HttpContext.Current.Session["UserIDhonor"].ToString(), TxtUName.Text.Trim(), TxtPass1.Text.Trim()) == true)
            {
                lblstate.Text = "تم التعديل";
                lblstate.ForeColor = System.Drawing.Color.Green;
                TxtUName.Text = string.Empty;
                TxtCPass.Text = string.Empty;
                TxtPass1.Text = string.Empty;
                TxtPass2.Text = string.Empty;
            }
        }
        catch (OleDbException ex)
        {
            lblstate.Text = ex.Message;
            lblstate.ForeColor = System.Drawing.Color.Red;
        }
    }
}