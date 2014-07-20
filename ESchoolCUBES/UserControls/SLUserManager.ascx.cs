using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.OleDb;

public partial class UserControl_SLUserManager : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            OleDbConnection Con = MySchool.SLConnection;
            OleDbCommand CMD = new OleDbCommand("Select UName, UPass From LoginInfo", Con);
            OleDbDataReader DR;
            try 
            {
                Con.Open();
                DR = CMD.ExecuteReader();
                while (DR.Read())
                {
                    TxtUID.Text = DR.GetValue(0).ToString();
                    TxtPass1.Text = DR.GetValue(1).ToString();
                    TxtPass2.Text = DR.GetValue(1).ToString();
                }
            }
            catch (Exception ex)
            {
                BtnSave.Visible=false;
                LblStatus.Text = ex.Message.ToString();
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible= true;
            }

            Con.Close();
        }
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (TxtPass1.Text == TxtPass2.Text)
        {
            OleDbConnection Con = MySchool.SLConnection;
            OleDbCommand CMD = new OleDbCommand("Update LoginInfo Set UName = '" + TxtUID.Text + "',UPass = '" + TxtPass1.Text + "'", Con);
            try
            {
                Con.Open();
                CMD.ExecuteNonQuery();
                LblStatus.Text = "تم التعديل بنجاح";
                LblStatus.ForeColor = System.Drawing.Color.Green;
                LblStatus.Visible = true;
            }
            catch (Exception ex)
            {
                LblStatus.Text = ex.Message.ToString();
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible= true;
            }
            Con.Close();
        }
    }

    protected void Txt_TextChanged(object sender, EventArgs e)
    {
        if (TxtUID.Text.Length > 0 && TxtPass1.Text.Length > 0 && TxtPass2.Text.Length > 0)
        {
            BtnSave.Enabled = true;
        }
        else
        {
            BtnSave.Enabled = false;
        }
    }
   
}
