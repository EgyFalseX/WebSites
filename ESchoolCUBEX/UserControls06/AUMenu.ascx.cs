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
using System.IO;

public partial class AUMenu : System.Web.UI.UserControl
{
    //<asp:MenuItem Text="MName" Value="MValue"></asp:MenuItem>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            OleDbConnection Con = MySchool.feedbackConnection;
            OleDbCommand CMD = new OleDbCommand("SELECT Show_Hide FROM About_Us ORDER BY About_Us_ID", Con);
            OleDbDataReader DR;
            try
            {
                Con.Open();
                DR = CMD.ExecuteReader();
                DR.Read(); // Reading ID1
                if (DR.GetValue(0).ToString() == "0") { AUMainMenu.Items[0].Enabled = false; }
                DR.Read(); // Reading ID2
                if (DR.GetValue(0).ToString() == "0") { AUMainMenu.Items[1].Enabled = false; }
                DR.Read(); // Reading ID3
                if (DR.GetValue(0).ToString() == "0") { AUMainMenu.Items[2].Enabled = false; }
                DR.Read(); // Reading ID4
                if (DR.GetValue(0).ToString() == "0") { AUMainMenu.Items[3].Enabled = false; }
                DR.Read(); // Reading ID5
                if (DR.GetValue(0).ToString() == "0") { AUMainMenu.Items[4].Enabled = false; }
                DR.Read(); // Reading ID6
                if (DR.GetValue(0).ToString() == "0") { AUMainMenu.Items[5].Enabled = false; }
                DR.Read(); // Reading ID7
                if (DR.GetValue(0).ToString() == "0") { AUMainMenu.Items[6].Enabled = false; }
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
        if (AUMainMenu.SelectedValue == "")
        {
            return "";
        }
        string ThePath = string.Empty;
        string RetData = string.Empty;
        OleDbConnection Con = MySchool.feedbackConnection;
        OleDbCommand CMD = new OleDbCommand("SELECT About_Us_Menu_Link FROM About_Us WHERE (About_Us_ID = " + AUMainMenu.SelectedValue.ToString() + ")", Con);
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
