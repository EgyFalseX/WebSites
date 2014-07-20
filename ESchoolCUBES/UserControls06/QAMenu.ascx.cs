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
using System.IO;

public partial class QAMeny : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            OleDbConnection Con = MySchool.QAConnection;
            OleDbCommand CMD = new OleDbCommand("SELECT Show_Hide FROM QAMenu ORDER BY QAID", Con);
            OleDbDataReader DR;
            try
            {
                Con.Open();
                DR = CMD.ExecuteReader();
                DR.Read(); // Reading ID1
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[0].Enabled = false; }
                DR.Read(); // Reading ID2
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].Enabled = false; }
                DR.Read(); // Reading ID3
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[0].Enabled=false; }
                DR.Read(); // Reading ID4
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[1].Enabled = false; }
                DR.Read(); // Reading ID5
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[2].Enabled = false; }
                DR.Read(); // Reading ID6
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[3].Enabled = false; }
                DR.Read(); // Reading ID7
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[4].Enabled = false; }
                DR.Read(); // Reading ID8
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[5].Enabled = false; }
                DR.Read(); // Reading ID9
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[6].Enabled = false; }
                DR.Read(); // Reading ID10
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[7].Enabled = false; }
                DR.Read(); // Reading ID11
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[1].ChildItems[8].Enabled = false; }
                DR.Read(); // Reading ID12
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[2].Enabled = false; }
                DR.Read(); // Reading ID13
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[3].Enabled = false; }
                DR.Read(); // Reading ID14
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].Enabled = false; }
                DR.Read(); // Reading ID15
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[0].Enabled = false; }
                DR.Read(); // Reading ID16
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[0].ChildItems[0].Enabled = false; }
                DR.Read(); // Reading ID17
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[0].ChildItems[1].Enabled = false; }
                DR.Read(); // Reading ID18
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[0].ChildItems[2].Enabled = false; }
                DR.Read(); // Reading ID19
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[0].ChildItems[3].Enabled = false; }
                DR.Read(); // Reading ID20
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[0].ChildItems[4].Enabled = false; }
                DR.Read(); // Reading ID21
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[1].Enabled = false; }
                DR.Read(); // Reading ID22
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[1].ChildItems[0].Enabled = false; }
                DR.Read(); // Reading ID23
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[1].ChildItems[1].Enabled = false; }
                DR.Read(); // Reading ID24
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[1].ChildItems[2].Enabled = false; }
                DR.Read(); // Reading ID25
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[1].ChildItems[3].Enabled = false; }
                DR.Read(); // Reading ID26
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[4].ChildItems[2].Enabled = false; }
                DR.Read(); // Reading ID27
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[5].Enabled = false; }
                DR.Read(); // Reading ID28
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[6].Enabled = false; }
                DR.Read(); // Reading ID29
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[7].Enabled = false; }
                DR.Read(); // Reading ID30
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[8].Enabled = false; }
                DR.Read(); // Reading ID31
                if (DR.GetValue(0).ToString() == "0") { QAMainMenu.Items[9].Enabled = false; }
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

    public string LoadContain()
    {
        if (QAMainMenu.SelectedValue == "")
        {
            return "";
        }
        string ThePath = string.Empty;
        string RetData = string.Empty;
        OleDbConnection Con = MySchool.QAConnection;
        OleDbCommand CMD = new OleDbCommand("SELECT Data_Path FROM QAMenu WHERE (QAID = " + QAMainMenu.SelectedValue.ToString() + ")", Con);
        try
        {
            Con.Open();
            ThePath = CMD.ExecuteScalar().ToString();
            if (ThePath != string.Empty)
            {
                ThePath = MapPath(ThePath);
            }
            if (File.Exists(ThePath))
            {
                TextReader TR = new StreamReader(ThePath);
                RetData = TR.ReadToEnd();
            }
        }
        catch (Exception ex)
        {
            RetData = ex.Message;
        }
        Con.Close();
        return RetData;
    }
}
