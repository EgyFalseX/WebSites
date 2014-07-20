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

public partial class UserControls_SBAddStuBook : System.Web.UI.UserControl
{
    string StuID = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.StudentID == null)
        {
            BtnAddBookInfo.Enabled = false;
        }
        else
        {
            StuID = TheSessions.StudentID.ToString();
        }
        //StuID = "1416002096";
    }
    protected void BtnAddBookInfo_Click(object sender, EventArgs e)
    {
        if (TxtBookName.Text.Length == 0)
        {
            LblError.Text = "من فضلك ادخل اسم الكتاب";
            LblError.ForeColor = System.Drawing.Color.Red;
            LblError.Visible = true;
        }
        OleDbConnection Con = MySchool.LibraryConnection;
        try
        {
            OleDbCommand CMD = new OleDbCommand("Insert INTO StuBooks (code_name, book_title, Owner, ReleaseDate, BookDetial) VALUES (" + StuID + ",'" + TxtBookName.Text + "','" + TxtBookOwner.Text + "',#" + TxtBookDate.Text + "#,'" + TxtBookDetial.Text + "')", Con);
            Con.Open();
            CMD.ExecuteNonQuery();
            LblError.Text = "تم اضافة الكتاب";
            LblError.ForeColor = System.Drawing.Color.Green;
            LblError.Visible = true;
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
