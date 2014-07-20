using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.OleDb;

public partial class FBSendMSG : System.Web.UI.UserControl
{
                
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            DataTable DT = new DataTable("GeneralTable");
            DataTable DT2 = new DataTable("GeneralTable");
            OleDbDataAdapter DA = new OleDbDataAdapter("SELECT id_kind_m, name_kind_m FROM kind_m", MySchool.feedbackConnection);
            try
            {
                DA.Fill(DT);
                DDLMSGType.DataSource = DT;
                DDLMSGType.DataTextField = "name_kind_m";
                DDLMSGType.DataValueField = "id_kind_m";
                DDLMSGType.DataBind();
                DA.SelectCommand.CommandText = "SELECT TypeID, TypeName FROM JobTypes";
                DA.Fill(DT2);
                DDLSenderType.DataSource = DT2;
                DDLSenderType.DataTextField = "TypeName";
                DDLSenderType.DataValueField = "TypeID";
                DDLSenderType.DataBind();
                
            }
            catch (Exception ex)
            {
                LblStatus.Text = ex.Message;
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible = true;
            }
        }
    }
    protected void BtnSend_Click(object sender, EventArgs e)
    {
        BtnSend.Enabled = false;
        LblMSGNo.Text = "";
        string ID = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
        OleDbConnection Con = MySchool.feedbackConnection;
        OleDbCommand CMD = new OleDbCommand("INSERT INTO Contact_Us (id_Contact_Us, id_kind_m, Guest_Type, name_Contact_Us, mail_Contact_Us, phone_Contact_Us, address_Contact_Us, text_Contact_Us, date_entry) VALUES ('" + ID + "'," + DDLMSGType.SelectedValue.ToString() + "," + DDLSenderType.SelectedValue.ToString() + ",'" + TxtSenderName.Text + "','" + TxtSenderAddress.Text + "','" + TxtSenderPhone.Text + "','" + TxtMSGAddress.Text + "','" + TxtMSGContain.Text + "',#" + DateTime.Today.ToShortDateString() + "#)", Con);
        try
        {
            Con.Open();
            CMD.ExecuteNonQuery();
            LblStatus.Text = "تم الارسال";
            LblStatus.ForeColor = System.Drawing.Color.Green;
            LblStatus.Visible = true;
            LblMSGNo.Text = ID;
            LblMSGNo.Visible = true;
            LblInfo.Visible = true;
        }
        catch (Exception ex)
        {
            LblStatus.Text = ex.Message;
            LblStatus.ForeColor = System.Drawing.Color.Green;
            LblStatus.Visible = true;
        }
        Con.Close();
        BtnSend.Enabled = true;
    }
}