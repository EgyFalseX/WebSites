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

public partial class AUMenuEditor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Quality Assurance
            OleDbConnection Con = MySchool.feedbackConnection;
            OleDbCommand CMD = new OleDbCommand("SELECT Show_Hide FROM About_Us ORDER BY About_Us_ID", Con);
            OleDbDataReader DR;
            try
            {
                Con.Open();
                DR = CMD.ExecuteReader();
                DR.Read(); // Reading ID1
                if (DR.GetValue(0).ToString() == "1") { C1.Checked = true; }
                DR.Read(); // Reading ID2
                if (DR.GetValue(0).ToString() == "1") { C2.Checked = true; }
                DR.Read(); // Reading ID3
                if (DR.GetValue(0).ToString() == "1") { C3.Checked = true; }
                DR.Read(); // Reading ID4
                if (DR.GetValue(0).ToString() == "1") { C4.Checked = true; }
                DR.Read(); // Reading ID5
                if (DR.GetValue(0).ToString() == "1") { C5.Checked = true; }
                DR.Read(); // Reading ID6
                if (DR.GetValue(0).ToString() == "1") { C6.Checked = true; }
                DR.Read(); // Reading ID7
                if (DR.GetValue(0).ToString() == "1") { C7.Checked = true; }
            }
            catch (Exception ex)
            {
                LblError.Text = ex.Message.ToString();
                LblError.ForeColor = System.Drawing.Color.Red;
                LblError.Visible = true;
            }
            Con.Close();
        }
    }
    protected void CX_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox TheSender = (CheckBox)sender;
        string EffectedID = TheSender.ID.ToString().Substring(1);
        string Show_Hide_Value = "0";
        if (TheSender.Checked)
        {
            Show_Hide_Value = "1";
        }
        OleDbConnection Con = MySchool.feedbackConnection;
        OleDbCommand CMD = new OleDbCommand("Update About_Us Set Show_Hide = " + Show_Hide_Value + " Where About_Us_ID = " + EffectedID, Con);
        try
        {
            Con.Open();
            CMD.ExecuteNonQuery();
            LblError.Visible = false;
        }
        catch (Exception ex)
        {
            LblError.Text = ex.Message.ToString();
            LblError.ForeColor = System.Drawing.Color.Red;
            LblError.Visible = true;
        }
        Con.Close();
    }
    

}
