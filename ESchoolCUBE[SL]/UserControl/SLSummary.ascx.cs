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

public partial class UserControl_SLSummary : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LblStatus.Visible = false;
        OleDbConnection Con = MySchool.SLConnection;
        OleDbCommand CMD = new OleDbCommand("SELECT Count(CatID) FROM Categories", Con);
        try
        {
            Con.Open();
            LblCatCount.Text = CMD.ExecuteScalar().ToString();
            CMD = new OleDbCommand("SELECT Count(BookID) FROM Books", Con);
            LblBookCount.Text = CMD.ExecuteScalar().ToString();
        }
        catch (Exception ex)
        {
            LblStatus.Text = ex.Message.ToString();
            LblStatus.ForeColor = System.Drawing.Color.Red;
            LblStatus.Visible= true;
        }
        Con.Close();
    }
}
