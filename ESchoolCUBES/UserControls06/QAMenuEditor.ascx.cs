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

public partial class QAMenuEditor : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Quality Assurance
            OleDbConnection Con = MySchool.QAConnection;
            OleDbCommand CMD = new OleDbCommand("SELECT Show_Hide FROM QAMenu ORDER BY QAID", Con);
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
                DR.Read(); // Reading ID8
                if (DR.GetValue(0).ToString() == "1") { C8.Checked = true; }
                DR.Read(); // Reading ID9
                if (DR.GetValue(0).ToString() == "1") { C9.Checked = true; }
                DR.Read(); // Reading ID10
                if (DR.GetValue(0).ToString() == "1") { C10.Checked = true; }
                DR.Read(); // Reading ID11
                if (DR.GetValue(0).ToString() == "1") { C11.Checked = true; }
                DR.Read(); // Reading ID12
                if (DR.GetValue(0).ToString() == "1") { C12.Checked = true; }
                DR.Read(); // Reading ID13
                if (DR.GetValue(0).ToString() == "1") { C13.Checked = true; }
                DR.Read(); // Reading ID14
                if (DR.GetValue(0).ToString() == "1") { C14.Checked = true; }
                DR.Read(); // Reading ID15
                if (DR.GetValue(0).ToString() == "1") { C15.Checked = true; }
                DR.Read(); // Reading ID16
                if (DR.GetValue(0).ToString() == "1") { C16.Checked = true; }
                DR.Read(); // Reading ID17
                if (DR.GetValue(0).ToString() == "1") { C17.Checked = true; }
                DR.Read(); // Reading ID18
                if (DR.GetValue(0).ToString() == "1") { C18.Checked = true; }
                DR.Read(); // Reading ID19
                if (DR.GetValue(0).ToString() == "1") { C19.Checked = true; }
                DR.Read(); // Reading ID20
                if (DR.GetValue(0).ToString() == "1") { C20.Checked = true; }
                DR.Read(); // Reading ID21
                if (DR.GetValue(0).ToString() == "1") { C21.Checked = true; }
                DR.Read(); // Reading ID22
                if (DR.GetValue(0).ToString() == "1") { C22.Checked = true; }
                DR.Read(); // Reading ID23
                if (DR.GetValue(0).ToString() == "1") { C23.Checked = true; }
                DR.Read(); // Reading ID24
                if (DR.GetValue(0).ToString() == "1") { C24.Checked = true; }
                DR.Read(); // Reading ID25
                if (DR.GetValue(0).ToString() == "1") { C25.Checked = true; }
                DR.Read(); // Reading ID26
                if (DR.GetValue(0).ToString() == "1") { C26.Checked = true; }
                DR.Read(); // Reading ID27
                if (DR.GetValue(0).ToString() == "1") { C27.Checked = true; }
                DR.Read(); // Reading ID28
                if (DR.GetValue(0).ToString() == "1") { C28.Checked = true; }
                DR.Read(); // Reading ID29
                if (DR.GetValue(0).ToString() == "1") { C29.Checked = true; }
                DR.Read(); // Reading ID30
                if (DR.GetValue(0).ToString() == "1") { C30.Checked = true; }
                DR.Read(); // Reading ID31
                if (DR.GetValue(0).ToString() == "1") { C31.Checked = true; }
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
        OleDbConnection Con = MySchool.QAConnection;
        OleDbCommand CMD = new OleDbCommand("Update QAMenu Set Show_Hide = " + Show_Hide_Value + " Where QAID = " + EffectedID, Con);
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
