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

public partial class UserControl_SBBorrow : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //TheSessions.StudentID = "32593100";
        DataTable DT = new DataTable("BorrowBooks");
        OleDbConnection AccessCon = MySchool.LibraryCodeConnection;
        OleDbCommand AccessCMD = new OleDbCommand("", AccessCon);
        try
        {
            if (TheSessions.StudentID != null)
            {
                //OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT estara.[number], book.name_book, estara.[date], estara.date_er, estara.date_f FROM (estara INNER JOIN book ON estara.[number] = book.[number]) WHERE (estara.code_name = " + TheSessions.StudentID + ")", MySchool.LibraryConnection);
                OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT estara.[number], book.name_book, estara.[date], estara.date_er, estara.date_f, book.code_printl, '' As name_printl, book.code_fari, '' As name_fari, book.code_tahasos, '' As name_tahasos, book.code_alnasher, '' As name_alnasher, (SELECT TOP 1 fm1 + ' ' + lm1 AS msl FROM masol WHERE ([number] = book.[number]) AND (k1 = 'مؤلف')) As masol FROM (estara INNER JOIN book ON estara.[number] = book.[number]) WHERE (estara.code_name = " + TheSessions.StudentID + ")", MySchool.LibraryConnection);
                AccessDA.Fill(DT);
            }

            AccessCon.Open();
            foreach (DataRow DR in DT.Rows)
            {
                if (DR["code_printl"].ToString() != string.Empty)
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


            GridViewBooks.DataSource = DT;
            ViewState["BorrowBooksTable"] = DT;
            GridViewBooks.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
    protected void GridViewBooks_SelectedIndexChanged(object sender, EventArgs e)
    {
        PanelBookDetials.Visible = true;
        if (GridViewBooks.SelectedIndex > -1)
        {
            DataTable DT = new DataTable("BorrowBooksTable");
            DT = (DataTable)ViewState["BorrowBooksTable"];
            SBBookDetials1.LoadData(GridViewBooks.SelectedIndex, DT);
        }
    }

}
