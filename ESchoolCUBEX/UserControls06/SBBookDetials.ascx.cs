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

public partial class UserControl_SBBookDetials : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public void LoadData(int IndexID, DataTable DT)
    {
        //DataTable DT = new DataTable("SearchedBooksTable");
        //DT = (DataTable)ViewState["SearchedBooksTable"];
        ViewState["BookNumber"] = DT.Rows[IndexID]["number"].ToString();
        LblBookName.Text = DT.Rows[IndexID]["name_book"].ToString();
        LblBookLang.Text = DT.Rows[IndexID]["name_printl"].ToString();
        LblBookBran.Text = DT.Rows[IndexID]["name_fari"].ToString();
        LblBookDep.Text = DT.Rows[IndexID]["name_tahasos"].ToString();
        LblBookPre.Text = DT.Rows[IndexID]["name_alnasher"].ToString();
        LblBookOwner.Text = DT.Rows[IndexID]["masol"].ToString();
    }
    protected void BtnReserve_Click(object sender, EventArgs e)
    {
        LblStatus.Visible = false;
        if (ViewState["BookNumber"] != null)
        {
            OleDbConnection Con = MySchool.LibraryConnection;
            OleDbCommand Cmd = new OleDbCommand("INSERT INTO estara (code_name, SPOS, asase_code, [date], [number]) VALUES (" + TheSessions.StudentID + ", " + Login.CurrentSchool + ", " + Login.CurrentYear + ", #" + DateTime.Today.ToShortDateString() + "#, " + ViewState["BookNumber"].ToString() + ")", Con);
            try
            {
                Con.Open();
                Cmd.ExecuteNonQuery();
                LblStatus.Text = "تم الاستعاره";
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible = true;
            }
            catch (Exception ex)
            {
                LblStatus.Text = ex.Message;
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible = true;
            }
            Con.Close();
        }
    }
}
