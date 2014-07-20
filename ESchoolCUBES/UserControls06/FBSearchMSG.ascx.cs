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

public partial class FBSearchMSG : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSearchMSG_Click(object sender, EventArgs e)
    {
       //لا يوجد رساله بهذا الرقم
        LblStatus.Visible = false;
        PnlMSG.Visible = false;
        Cleartext();
        if (TxtMSGSearchNo.Text.Length == 0)
        {
            LblStatus.Text = "من فضلك اكتب رقم الرساله";
            LblStatus.Visible = true;
            return;
        }
        
        DataTable DT = new DataTable("MSGs");
        OleDbDataAdapter DA = new OleDbDataAdapter("SELECT Contact_Us.id_Contact_Us, Contact_Us.name_Contact_Us, Contact_Us.mail_Contact_Us, Contact_Us.phone_Contact_Us, Contact_Us.address_Contact_Us,  Contact_Us.text_Contact_Us, Contact_Us.reply_Contact_Us, Contact_Us.date_entry, Contact_Us.data_reply, JobTypes.TypeName, kind_m.name_kind_m FROM ((Contact_Us INNER JOIN kind_m ON Contact_Us.id_kind_m = kind_m.id_kind_m) INNER JOIN  JobTypes ON Contact_Us.Guest_Type = JobTypes.TypeID) WHERE (Contact_Us.id_Contact_Us = '" + TxtMSGSearchNo.Text + "')", MySchool.feedbackConnection);
        try
        {
            DA.Fill(DT);
            if (DT.Rows.Count != 0)
            {
                LblMSGNo.Text = DT.Rows[0]["id_Contact_Us"].ToString();
                LblSenderName.Text = DT.Rows[0]["name_Contact_Us"].ToString();
                LblSenderPhone.Text = DT.Rows[0]["phone_Contact_Us"].ToString();
                LblSenderMail.Text = DT.Rows[0]["mail_Contact_Us"].ToString();
                LblSenderType.Text = DT.Rows[0]["TypeName"].ToString();
                LblMSGDate.Text =  DT.Rows[0]["date_entry"].ToString();
                LblMSGType.Text = DT.Rows[0]["name_kind_m"].ToString();
                LblMSGTitle.Text = DT.Rows[0]["address_Contact_Us"].ToString();
                TxtMSGContain.Text = DT.Rows[0]["text_Contact_Us"].ToString();
                LblRpyDate.Text = DT.Rows[0]["data_reply"].ToString();
                TxtRpyContian.Text = DT.Rows[0]["reply_Contact_Us"].ToString();
                PnlMSG.Visible=true;
            }
            else
            {
                LblStatus.Text = "لا يوجد رساله بهذا الرقم";
                LblStatus.Visible = true;
                PnlMSG.Visible = false;
            }
        }
        catch (Exception ex)
        {
            LblStatus.Text =ex.Message.ToString();
            LblStatus.Visible = true;
        }
    }
    public void Cleartext()
    { 
        LblMSGNo.Text = "";
        LblSenderName.Text = "";
        LblSenderPhone.Text = "";
        LblSenderMail.Text = "";
        LblSenderType.Text = "";
        LblMSGDate.Text = "";
        LblMSGType.Text ="";
        LblMSGTitle.Text = "";
        TxtMSGContain.Text = "";
        LblRpyDate.Text = "";
        TxtRpyContian.Text = "";
    }
}
