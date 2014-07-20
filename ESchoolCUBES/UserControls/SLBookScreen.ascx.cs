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

public partial class UserControl_SLBookScreen : System.Web.UI.UserControl
{
    private DataTable DT;
    protected void Page_Load(object sender, EventArgs e)
    {
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
            OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT BookName, BookImage, BookLink, BookOwner, BookInfo FROM Books WHERE (CatID = " + ViewState["id"].ToString() + ")", MySchool.SLConnection);
            AccessDA.Fill(DT);
            GridViewBooks.DataSource = DT;
            GridViewBooks.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
}
