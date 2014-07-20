using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ContactUs_Default2 : System.Web.UI.Page
{
    private bool updatelogin(string id, string uname, string pass)
    {
        bool ReturnMe = false;
        SqlConnection con = new SqlConnection(SqlProvider.SqlConStr);
        SqlCommand cmd = new SqlCommand("", con);
        try
        {
            cmd.CommandText = string.Format(@"Update [Users] set [UserName] = N'{0}', [UserPass] = N'{1}' Where [UserID] = {2}", uname, pass, id);
            con.Open();
            cmd.ExecuteNonQuery();
            ReturnMe = true;
        }
        catch (SqlException ex)
        {
            con.Close();
            throw ex;
        }
        con.Close();
        return ReturnMe;
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Sessionz.IsAuthorized == false)
        {
            Response.Redirect("Login.aspx");
            return;
        }
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

        if (SqlProvider.LoadDataTable(string.Format("Select UserID From UserName Where UserID = {0} AND UserPass = N'{1}'", Sessionz.UserID, TxtCPass.Text)).Rows.Count == 0)
        {
            lblstate.Text = "خطـــاء في كلمة المرور الحاليه";
            lblstate.ForeColor = System.Drawing.Color.Red;
            return;
        }
        try
        {
            if (updatelogin(Sessionz.UserID.ToString(), TxtUName.Text.Trim(), TxtPass1.Text.Trim()) == true)
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