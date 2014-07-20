using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class UserControls_StudentGoingONDetailsReplies : System.Web.UI.UserControl
{
    public delegate void dg();
    public event dg ev;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void GoingONDetails(int ID)
    {
        string sl = "select id,notice,reply_code,reply from motapa where id = @id ";

        OleDbCommand com = new OleDbCommand(sl, MySchool.HomeWorkConnection);
        com.Parameters.AddWithValue("@id", ID);
        com.Connection.Open();
        OleDbDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            lblDetails.Text = dr["notice"].ToString();
            lblReply.Text = dr["reply"].ToString();
        }
        if (lblReply.Text == null || lblReply.Text == string.Empty)
        {
            lblReply.Visible = false;
            txtReply.Visible = true;
            btnSaveUpdate.Text = "حفظ";
        }
        else
        {
            lblReply.Visible = true;
            txtReply.Visible = false;
            btnSaveUpdate.Text = "تعديل";
        }
        com.Connection.Close();
    }
    protected void btnSaveUpdate_Click(object sender, EventArgs e)
    {
        if (btnSaveUpdate.Text == "تعديل")
        {
            txtReply.Text = lblReply.Text;
            lblReply.Visible = false;
            txtReply.Visible = true;
            btnSaveUpdate.Text = "حفظ";
        }
        else
        {
            ev();
            //txtReply.Text = lblDetails.Text;
            txtReply.Text = "";
        }
     
    }
    public void UpdateReply(int id)
    {

        OleDbCommand com = new OleDbCommand("update motapa set reply = ?,reply_code = ? where id = ?", MySchool.HomeWorkConnection);
            //OleDbCommand com = new OleDbCommand("update motapa set reply = ? where id = ?", MySchool.HomeWorkConnection);
    
        com.Parameters.AddWithValue("reply", txtReply.Text);

            if (txtReply.Text != null && txtReply.Text != string.Empty)
            {
                com.Parameters.AddWithValue("reply_code", 1);
            lblReply.Text = txtReply.Text;
            lblReply.Visible = true;
            txtReply.Visible = false;
            
            }
        else
            {
                com.Parameters.AddWithValue("reply_code", 2);
                lblReply.Text = txtReply.Text;
                lblReply.Visible = false;
                txtReply.Visible = true;
            }
            com.Parameters.AddWithValue("id", id);
           
            int x;
            com.Connection.Open();
           x =  com.ExecuteNonQuery();
            com.Connection.Close();
            GoingONDetails(1);
    }
}
