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

public partial class UserControls_SBResearchSearch : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        PnlResearchDetial.Visible = false;
        OleDbDataAdapter AccessDA;
        OleDbConnection AccessCon = MySchool.LibraryConnection;
        OleDbConnection AccessServiesCon = MySchool.ServicesConnection;
        OleDbCommand AccessCMD = new OleDbCommand("", AccessServiesCon);
        DataTable DT = new DataTable("SearchedBooksTable");
        if (TxtSearchText.Text.Length == 0)
        {
            LblError.Visible = true;
            return;
        }
        AccessDA = new OleDbDataAdapter("SELECT search1.search_code, search1.code_name, search.[date], search.subject, search.aim_search, 'nothing' AS Owner FROM (search1 INNER JOIN search ON search1.search_code = search.search_code) WHERE (search.subject LIKE '%" + TxtSearchText.Text + "%')", MySchool.LibraryConnection);
        AccessDA.Fill(DT);
        AccessServiesCon.Open();
        foreach (DataRow DR in DT.Rows)
        {
            AccessCMD.CommandText = "SELECT TOP 1 stu_name FROM stu WHERE (stu_code LIKE '%" + DR["code_name"].ToString() + "%')";
            DR["Owner"] = AccessCMD.ExecuteScalar().ToString();
        }
        AccessServiesCon.Close();
        try
        {
            LBBooksResult.DataSource = DT;
            ViewState["SearchedBooksTable"] = DT;
            LBBooksResult.DataTextField = "subject";
            LBBooksResult.DataValueField = "search_code";
            LBBooksResult.DataBind();
        }
        catch (Exception ex)
        {
            LblError.Text = ex.Message.ToString();
            LblError.Visible = true;   
        }
    }
    protected void LBBooksResult_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (LBBooksResult.SelectedIndex == -1)
        {
            PnlResearchDetial.Visible = false;
            return;
        }
        DataTable DT = (DataTable)ViewState["SearchedBooksTable"];
        LblReOwner.Text = DT.Rows[LBBooksResult.SelectedIndex][5].ToString();
        LblReSubject.Text = DT.Rows[LBBooksResult.SelectedIndex][3].ToString();
        LblReDate.Text = DT.Rows[LBBooksResult.SelectedIndex][2].ToString();
        TxtReAim.Text = DT.Rows[LBBooksResult.SelectedIndex][4].ToString();
        PnlResearchDetial.Visible = true;
    }
    
}