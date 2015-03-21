using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

public partial class ContactUs_Default2 : System.Web.UI.Page
{
    dsImageGallaryTableAdapters.UserInfoTableAdapter adp = new dsImageGallaryTableAdapters.UserInfoTableAdapter();

    private bool updatelogin(string id, string uname, string pass)
    {
        adp.UpdateUserInfo(uname, pass, Convert.ToInt32(id));
        return true;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (sessionImageGallary.IsAuth == false)
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
        if ((int)adp.CheckPass(TxtCPass.Text, Convert.ToInt32(sessionImageGallary.UserID)) == 0)
        {
            lblstate.Text = "خطـــاء في كلمة المرور الحاليه";
            lblstate.ForeColor = System.Drawing.Color.Red;
            return;
        }
       
        try
        {

            if (updatelogin(sessionImageGallary.UserID, TxtUName.Text.Trim(), TxtPass1.Text.Trim()) == true)
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