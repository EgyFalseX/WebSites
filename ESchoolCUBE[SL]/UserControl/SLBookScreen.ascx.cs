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

public partial class UserControl_SLBookScreen : System.Web.UI.UserControl
{
    private DataTable DT;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (TheSessions.StudentID == null)
        {
            Response.Redirect("~/SLDoTheLogin.aspx");
            return;
        }
        if (Request.QueryString["id"] != null)
        {
            ViewState["id"] = Request.QueryString["id"].ToString();
            LoadBooks();
        }
        else
        {
            ViewState["id"] = "0";
            DT = new DataTable("GeneralTable");
            GridViewBooks.DataSource = DT;
            GridViewBooks.DataBind();
        }
    }
    public void LoadBooks()
    {
        try
        {
            DT = new DataTable("GeneralTable");
            OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT BookID, BookName, BookImage, BookLink, BookOwner, BookInfo, DownloadNo FROM Books WHERE (CatID = " + ViewState["id"].ToString() + ")", MySchool.SLConnection);
            AccessDA.Fill(DT);
            GridViewBooks.DataSource = DT;
            GridViewBooks.DataBind();
            ViewState["DT"] = DT;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
    protected void GridViewBooks_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        DataTable DT = (DataTable)ViewState["DT"];
        string BookID = DT.Rows[e.NewSelectedIndex]["BookID"].ToString();
        int DownloadNo = Convert.ToInt16(DT.Rows[e.NewSelectedIndex]["DownloadNo"].ToString()) + 1;
        string BookLink = DT.Rows[e.NewSelectedIndex]["BookLink"].ToString();
        OleDbConnection con = MySchool.SLConnection;
        OleDbCommand cmd = new OleDbCommand("", con);
        try
        {
            con.Open();
            cmd.CommandText = "Update Books Set DownloadNo =" + DownloadNo.ToString() + " Where BookID = " + BookID;
            cmd.ExecuteNonQuery();
            Response.Redirect(BookLink);
        }
        catch (OleDbException)
        {
            // put code to show error here
        }
        con.Close();
    }
}
