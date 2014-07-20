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

public partial class UserControl_SBBorrow : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable DT = new DataTable("BorrowBooks");
        try
        {
            if (TheSessions.StudentID != null)
            {
                OleDbDataAdapter AccessDA = new OleDbDataAdapter("SELECT estara.[number], book.name_book, estara.[date], estara.date_er, estara.date_f FROM (estara INNER JOIN book ON estara.[number] = book.[number]) WHERE (estara.code_name = " + TheSessions.StudentID + ")", MySchool.LibraryConnection);
                AccessDA.Fill(DT);
            }
            GridViewBooks.DataSource = DT;
            ViewState["BorrowBooksTable"] = DT;
            GridViewBooks.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
}
