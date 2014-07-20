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

public partial class UserControl_SBBooksSearch : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        if (TxtSearchText.Text.Length == 0)
        {
            LblError.Visible = true;
            return;
        }
        else
        {
            LblError.Visible = false;
            SearchForBook();
        }

    }
    public void SearchForBook()
    {
        OleDbDataAdapter AccessDA;
        OleDbConnection AccessCon = MySchool.LibraryCodeConnection;
        OleDbCommand AccessCMD = new OleDbCommand("", AccessCon);
        DataTable DT = new DataTable("SearchedBooksTable");
        try
        {
            if (CBAllBooks.Checked)
            {
                AccessDA = new OleDbDataAdapter("SELECT [number], name_book, code_printl, 'A' AS name_printl, code_fari, 'B' AS name_fari, code_tahasos,  'C' AS name_tahasos, code_alnasher, 'D' AS name_alnasher, (SELECT TOP 1 fm1 + ' ' + lm1 AS msl FROM masol WHERE ([number] = book.[number]) AND (k1 = 'مؤلف')) As masol FROM book", MySchool.LibraryConnection);
                AccessDA.Fill(DT);
            }
            else
            {
                switch (RBLBookSearch.SelectedValue)
                {
                    case "1":
                        AccessDA = new OleDbDataAdapter("SELECT [number], name_book, code_printl, 'A' AS name_printl, code_fari, 'B' AS name_fari, code_tahasos,  'C' AS name_tahasos, code_alnasher, 'D' AS name_alnasher, (SELECT TOP 1 fm1 + ' ' + lm1 AS msl FROM masol WHERE ([number] = book.[number]) AND (k1 = 'مؤلف')) As masol FROM book Where name_book Like '%" + TxtSearchText.Text + "%'", MySchool.LibraryConnection);
                        AccessDA.Fill(DT);
                        break;
                    case "2":
                        AccessDA = new OleDbDataAdapter("SELECT [number], name_book, code_printl, 'A' AS name_printl, code_fari, 'B' AS name_fari, code_tahasos,  'C' AS name_tahasos, code_alnasher, 'D' AS name_alnasher, (SELECT TOP 1 fm1 + ' ' + lm1 AS msl FROM masol WHERE ([number] = book.[number]) AND (k1 = 'مؤلف')) As masol FROM book Where [number] Like '%" + TxtSearchText.Text + "%'", MySchool.LibraryConnection);
                        AccessDA.Fill(DT);
                        break;
                    case "3":
                        AccessDA = new OleDbDataAdapter("SELECT [number], (Select name_book From book Where masol.[number] = book.[number]) As name_book, (Select code_printl From book Where masol.[number] = book.[number]) As code_printl, 'A' AS name_printl, (Select code_fari From book Where masol.[number] = book.[number]) As code_fari, 'B' AS name_fari, (Select code_tahasos From book Where masol.[number] = book.[number]) As code_tahasos,  'C' AS name_tahasos, (Select code_alnasher From book Where masol.[number] = book.[number]) As code_alnasher, 'D' AS name_alnasher, fm1 + ' ' + lm1 AS masol FROM masol WHERE (fm1 LIKE '*" + TxtSearchText.Text + "*') AND (k1 = 'مؤلف') OR (lm1 LIKE '%" + TxtSearchText.Text + "%') AND (k1 = 'مؤلف')", MySchool.LibraryConnection);
                        AccessDA.Fill(DT);
                        break;
                }
            }
            AccessCon.Open();
            foreach (DataRow DR in DT.Rows)
            {
                if (DR["code_printl"].ToString() != string.Empty )
                {
                    AccessCMD.CommandText = "Select name_printl from printl Where code_printl = " + DR["code_printl"].ToString();
                    DR["name_printl"] = AccessCMD.ExecuteScalar();
                }
                else { DR["name_printl"] = string.Empty; }

                if (DR["code_fari"].ToString() != string.Empty)
                {
                    AccessCMD.CommandText = "Select name_fari from fari Where code_fari = " + DR["code_fari"].ToString();
                    DR["name_fari"] = AccessCMD.ExecuteScalar();
                }
                else
                { DR["name_fari"] = string.Empty; }
                if (DR["code_tahasos"].ToString() != string.Empty)
                {
                    AccessCMD.CommandText = "Select name_tahasos from tahasos Where code_tahasos = " + DR["code_tahasos"].ToString();
                    DR["name_tahasos"] = AccessCMD.ExecuteScalar();
                }
                else
                { DR["name_tahasos"] = string.Empty; }
                if (DR["code_alnasher"].ToString() != string.Empty)
                {
                    AccessCMD.CommandText = "Select name_alnasher from alnasher Where code_alnasher = " + DR["code_alnasher"].ToString();
                    DR["name_alnasher"] = AccessCMD.ExecuteScalar();
                }
                else
                { DR["name_alnasher"] = string.Empty; }
            }
            AccessCon.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
            AccessCon.Close();
        }
        LBBooksResult.DataSource = DT;
        ViewState["SearchedBooksTable"] = DT;
        LBBooksResult.DataTextField = "name_book";
        LBBooksResult.DataValueField = "number";
        LBBooksResult.DataBind();
        if (LBBooksResult.Items.Count > 0)
        {
            LBBooksResult.SelectedIndex = 0;
            SBBookDetials1.Visible = true;
        }
        else
        {
            SBBookDetials1.Visible = false;
        }
    }
    protected void CBAllBooks_CheckedChanged(object sender, EventArgs e)
    {
        if (CBAllBooks.Checked)
        {
            TxtSearchText.Enabled = false;
        }
        else
        {
            TxtSearchText.Enabled = true;
        }
    }
    protected void LBBooksResult_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (LBBooksResult.SelectedIndex > -1)
        {
            DataTable DT = new DataTable("SearchedBooksTable");
            DT = (DataTable)ViewState["SearchedBooksTable"];
            SBBookDetials1.LoadData(LBBooksResult.SelectedIndex, DT);
            //Response.Redirect(Request.CurrentExecutionFilePath.ToString() + "?bookid=" + LBBooksResult.SelectedIndex);

        }
    }

}
